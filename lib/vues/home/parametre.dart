import 'package:flutter/material.dart';
import 'package:landflight/controller/MenuController.dart';
import 'package:landflight/utils/theme.dart';
import 'package:landflight/vues/home/home_screen.dart';
import 'package:landflight/vues/home/homepage.dart';
import 'package:provider/provider.dart';

class Parametre extends StatefulWidget {
  Parametre({Key? key}) : super(key: key);

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
        width: widht,
        height: heigth,
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                height: 50,
                width: widht,
                decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          //  context.read<menuController>().controlMenu();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 24,
                          color: WHITE_COLOR,
                        )),
                    Text("Parametres",
                        style: TextStyle(
                            color: WHITE_COLOR,
                            fontSize: 20,
                            fontFamily: "Regular"))
                  ],
                )),
            SizedBox(
              height: 32,
            ),
            Container(
              height: 111,
              width: 259,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Changer de theme",
                      style: TextStyle(
                          color: FONT_COLOR, fontSize: 18, fontFamily: "Bold")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Blanc",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 15,
                              fontFamily: "Regular")),
                      Switch(
                        value: false,
                        onChanged: (value) {},
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: 111,
              width: 259,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Partager l’application",
                      style: TextStyle(
                          color: FONT_COLOR, fontSize: 18, fontFamily: "Bold")),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Partager",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 15,
                              fontFamily: "Regular")),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.share,
                        color: GRAY_COLOR,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Container(
              height: 111,
              width: 259,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Probleme",
                      style: TextStyle(
                          color: FONT_COLOR, fontSize: 18, fontFamily: "Bold")),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Signaler un bug",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 15,
                              fontFamily: "Regular")),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.info,
                        // color: GRAY_COLOR,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 209, 236, 75),
                ),
                Text("Noter cette application",
                    style: TextStyle(
                        color: FONT_COLOR, fontSize: 18, fontFamily: "Bold")),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 209, 236, 75),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
