import 'dart:io';
import 'package:mothers_kitchen_chef/profile/profile_tile.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../models/ckdatacollectionmodel.dart';


class ProfileList extends StatefulWidget {
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
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
                  return ProfileTile(ckDataCollectionsModels:ckDataCollectionItem[index]);
                }
        ),
      ),
    );

  }
}

    /*Padding(
      padding: EdgeInsets.only(top: 8),
      child: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              ImageInput(_selectImage),
              SizedBox(
                height: 10,
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    */
    /*TextFormField(
                      enabled: false,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Your Full Name'),
                    ),*/
    /*
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Your Mobile Number'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Your Complete Address'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );*/
    /*
ListView.builder(
itemCount: ckDataCollectionItem.length -1,
itemBuilder: (context, index){
return ProfileTile(ckDataCollectionsModel: ckDataCollectionItem[index]);
},
);*/
