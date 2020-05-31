import 'package:flutter/material.dart';
import 'package:pfe_flutter/pages/CartPage.dart';
import 'package:pfe_flutter/widgets/CartItem.dart';
import '../classes/Menu.dart';
import 'package:pfe_flutter/widgets/CircleButton.dart';

class MenuCard extends StatelessWidget {

  final Menu menu;

  MenuCard({Key key, this.menu}) : super(key: key);

  List<Widget> stars() {
    List<Widget> starsList = List();
    for (var i = 0; i < menu.stars; i++) {
      starsList.add(Icon(Icons.star, color: Colors.orangeAccent, size: 16.0));
    }
    return starsList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: <Widget>[
            Container(
              width: 600.0,
              child: Image.network(
                menu.image,
                fit: BoxFit.fitWidth,
              )
            ),
            Positioned(
              top: 10,
              right: 10,
              child: CircleButton(
                onTap: () => CartPage.cartItemList.add(CartItem(menu: menu)),
                iconData: Icons.add_shopping_cart, 
                iconColor: Colors.orange
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: CircleButton(onTap: () => print("Cool"), iconData: Icons.favorite_border, iconColor: Colors.white,),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              width: 400.0,
              height: 60.0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black26])),
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              right: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        menu.libellee,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        children: stars() + <Widget>[
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        menu.prix.toStringAsFixed(0) + " Dh",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                      ),
                      Text(menu.duree.toString() + " min", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}