import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/widgets/icon_button.dart';

import '../pages/app_drawer.dart';

class MessagePage extends StatefulWidget {
  static const routeName = 'message-page';
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: _showSettingsPanel,
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Text('No Data Generated', style: TextStyle(fontSize: 20),))

          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
