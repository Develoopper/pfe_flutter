import 'package:flutter/material.dart';
import 'package:pfe_flutter/widgets/CartItem.dart';


class CartPage extends StatefulWidget {

  static List<CartItem> cartItemList = List();

  static double cartTotalAmount() {
    double total = 0;
    for (var cartItem in cartItemList) {
      total += cartItem.menu.prix;
    }
    return total;
  }

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
                  children: CartPage.cartItemList,
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
                          Text(CartPage.cartTotalAmount().toString(),
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