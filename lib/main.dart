import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './pages/homepage.dart';
import './profile/profile_page.dart';
import './kitchen/kitchen_page.dart';
import './dishes/dishes_page.dart';
import './orders/order_page.dart';
import './accounts/account_page.dart';
import './messages/message_page.dart';
import './settings/settings_page.dart';

import './models/users.dart';
import './services/auth_service.dart';
import './authenticate/auth.dart';
import './pages/wrapper.dart';

void main() => runApp(MothersKitchenChef());

class MothersKitchenChef extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,]);
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mother\'s Kitchen Chef',
        theme: ThemeData(primarySwatch: Colors.orange, visualDensity: VisualDensity.adaptivePlatformDensity,),
        initialRoute: '/',
        routes: {
          Wrapper.routeName:(ctx)=> Wrapper(),
          HomePage.routeName:(ctx)=> HomePage(),
          ProfilePage.routeName:(ctx)=> ProfilePage(),
          KitchenPage.routeName:(ctx)=> KitchenPage(),
          DishesPage.routeName:(ctx)=>DishesPage(),
          OrdersPage.routeName:(ctx)=>OrdersPage(),
          AccountPage.routeName:(ctx)=>AccountPage(),
          MessagePage.routeName:(ctx)=>MessagePage(),
          SettingsPage.routeName:(ctx)=> SettingsPage(),
          Auth.routeName:(ctx)=> Auth(),
        },
        onUnknownRoute: (settings){return MaterialPageRoute(builder: (ctx) => HomePage(),);},
      ),
    );
  }
}
