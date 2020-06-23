import 'package:flutter/material.dart';
import '../icons/HomePageIcons.dart';

class Boxes extends StatelessWidget {
  final Icon boxIcon;
  final String name;

  const Boxes({Key key, @required this.boxIcon,@required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      
      margin: EdgeInsets.all(6),
          
      decoration: new BoxDecoration(
        color: Colors.grey[200],
        boxShadow: [
          new BoxShadow(
              color: Colors.black,
              offset: new Offset(0.0, 0.0),
              blurRadius: 10.0,
              spreadRadius: 1.5)
        ],
      ),
      child: RotationTransition(
        turns: AlwaysStoppedAnimation(-45 / 360),
        child: IconButton(
          icon: boxIcon,
          iconSize: 65,
          disabledColor: Colors.black,
          onPressed: () {
            print(name);
            Navigator.pushNamed(context, '/loadingPage', arguments: {
              'pressedCategorie': name
            });
          },
        ),
      ),
      
    );
  }
}

class HomeTable extends StatelessWidget {
  const HomeTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: FlexColumnWidth(1.1),
      children: [
      TableRow(
        children: [
        TableCell(
          child: Boxes(boxIcon:Icon(Icons.favorite),name: "favoris")
        ),
        TableCell(
          child: Container(
            margin: EdgeInsets.all(5),
            width: 80.0,
            height: 12.0,
            color: Colors.transparent,
          ),),
        TableCell(
          child: Container(
            margin: EdgeInsets.all(5),
            width: 80.0,
            height: 12.0,
            color: Colors.transparent,
          ),
        ),
      ]),
      TableRow(children: [
        TableCell(
          child: Boxes(boxIcon:Icon(MyFlutterApp.i010_burger),name: "burger",)
        ),
        TableCell(
          child: Boxes(boxIcon:Icon(MyFlutterApp.i049_breakfast),name: "breakfast")
        ),
        TableCell(
          child: Container(
            margin: EdgeInsets.all(5),
            width: 80.0,
            height: 12.0,
            color: Colors.transparent,
          ),
        ),
      ]),
      TableRow(children: [
        TableCell(
          child: Container(
            margin: EdgeInsets.all(5),
            width: 80.0,
            height: 120.0,
            color: Colors.transparent,
          ),
        ),
        TableCell(
          child: Boxes(boxIcon:Icon(MyFlutterApp.i023_pizza_slice),name: "pizza")
        ),
        TableCell(
          child: Boxes(boxIcon:Icon(MyFlutterApp.i043_chicken_leg),name: "chicken")
        ),
      ])
    ]);
  }
}