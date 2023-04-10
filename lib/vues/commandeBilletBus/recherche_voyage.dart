import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RechercheVoyage extends StatefulWidget {
  const RechercheVoyage({super.key});

  @override
  State<RechercheVoyage> createState() => _RechercheVoyageState();
}

class _RechercheVoyageState extends State<RechercheVoyage> {
  double bottomSheetHeight = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                getHeader(),
                getSearchDropDown(),
                getSearchResult(),
                getSearchButton(),
              ],
            ),
          )),
          getBottomMenu(MediaQuery.of(context).size.width, bottomSheetHeight)
        ],
      )),
    );
  }

  Widget getHeader() {
    return Container();
  }

  Widget getSearchDropDown() {
    return Container();
  }

  Widget getSearchResult() {
    return Container();
  }

  Widget getSearchButton() {
    return Container();
  }

  Widget getBottomMenu(double pageWidth, double bottomSheetHeight) {
    double bottomMenuHeight = bottomSheetHeight;
    return Container(
        height: bottomMenuHeight,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            getLowerIcons(pageWidth, bottomMenuHeight),
            getUpperIcon(bottomMenuHeight)
          ],
        ));
  }

  Widget getLowerIcons(double pageWidth, double bottomMenuHeight) {
    return Container(
      width: pageWidth,
      height: bottomMenuHeight * .6,
      decoration: BoxDecoration(
        color: Color(0xffd9d9d9),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [getMapIcon(), SizedBox(), getLikeIcon()]),
    );
  }

  Widget getMapIcon() {
    return IconButton(
      iconSize: 27,
      icon: Icon(Icons.map),
      onPressed: () {},
    );
  }

  Widget getLikeIcon() {
    return IconButton(
      icon: Icon(Icons.favorite_border_rounded),
      onPressed: () {},
      iconSize: 27,
    );
  }

  Widget getUpperIcon(double bottomMenuHeight) {
    return CircleAvatar(
      backgroundColor: Color(0xffd9d9d9),
      radius: bottomMenuHeight / 2,
      child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: IconButton(
            icon: Icon(Icons.home_outlined),
            color: Colors.black,
            onPressed: () {},
            iconSize: 30,
          )),
    );
  }
}
