import 'package:mothers_kitchen_chef/models/ckdatacollectionmodel.dart';
import 'package:mothers_kitchen_chef/profile/profile_form.dart';
import 'package:mothers_kitchen_chef/profile/profile_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = 'profile-page';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return ProfileUpdateForm();
      });
    }
    return StreamProvider<List<CkDataCollectionsModel>>.value(
      value: DatabaseService().ckDataCollection,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Profile'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: _showSettingsPanel,
            )
          ],
        ),
        body: ProfileList(),
      )
    );
  }
}
