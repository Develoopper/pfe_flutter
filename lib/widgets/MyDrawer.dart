import 'package:flutter/material.dart';
import 'package:pfe_flutter/widgets/MyListTile.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                Colors.deepOrange,
                Colors.orangeAccent
              ])
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(70)),
                  child: Image.asset("assets/images/avatar.png"),
                ),
              ),
            )
          ),
          MyListTile(icon: Icons.home, text: "Accueil", onTap: null),
          Divider(),
          MyListTile(icon: Icons.person, text: "Compte", onTap: null),
          Divider(),
          MyListTile(icon: Icons.shopping_basket, text: "Commandes", onTap: null),
          Divider(),
          MyListTile(icon: Icons.edit_location, text: "Carnet d'adresses", onTap: null),
          Divider(),
          MyListTile(icon: Icons.settings, text: "Paramètres", onTap: null),
        ],
      ),
    );
  }
}