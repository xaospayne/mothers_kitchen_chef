import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/models/ckdatacollectionmodel.dart';

class KitchenTile extends StatelessWidget {
  final CkDataCollectionsModel ckDataCollectionsModels;
  KitchenTile({this.ckDataCollectionsModels});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          child: Image.network(ckDataCollectionsModels.kitchenImageUrl),
        ),
        Text(ckDataCollectionsModels.kitchenId),
        Text(ckDataCollectionsModels.chefKitchenName),
        Text(ckDataCollectionsModels.chefKitchenRating.toString()),
        Text(ckDataCollectionsModels.chefLocationCoordinates),
      ],
    );
  }
}
