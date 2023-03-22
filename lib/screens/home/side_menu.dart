import 'package:flutter/material.dart';
import 'package:landflight/screens/home/nos_agences.dart';
import 'package:landflight/screens/home/parametre.dart';
import 'package:landflight/utils/theme.dart';

class SideMenu extends StatefulWidget {
  SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool isdrop = false;
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Container(
      height: heigth,
      width: widht * .8,
      decoration: BoxDecoration(
          color: GREENlIGTH_COLOR,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(40),
              bottomRight: Radius.circular(125),
              bottomLeft: Radius.circular(0))),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 40,
              width: widht,
              decoration: BoxDecoration(
                  color: GRAY_COLOR,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(30))),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          CircleAvatar(
            radius: 40,
            backgroundColor: GRAY_COLOR,
            child: Image.asset("assets/images/image 30.png"),
          ),
          Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Thomas Djandjo André",
                        style: TextStyle(
                            color: FONT_COLOR,
                            fontSize: 16,
                            fontFamily: "Bold"),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isdrop = !isdrop;
                          });
                        },
                        child: isdrop
                            ? Icon(
                                Icons.arrow_drop_up,
                                size: 32,
                                color: FONT_COLOR,
                              )
                            : Icon(
                                Icons.arrow_drop_down,
                                size: 32,
                                color: FONT_COLOR,
                              ),
                      )
                    ],
                  ),
                  Text("DjandjoAndré@gmail.com",
                      style: TextStyle(
                          color: FONT_COLOR.withOpacity(.4),
                          fontSize: 13,
                          fontFamily: "Regular"))
                ],
              )),
          Divider(
            color: Color.fromRGBO(86, 134, 145, 1),
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/image 36.png",
              width: 40,
              color: FONT_COLOR.withOpacity(.79),
            ),
            title: Text("Voyager",
                style: TextStyle(
                    color: FONT_COLOR.withOpacity(.8),
                    fontSize: 15,
                    fontFamily: "Regular")),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NosAgences(),
                  ));
            },
            child: ListTile(
              leading: Image.asset("assets/images/image 68.png",
                  color: FONT_COLOR.withOpacity(.8)),
              title: Text("Nos agences",
                  style: TextStyle(
                      color: FONT_COLOR.withOpacity(.8),
                      fontSize: 15,
                      fontFamily: "Regular")),
            ),
          ),
          ListTile(
            leading: Image.asset("assets/images/image 34.png",
                width: 40, color: FONT_COLOR.withOpacity(.8)),
            title: Text("Voyages récents",
                style: TextStyle(
                    color: FONT_COLOR.withOpacity(.8),
                    fontSize: 15,
                    fontFamily: "Regular")),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Parametre(),
                  ));
            },
            child: ListTile(
              leading: Icon(
                Icons.share,
                size: 32,
                color: FONT_COLOR.withOpacity(.8),
              ),
              title: Text("paramètres",
                  style: TextStyle(
                      color: FONT_COLOR.withOpacity(.8),
                      fontSize: 15,
                      fontFamily: "Regular")),
            ),
          ),
          Divider(
            color: Color.fromRGBO(86, 134, 145, 1),
          ),
          ListTile(
            leading: Image.asset("assets/images/image 34.png",
                width: 40, color: FONT_COLOR.withOpacity(.8)),
            title: Text("Partager l’application",
                style: TextStyle(
                    color: FONT_COLOR.withOpacity(.8),
                    fontSize: 15,
                    fontFamily: "Regular")),
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              size: 32,
              color: FONT_COLOR.withOpacity(.8),
            ),
            title: Text("Se déconnecter",
                style: TextStyle(
                    color: FONT_COLOR.withOpacity(.8),
                    fontSize: 15,
                    fontFamily: "Regular")),
          ),
        ],
      ),
    ));
  }
}
