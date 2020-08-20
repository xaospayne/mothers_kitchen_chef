import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/ckdatacollectionmodel.dart';
import 'account_tile.dart';

class AccountList extends StatefulWidget {
  @override
  _AccountListState createState() => _AccountListState();
}

class _AccountListState extends State<AccountList> {
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
              return AccountTile(ckDataCollectionsModels:ckDataCollectionItem[index]);
            }
        ),
      ),
    );
  }
}

