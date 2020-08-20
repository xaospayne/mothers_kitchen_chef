import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/users.dart';
import '../services/database.dart';
import '../widgets/loading_spinner.dart';
import '../constants.dart';

class KitchenUpdateForm extends StatefulWidget {
  @override
  _KitchenUpdateFormState createState() => _KitchenUpdateFormState();
}

class _KitchenUpdateFormState extends State<KitchenUpdateForm> {
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
  final _formKey = GlobalKey<FormState>();

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
                        TextFormField(
                          enabled: false,
                          initialValue: userData.kitchenId,
                          decoration: kTextFormFieldDecoration,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            initialValue: userData.chefKitchenName,
                            decoration: kTextFormFieldDecoration,
                            validator: (val) => val.isEmpty
                                ? 'Please enter your Kitchen Name'
                                : null,
                            onChanged: (val) =>
                                setState(() => chefCurrentMobile = val)),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          enabled: false,
                          initialValue: userData.chefKitchenRating.toString(),
                          decoration: kTextFormFieldDecoration,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                            initialValue: userData.chefGstNo,
                            decoration: kTextFormFieldDecoration,
                            validator: (val) => val.isEmpty
                                ? 'Please enter your GST No.'
                                : null,
                            onChanged: (val) =>
                                setState(() => chefCurrentGstNo = val)),
                        SizedBox(
                          height: 10,
                        ),
                        RaisedButton(
                            child: Text('Save'),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                await DatabaseService(uid: user.uid)
                                    .updateChefKitchenDataCollection(
                                        chefCurrentName ?? userData.chefName,
                                        chefCurrentEmailAddress ??
                                            userData.chefEmailAddress,
                                        chefCurrentAltEmailAddress ??
                                            userData.chefAltEmailAddress,
                                        chefCurrentMobile ??
                                            userData.chefMobile,
                                        chefCurrentAltMobile ??
                                            userData.chefAltMobile,
                                        chefCurrentAddress ??
                                            userData.chefAddress,
                                        chefCurrentLocationCoordinates ??
                                            userData.chefLocationCoordinates,
                                        chefCurrentAdhaarCard ??
                                            userData.chefAdhaarCard,
                                        chefCurrentPanCard ??
                                            userData.chefPanCard,
                                        chefCurrentProfileImageUrl ??
                                            userData.chefProfileImageUrl,
                                        chefCurrentBankName ??
                                            userData.chefBankName,
                                        chefCurrentBankAccountNo ??
                                            userData.chefBankAccountNo,
                                        chefCurrentIfscCode ??
                                            userData.chefIfscCode,
                                        chefCurrentUpiId ?? userData.chefUpiId,
                                        chefCurrentKitchenName ??
                                            userData.chefKitchenName,
                                        kitchenCurrentImageUrl ??
                                            userData.kitchenImageUrl,
                                        kitchenCurrentId ?? userData.kitchenId,
                                        chefCurrentGstNo ?? userData.chefGstNo,
                                        chefCurrentKitchenRating ??
                                            userData.chefKitchenRating,
                                        currentDishName ?? userData.dishName,
                                        currentDishId ?? userData.dishId,
                                        currentDishDescription ??
                                            userData.dishDescription,
                                        currentDishIngredients ??
                                            userData.dishIngredients,
                                        currentDishCost ?? userData.dishCost,
                                        currentDishType ?? userData.dishType,
                                        currentDishRating ??
                                            userData.dishRating,
                                        currentDishSpicyRating ??
                                            userData.dishSpicyRating,
                                        currentDishImageUrl ??
                                            userData.dishImageUrl);
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
