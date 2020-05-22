import 'package:flutter/material.dart';
import 'package:pfe_flutter/widgets/CartItem.dart';
<<<<<<< HEAD
=======

>>>>>>> e998618ed39079cab2255021d3eb4c0541d94951


class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

<<<<<<< HEAD
class _CartState extends State<Cart> {
=======
class _CartPageState extends State<CartPage> {
>>>>>>> e998618ed39079cab2255021d3eb4c0541d94951
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body: Padding(
          padding: EdgeInsets.only(top: 45.0, left: 15.0, right: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Cart",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0)),
                ],
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    CartItem(),
                    CartItem(),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TOTAL",
                              style: Theme.of(context).textTheme.subtitle),
                          Text("USD. 899.01",
                              style: Theme.of(context).textTheme.headline),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        child: RaisedButton(
                          child: Text(
                            "CHECKOUT",
                            style: Theme.of(context).textTheme.button.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          onPressed: () {},
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}