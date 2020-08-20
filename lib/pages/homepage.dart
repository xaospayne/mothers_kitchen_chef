import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ckdatacollectionmodel.dart';
import '../services/auth_service.dart';
import '../pages/app_drawer.dart';
import '../services/database.dart';
import './app_drawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  List<BottomNavigationBarItem> _items;
  String _value = '';
  int _index = 0;

  @override
  void initState() {
  _items = List();
  _items.add(BottomNavigationBarItem(
      title: Text('Overview',
        style: TextStyle(fontSize: 15),
      ),
      icon: Icon(Icons.home),
  ),
  );
  _items.add(BottomNavigationBarItem(title: Text('My Orders',style: TextStyle(fontSize: 15),),icon: Icon(Icons.fastfood),),);
  _items.add(BottomNavigationBarItem(title: Text('My Kitchen',style: TextStyle(fontSize: 15),),icon: Icon(Icons.kitchen),),);
  _items.add(BottomNavigationBarItem(title: Text('My Profile',style: TextStyle(fontSize: 15),),icon: Icon(Icons.person),),);
  _items.add(BottomNavigationBarItem(title: Text('Messages',style: TextStyle(fontSize: 15),),icon: Icon(Icons.message),),);
  _items.add(BottomNavigationBarItem(title: Text('Assistance',style: TextStyle(fontSize: 15),),icon: Icon(Icons.live_help),),);
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CkDataCollectionsModel>>.value(
      value: DatabaseService().ckDataCollection,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Overview'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: ()async{await _auth.signOut();},
            ),
          ],
        ),
        drawer: AppDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
          unselectedItemColor: Colors.grey,
          fixedColor: Colors.orange,
          elevation: 10,
          iconSize: 30,
          currentIndex: _index,
          onTap: (int item){
              setState(() {
                _index = item;
                _value = 'Current Value is: ${_index.toString()}';
              });
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'No Data Generated',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}