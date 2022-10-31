import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landflight/screens/home/homepage.dart';
import 'package:landflight/utils/theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _affichePage = HomePage();
  int _current = 0;
  bool one = true, two = false, tree = false;
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

        return Container(); // CheckOut();

      case 1:
        one = false;
        two = false;
        tree = true;
        return HomePage();

      case 2:
        one = false;
        two = true;
        tree = false;

        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      width: widht,
      height: heigth,
      child: Stack(
        children: [
          _affichePage,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                color: GRAY_COLOR,
                width: widht,
                height: 50,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: widht * 0.1, right: widht * 0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => _change(0),
                          icon: Icon(
                            Icons.location_city_outlined,
                            size: 40,
                            color: this.one
                                ? FONT_COLOR
                                : Color.fromRGBO(229, 229, 229, 1),
                          )),
                      IconButton(
                          onPressed: () => _change(2),
                          icon: Icon(
                            Icons.calendar_view_month,
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
