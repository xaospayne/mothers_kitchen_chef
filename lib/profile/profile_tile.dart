import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/models/ckdatacollectionmodel.dart';


class ProfileTile extends StatelessWidget {
  final CkDataCollectionsModel ckDataCollectionsModels;
  ProfileTile({this.ckDataCollectionsModels});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: Image.network(ckDataCollectionsModels.chefProfileImageUrl),
        ),
        Text(ckDataCollectionsModels.chefName),
        Text(ckDataCollectionsModels.chefMobile),
        Text(ckDataCollectionsModels.chefAltMobile),
        Text(ckDataCollectionsModels.chefEmailAddress),
        Text(ckDataCollectionsModels.chefAltEmailAddress),
        Text(ckDataCollectionsModels.chefAdhaarCard),
        Text(ckDataCollectionsModels.chefPanCard),
        Text(ckDataCollectionsModels.chefAddress),
        Text(ckDataCollectionsModels.chefLocationCoordinates),
      ],
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
                    Text()
                    TextFormField(
                      enabled: false,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter Your Full Name'),
                    ),
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
