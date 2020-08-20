import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/models/ckdatacollectionmodel.dart';
import 'package:mothers_kitchen_chef/widgets/icon_button.dart';
import 'package:provider/provider.dart';
import '../pages/app_drawer.dart';
import '../services/database.dart';
import 'account_list.dart';

class AccountPage extends StatefulWidget {
  static const routeName = 'account-page';
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
          child: Text('Bottom Sheet'),
        );
      });
    }
    return StreamProvider<List<CkDataCollectionsModel>>.value(
    value: DatabaseService().ckDataCollection,
      child: Scaffold(
        appBar: AppBar(
        title: Text('My Accounts'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _showSettingsPanel,
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child:AccountList(),

        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
