import 'package:flutter/material.dart';


class ProfileUpdateForm extends StatelessWidget {
  const ProfileUpdateForm({
    Key key,
    @required GlobalKey<FormState> formKey,
  }) : _formKey = formKey, super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              TextFormField(),
              SizedBox(height: 10,),
              TextFormField(),
              SizedBox(height: 10,),
              TextFormField(),
              SizedBox(height: 10,),
              TextFormField(),
              SizedBox(height: 10,),
              TextFormField(),
              SizedBox(height: 10,),
              TextFormField(),
              SizedBox(height: 10,),
              TextFormField(),
              SizedBox(height: 10,),
              TextFormField(),
              SizedBox(height: 10,),
              TextFormField(),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
