import 'package:flutter/material.dart';
import 'package:mothers_kitchen_chef/dishes/dishes_page.dart';
import 'package:mothers_kitchen_chef/pages/wrapper.dart';
import '../kitchen/kitchen_page.dart';
import '../messages/message_page.dart';
import '../orders/order_page.dart';
import '../profile/profile_page.dart';
import '../settings/settings_page.dart';
import '../accounts/account_page.dart';
import 'package:mothers_kitchen_chef/models/ckdatacollectionmodel.dart';

class AppDrawer extends StatelessWidget {
  final CkDataCollectionsModel ckDataCollectionsModels;
  AppDrawer({this.ckDataCollectionsModels});

  Widget buildListTile(String title, IconData icon, Function tapHandler){
    return ListTile(
      title: Text(title,
        style:TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(icon,size: 20,),
      onTap: tapHandler,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            AppBar(title: Text('Hi There!'),automaticallyImplyLeading: false,),
            buildListTile('Home',Icons.home,(){Navigator.of(context).pushNamed(Wrapper.routeName);}),
            buildListTile('My Profile',Icons.account_box,(){Navigator.of(context).pushNamed(ProfilePage.routeName);}),
            buildListTile('My Kitchen',Icons.favorite,(){Navigator.of(context).pushNamed(KitchenPage.routeName);}),
            buildListTile('My Dishes',Icons.fastfood,(){Navigator.of(context).pushNamed(DishesPage.routeName);}),
            buildListTile('My Orders',Icons.fastfood,(){Navigator.of(context).pushNamed(OrdersPage.routeName);}),
            buildListTile('My Account',Icons.account_balance,(){Navigator.of(context).pushNamed(AccountPage.routeName);}),
            buildListTile('Messages',Icons.message,(){Navigator.of(context).pushNamed(MessagePage.routeName);}),
            buildListTile('Settings',Icons.settings,(){Navigator.of(context).pushNamed(SettingsPage.routeName);}),
            Divider(),
          ],
        )
    );
  }
}
