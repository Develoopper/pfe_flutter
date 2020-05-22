import 'package:flutter/material.dart';
import 'Counter.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
  }) : super(key: key);

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
          child: Image.asset("assets/images/pizza.png"),
        ),
        Column(
          children: <Widget>[
            Text("Pizza Moyen",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
            Text("40Dhs TTC"),
            MyCounter(),
          ],
        ),
      ],
    );
  }
}