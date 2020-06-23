import 'package:flutter/material.dart';
import 'package:pfe_flutter/widgets/SearchBar.dart';
import 'package:pfe_flutter/widgets/MyDrawer.dart';

class FoodPage extends StatefulWidget {
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  @override
  _FoodPageState createState() =>_FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  Map data = {};

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    data = ModalRoute.of(context).settings.arguments;
    print(data["pressedCategorie"]);
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.pushNamed(context, '/cartPage'),
        child: Icon(Icons.shopping_cart),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[
              IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white, size: 28.0,), onPressed: null)
            ],
            backgroundColor:Color(0),
            expandedHeight: 220.0,
            flexibleSpace: FlexibleSpaceBar(            
                background: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.0),bottomRight:Radius.circular(60.0)),
                    child: Image.asset(
                    'assets/images/burgerCover.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
            
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                child: SearchBar(),
              ),
              Text(
                'Popular',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
          SliverFixedExtentList(
              delegate: SliverChildListDelegate(data['menuCardList']), itemExtent: 240.0),
        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

// bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_box),
//             title: Text('Compte'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text('Accueil'),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.list),
//             title: Text('Commandes'),
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.orangeAccent,
//         onTap: _onItemTapped,
//       )