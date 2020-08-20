import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/models/ckdatacollectionmodel.dart';


class AccountTile extends StatelessWidget {
  final CkDataCollectionsModel ckDataCollectionsModels;
  AccountTile({this.ckDataCollectionsModels});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(ckDataCollectionsModels.chefBankAccountNo),
        Text(ckDataCollectionsModels.chefIfscCode),
        Text(ckDataCollectionsModels.chefBankName),
        Text(ckDataCollectionsModels.chefUpiId),
      ],
    );
  }
}
