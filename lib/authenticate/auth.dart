import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/authenticate/register.dart';
import '../authenticate/sign_in.dart';


class Auth extends StatefulWidget {
  static const routeName = 'auth-page';


  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  bool showSignIn = true;
  void  toggleView(){
  setState(() => showSignIn = !showSignIn);
}
  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(toggleView: toggleView);
    } else{
      return Register(toggleView: toggleView);
    }
  }
}
