import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/models/ckdatacollectionmodel.dart';
import 'package:provider/provider.dart';
import '../services/database.dart';
import 'dishes_list.dart';

class DishesPage extends StatefulWidget {
  static const routeName = 'dishes_page';
  @override
  _DishesPageState createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CkDataCollectionsModel>>.value(
        value: DatabaseService().ckDataCollection,
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Dishes'),
            actions: <Widget>[
            ],
          ),
          body: DishesList(),
        ));
  }
}
