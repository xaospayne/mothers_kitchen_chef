import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/helpers/location_helper.dart';
import 'package:mothers_kitchen_chef/pages/maps_page.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';
import '../services/database.dart';
import '../widgets/loading_spinner.dart';
import '../constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';

class ProfileUpdateForm extends StatefulWidget {
  @override
  _ProfileUpdateFormState createState() => _ProfileUpdateFormState();
}

class _ProfileUpdateFormState extends State<ProfileUpdateForm> {
  String chefCurrentProfileImageUrl;
  String chefCurrentName;
  String chefCurrentMobile;
  String chefCurrentAltMobile;
  String chefCurrentEmailAddress;
  String chefCurrentAltEmailAddress;
  String chefCurrentAdhaarCard;
  String chefCurrentPanCard;
  String chefCurrentAddress;
  String chefCurrentLocationCoordinates;
  String chefCurrentBankName;
  String chefCurrentBankAccountNo;
  String chefCurrentIfscCode;
  String chefCurrentUpiId;
  String chefCurrentKitchenName;
  String kitchenCurrentImageUrl;
  String kitchenCurrentId;
  String chefCurrentGstNo;
  int chefCurrentKitchenRating;
  String currentDishName;
  String currentDishId;
  String currentDishDescription;
  String currentDishIngredients;
  double currentDishCost;
  String currentDishType;
  int currentDishRating;
  int currentDishSpicyRating;
  String currentDishImageUrl;

  String previewImageUrl;
Future<void> _getCurrentUserLocation()async{
  final Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(position.latitude, position.longitude);
  setState(() {
 previewImageUrl = staticMapImageUrl;
});
}


  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();
  File _pickedImage;

  void _pickImage()async{
    final pickedImageFile = await ImagePicker.pickImage(source: ImageSource.gallery,imageQuality:75,maxWidth:500);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  Future<void>_selectOnMap() async{
    final selectedLocation = await Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MapScreen(isSelecting: true,)));
    if(selectedLocation == null) {
      return;
    }

  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return SingleChildScrollView(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      CircleAvatar(radius: 40,
                        backgroundImage: _pickedImage != null ? FileImage(_pickedImage): null,
                      ),
                      FlatButton.icon(
                        onPressed: _pickImage,
                        icon: Icon(Icons.image),
                        label: Text('Add Image',),),
                      SizedBox(height: 10,),
                      TextFormField(
                        initialValue: userData.chefName,
                        decoration: kTextFormFieldDecoration,
                        validator: (val) =>
                            val.isEmpty ? 'Please enter your full name' : null,
                        onChanged: (val) {
                          setState(() {
                            chefCurrentName = val;
                          });
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                          initialValue: userData.chefMobile,
                          decoration: kTextFormFieldDecoration,
                          validator: (val) => val.isEmpty
                              ? 'Please enter your mobile number'
                              : null,
                          onChanged: (val) =>
                              setState(() => chefCurrentMobile = val)),
                      SizedBox(height: 10,),
                      TextFormField(
                          initialValue: userData.chefAltMobile,
                          decoration: kTextFormFieldDecoration,
                          validator: (val) => val.isEmpty
                              ? 'Please enter an alternate mobile number'
                              : null,
                          onChanged: (val) =>
                              setState(() => chefCurrentAltMobile = val)),
                      SizedBox(height: 10,),
                      TextFormField(
                          initialValue: userData.chefEmailAddress,
                          decoration: kTextFormFieldDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Please enter your email' : null,
                          onChanged: (val) =>
                              setState(() => chefCurrentEmailAddress = val)),
                      SizedBox(height: 10,),
                      TextFormField(
                          initialValue: userData.chefAltEmailAddress,
                          decoration: kTextFormFieldDecoration,
                          validator: (val) => val.isEmpty
                              ? 'Please enter your alternate email'
                              : null,
                          onChanged: (val) =>
                              setState(() => chefCurrentAltEmailAddress = val)),
                      SizedBox(height: 10,),
                      TextFormField(
                          initialValue: userData.chefAdhaarCard,
                          decoration: kTextFormFieldDecoration,
                          validator: (val) => val.isEmpty
                              ? 'Please enter your Aadhaar details'
                              : null,
                          onChanged: (val) =>
                              setState(() => chefCurrentAdhaarCard = val)),
                      SizedBox(height: 10,),
                      TextFormField(
                          initialValue: userData.chefPanCard,
                          decoration: kTextFormFieldDecoration,
                          validator: (val) => val.isEmpty
                              ? 'Please enter your PAN card details'
                              : null,
                          onChanged: (val) =>
                              setState(() => chefCurrentPanCard = val)),
                      SizedBox(height: 10,),
                      TextFormField(
                          initialValue: userData.chefAddress,
                          decoration: kTextFormFieldDecoration,
                          validator: (val) => val.isEmpty
                              ? 'Please enter your home address'
                              : null,
                          onChanged: (val) =>
                              setState(() => chefCurrentAddress = val)),
                      SizedBox(height: 10,),
                      /*TextFormField(
                          initialValue: userData.chefLocationCoordinates,
                          decoration: kTextFormFieldDecoration,
                          validator: (val) => val.isEmpty
                              ? 'Please select your current location'
                              : null,
                          onChanged: (val) => setState(
                              () => chefCurrentLocationCoordinates = val)),*/
                      Container(
                        alignment: Alignment.center,
                        height: 150,
                        width: double.infinity,
                        child: previewImageUrl == null
                            ? Text(
                          'Please Select Your Current Location',
                          textAlign: TextAlign.center,
                        )
                            : Image.network(previewImageUrl,fit: BoxFit.cover,width: double.infinity,),
                      ),
                      SizedBox(height: 10,),
                      Row(children: <Widget>[
                        FlatButton.icon(
                          icon: Icon(Icons.location_on),
                          label: Text('Current Location'),
                          onPressed: _getCurrentUserLocation,
                            ),
                        FlatButton.icon(
                          icon: Icon(Icons.map),
                          label: Text('Select On Map'),
                          onPressed: _selectOnMap,
                        ),
                      ],),
                      SizedBox(height: 10,),
                      RaisedButton(
                          child: Text('Save'),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              final ref = FirebaseStorage.instance.ref().child('user_profileimage').child(userData.uid+'.jpg');
                              await ref.putFile(_pickedImage).onComplete;
                              final chefCurrentProfileImageUrl = await ref.getDownloadURL();
                              await DatabaseService(uid: user.uid)
                                  .updateChefKitchenDataCollection(
                                      chefCurrentName ?? userData.chefName,
                                      chefCurrentEmailAddress ?? userData.chefEmailAddress,
                                      chefCurrentAltEmailAddress ?? userData.chefAltEmailAddress,
                                      chefCurrentMobile ?? userData.chefMobile,
                                      chefCurrentAltMobile ?? userData.chefAltMobile,
                                      chefCurrentAddress ?? userData.chefAddress,
                                      chefCurrentLocationCoordinates ?? userData.chefLocationCoordinates,
                                      chefCurrentAdhaarCard ?? userData.chefAdhaarCard,
                                      chefCurrentPanCard ?? userData.chefPanCard,
                                      chefCurrentProfileImageUrl ?? userData.chefProfileImageUrl,
                                      chefCurrentBankName ?? userData.chefBankName,
                                      chefCurrentBankAccountNo ?? userData.chefBankAccountNo,
                                      chefCurrentIfscCode ?? userData.chefIfscCode,
                                      chefCurrentUpiId ?? userData.chefUpiId,
                                      chefCurrentKitchenName ?? userData.chefKitchenName,
                                      kitchenCurrentImageUrl ?? userData.kitchenImageUrl,
                                      kitchenCurrentId ?? userData.kitchenId,
                                      chefCurrentGstNo ?? userData.chefGstNo,
                                      chefCurrentKitchenRating ?? userData.chefKitchenRating,
                                      currentDishName ?? userData.dishName,
                                      currentDishId ?? userData.dishId,
                                      currentDishDescription ?? userData.dishDescription,
                                      currentDishIngredients ?? userData.dishIngredients,
                                      currentDishCost ?? userData.dishCost,
                                      currentDishType ?? userData.dishType,
                                      currentDishRating ?? userData.dishRating,
                                      currentDishSpicyRating ?? userData.dishSpicyRating,
                                      currentDishImageUrl ?? userData.dishImageUrl);
                              Navigator.pop(context);
                            }
                          }),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return LoadingSpinner();
          }
        });
  }
}
