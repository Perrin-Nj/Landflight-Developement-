import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landflight/controller/MenuController.dart';
import 'package:landflight/vues/home/homepage.dart';
import 'package:landflight/vues/home/nos_agences.dart';
import 'package:landflight/vues/home/parametre.dart';
import 'package:landflight/vues/home/save_passager.dart';
import 'package:landflight/vues/home/side_menu.dart';
import 'package:landflight/utils/theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _affichePage = HomePage();
  int _current = 1;
  bool one = false, two = false, tree = true;
  void _change(int index) {
    setState(() {
      _current = index;
      _affichePage = _pageSelectionEe(_current)!;
    });
  }

  Widget? _pageSelectionEe(int index) {
    switch (index) {
      case 0:
        one = true;
        two = false;
        tree = false;

        return Parametre(); // CheckOut();

      case 1:
        one = false;
        two = false;
        tree = true;
        return HomePage();

      case 2:
        one = false;
        two = true;
        tree = false;

        return NosAgences();
    }
  }

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
        //   key: context.read<menuController>().scaffoldKey,
        drawer: SideMenu(),
        body: Container(
      width: widht,
      height: heigth,
      child: Stack(
        children: [
          _affichePage,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: widht,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: GRAY_COLOR,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: widht * 0.1, right: widht * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => _change(0),
                          icon: Icon(
                            Icons.map_outlined,
                            size: 40,
                            color: this.one
                                ? FONT_COLOR
                                : Color.fromRGBO(229, 229, 229, 1),
                          ),),
                      IconButton(
                          onPressed: () => _change(2),
                          icon: Icon(
                            Icons.favorite_outline,
                            size: 40,
                            color: this.two
                                ? FONT_COLOR
                                : Color.fromRGBO(229, 229, 229, 1),
                          ))
                    ],
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 70, right: 16),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Save_passager()));
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const CircleAvatar(
                      radius: 40,
                      backgroundColor: PRIMARY_COLOR,
                      backgroundImage: AssetImage(
                        'assets/images/image 36.png',
                      ),
                    ),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  onTap: () {
                    _change(1);
                  },
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: GRAY_COLOR,
                    child: Icon(Icons.home,
                        color: this.tree
                            ? FONT_COLOR
                            : Color.fromRGBO(229, 229, 229, 1),
                        size: 40),
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
