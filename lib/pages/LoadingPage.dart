import 'package:flutter/material.dart';
import 'package:pfe_flutter/Services.dart';
import 'package:pfe_flutter/classes/Menu.dart';
import 'package:pfe_flutter/widgets/MenuCard.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  List<MenuCard> menuCardList = List();
  Map data = {};
  static bool firstLoading = false;

  void fillMenuCards() async {
    print("fillMenuCards");
    Menu.menuList = await Services.getMenus();
    print(Menu.menuList[1].libellee);

    //menuCardList.add(new MenuCard(menu: menu1));
    for (var menu in Menu.menuList) {
      menuCardList.add(new MenuCard(menu: menu));
    }
    //print(menuCardList[1].menu.libellee);
    data = ModalRoute.of(context).settings.arguments;
    //Navigator.pushReplacementNamed(context, '/cartPage');
    Navigator.pushReplacementNamed(context, '/foodPage', arguments: {
      'menuCardList': menuCardList,
      'pressedCategorie': data['pressedCategorie']
    });
  }

  void sendData() async {
    print("*sendData");
    //await Services.addMenu(4, "Hot dog", "Sandwish", 60.0, 5, "https://img-3.journaldesfemmes.fr/EnBOqIbquxzrhd5mUBBcYWxuC6k=/800x600/smart/7f89fdbac0064efd89ffefe57963f5e4/recipe-jdf/10027650.jpg", 10);
    await Services.getMenus();
    print("sendData*");
    Navigator.pushReplacementNamed(context, '/homePage');
  }

  @override
  void initState() {
    super.initState();
    if (firstLoading){
      firstLoading = false;
      print("firstLoading");
      sendData();
    } else {
      print("secondLoading");
      fillMenuCards();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: SpinKitThreeBounce(
          color: Colors.black,
          size: 60.0,
        )
      ),
    );
  }
}