import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/HomePageWidgets.dart';
import '../widgets/MyDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return Scaffold(
      drawer: MyDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
         
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
          iconSize: 30,
          color: Colors.grey[200],
          icon: Icon(Icons.person_outline),
          onPressed: (){Navigator.pushNamed(context,'/profilePage');},
        ), 
        ],

      ),
      body: Container(
        
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background1.jpg"),
              fit: BoxFit.fill,
              alignment: Alignment.center),
        ),
        child: RotationTransition(
          turns: AlwaysStoppedAnimation(45 / 360),
          child: Center(child: HomeTable()),
        ),
      ),
      /*Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background1.jpg"),
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Topbar(),
              SizedBox(
                height: 160,
              ),
              RotationTransition(
                 turns: AlwaysStoppedAnimation(45 / 360),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Boxes(boxIcon:Icon(Icons.favorite)),
                    ]),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 20,
                        ),
                        Boxes(boxIcon:Icon(MyFlutterApp.i010_burger)),
                        SizedBox(width: 20),
                        Boxes(boxIcon:Icon(MyFlutterApp.i049_breakfast)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 150),
                        Boxes(boxIcon:Icon(MyFlutterApp.i048_hot_dog)),
                        SizedBox(width: 20),
                        Boxes(boxIcon:Icon(MyFlutterApp.i043_chicken_leg)),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),*/
    );
  }
}
