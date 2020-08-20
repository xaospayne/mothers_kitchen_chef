import 'package:mothers_kitchen_chef/kitchen/kitchen_form.dart';
import 'package:mothers_kitchen_chef/models/ckdatacollectionmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import 'kitch_list.dart';

class KitchenPage extends StatefulWidget {
  static const routeName = 'kitchen-page';
  @override
  _KitchenPageState createState() => _KitchenPageState();
}

class _KitchenPageState extends State<KitchenPage> {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return KitchenUpdateForm();
      });
    }

    return StreamProvider<List<CkDataCollectionsModel>>.value(
        value: DatabaseService().ckDataCollection,
        child: Scaffold(
          appBar: AppBar(title: Text('My Kitchen'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: _showSettingsPanel,
              )
            ],
          ),
          body: KitchenList(),
        )
    );
  }
}
