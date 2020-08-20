import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/authenticate/auth.dart';
import 'package:mothers_kitchen_chef/models/users.dart';
import 'package:mothers_kitchen_chef/pages/homepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if (user == null) {
      return Auth();
    } else{
      return HomePage();
    }
  }
}
