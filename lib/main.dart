import 'package:flutter/material.dart';
import 'package:pfe_flutter/pages/FoodPage.dart';
import 'package:pfe_flutter/pages/HomePage.dart';
import 'package:pfe_flutter/pages/LoadingPage.dart';
import 'package:pfe_flutter/pages/CartPage.dart';
import 'package:pfe_flutter/pages/ProfilePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/loadingPage': (context) => LoadingPage(),
        '/foodPage': (context) => FoodPage(),
        '/cartPage': (context) => CartPage(),
        '/profilePage': (context) => ProfilePage(),
      }
    );
  }
}

  //Menu menu1 = new Menu(id: 1, libelle: "Chicken burger", type: "burger", prix: 50.0, stars: 4, image: "https://assets.afcdn.com/recipe/20191224/105747_w800h600c1cx2808cy1872cxt0cyt0cxb5616cyb3743.jpg");
  // Menu menu2 = new Menu(1,"Pizza 4 saisons", "pizza", 40.0, 3, "https://www.atelierdeschefs.com/media/recette-e16312-pizza-quatre-saisons.jpg");
  
  // for (var menu in menuList) {
  //   menuCardList.add(new MenuCard(menu: menu));
  // }
  // MenuCard c1 = MenuCard(menu: menu1);
  // MenuCard c2 = MenuCard(menu: menu2);
  // item.add(c1);
  // item.add(c2);