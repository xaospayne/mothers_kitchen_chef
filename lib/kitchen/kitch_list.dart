import 'dart:io';
import 'package:mothers_kitchen_chef/profile/profile_tile.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/ckdatacollectionmodel.dart';
import '../providers/great_places.dart';
import '../models/place.dart';
import 'kitchen_tile.dart';
class KitchenList extends StatefulWidget {
  @override
  _KitchenListState createState() => _KitchenListState();
}

class _KitchenListState extends State<KitchenList> {
  @override
  Widget build(BuildContext context) {
    final ckDataCollectionItem  = Provider.of<List<CkDataCollectionsModel>>(context)?? [];
    ckDataCollectionItem.forEach((ckDataCollectionsModel) {
      return ckDataCollectionsModel.chefName;
    });
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: ckDataCollectionItem.length,
            itemBuilder: (context, index){
              return KitchenTile(ckDataCollectionsModels:ckDataCollectionItem[index]);
            }
        ),
      ),
    );
  }
}
