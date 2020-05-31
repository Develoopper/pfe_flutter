import 'package:flutter/material.dart';
import 'package:pfe_flutter/classes/Menu.dart';
import 'package:pfe_flutter/widgets/Counter.dart';

class CartItem extends StatelessWidget {

  final Menu menu;

  CartItem({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10.0, top: 10.0),
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.elliptical(30.0, 30.0)),
            shape: BoxShape.rectangle,
          ),
          child: Image.asset(menu.image),
        ),
        Column(
          children: <Widget>[
            Text(menu.libellee,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
            Text(menu.prix.toString()),
            Counter(),
          ],
        ),
      ],
    );
  }
}