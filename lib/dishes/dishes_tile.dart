import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/models/ckdatacollectionmodel.dart';


class DishesTile extends StatelessWidget {
  final CkDataCollectionsModel ckDataCollectionsModels;
  DishesTile({this.ckDataCollectionsModels});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          child: Image.network(ckDataCollectionsModels.dishImageUrl),
        ),
        Text(ckDataCollectionsModels.dishId),
        Text(ckDataCollectionsModels.dishName),
        Text(ckDataCollectionsModels.dishDescription),
        Text(ckDataCollectionsModels.dishIngredients),
        Text(ckDataCollectionsModels.dishCost.toString()),
        Text (ckDataCollectionsModels.dishSpicyRating.toString()),
        Text(ckDataCollectionsModels.dishRating.toString()),
        Text(ckDataCollectionsModels.dishType),
      ],
    );
  }
}
