import 'package:flutter/material.dart';
import 'package:pfe_flutter/pages/CartPage.dart';
import 'package:pfe_flutter/widgets/CartItem.dart';
import '../classes/Menu.dart';
import 'package:pfe_flutter/widgets/CircleButton.dart';

class MenuCard extends StatefulWidget {

  final Menu menu;

  MenuCard({Key key, this.menu}) : super(key: key);

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  var favorite = false;

  List<Widget> stars() {
    List<Widget> starsList = List();
    for (var i = 0; i < widget.menu.stars; i++) {
      starsList.add(Icon(Icons.star, color: Colors.orangeAccent, size: 16.0));
    }
    return starsList;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {favorite = true;});
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: <Widget>[
            Container(
              width: 600.0,
              child: Image.network(
                widget.menu.image,
                fit: BoxFit.fitWidth,
              )
            ),
            Positioned(
              top: 10,
              right: 10,
              child: CircleButton(
                onTap: () => CartPage.cartItemList.add(CartItem(menu: widget.menu)),
                iconData: Icons.add_shopping_cart, 
                iconColor: Colors.orange
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: CircleButton(
                onTap: () => setState(() {favorite = true;}), 
                iconData: favorite == true ? Icons.favorite : Icons.favorite_border, 
                iconColor: Colors.white
              ),
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
                        widget.menu.libellee,
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
                        widget.menu.prix.toStringAsFixed(0) + " Dh",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                      ),
                      Text(widget.menu.duree.toString() + " min", style: TextStyle(color: Colors.grey))
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