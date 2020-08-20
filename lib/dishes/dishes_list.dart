import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ckdatacollectionmodel.dart';
import 'dishes_tile.dart';


class DishesList extends StatefulWidget {
  @override
  _DishesListState createState() => _DishesListState();
}

class _DishesListState extends State<DishesList> {
  @override
  Widget build(BuildContext context) {
    final ckDataCollectionItem  = Provider.of<List<CkDataCollectionsModel>>(context) ?? [];
    ckDataCollectionItem.forEach((ckDataCollectionsModel) {
      return ckDataCollectionsModel.chefName;
    });
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: ckDataCollectionItem.length,
            itemBuilder: (context, index){
              return DishesTile(ckDataCollectionsModels:ckDataCollectionItem[index]);
            }
        ),
      ),
    );
  }
}
