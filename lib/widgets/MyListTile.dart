import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  MyListTile({this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        onTap: () {},
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(icon, size: 35),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(text, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}