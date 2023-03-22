import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:landflight/components/form_add_passager.dart';
import 'package:landflight/screens/home/payement.dart';
import 'package:landflight/utils/theme.dart';

class Save_passager extends StatefulWidget {
  Save_passager({Key? key}) : super(key: key);

  @override
  State<Save_passager> createState() => _Save_passagerState();
}

class _Save_passagerState extends State<Save_passager> {
  int nbreform = 1; // nombre de formulaire initialiser a 1 qui sera incrementer
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: widht,
        height: heigth,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                elevation: 10,
                shadowColor: PRIMARY_COLOR,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
                child: Container(
                  width: widht,
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios),
                            color: PRIMARY_COLOR,
                          ),
                          Text(
                            "Enregistrement des passagers",
                            style: TextStyle(
                                color: PRIMARY_COLOR,
                                fontSize: 16,
                                fontFamily: "Bold"),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                          "assets/images/busTemplate.png"),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("NINA VOYAGES",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: FONT_COLOR1,
                                            fontSize: 16,
                                            fontFamily: "Bold"))
                                  ],
                                )),
                            Expanded(
                              flex: 3,
                              child: Column(children: [
                                Container(
                                  // color: Colors.amber,
                                  width: 250,
                                  child: Text("VIP",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: FONT_COLOR1,
                                          fontSize: 14,
                                          fontFamily: "Light")),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 250,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 104,
                                    decoration: BoxDecoration(
                                        color: PRIMARY_COLOR,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Text("700 ",
                                              style: TextStyle(
                                                  color: WHITE_COLOR,
                                                  fontSize: 18,
                                                  fontFamily: "Regular")),
                                          Text("fcfa",
                                              style: TextStyle(
                                                  color: WHITE_COLOR,
                                                  fontSize: 13,
                                                  fontFamily: "Regular")),
                                        ]),
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Yaoundé, ",
                                    style: TextStyle(
                                        color: FONT_COLOR,
                                        fontSize: 15,
                                        fontFamily: "Regular"),
                                    children: [
                                  TextSpan(
                                      text: "Mvan",
                                      style: TextStyle(
                                          color: FONT_COLOR,
                                          fontSize: 12,
                                          fontFamily: "Regular"))
                                ])),
                            RichText(
                                text: TextSpan(
                                    text: "Douala, ",
                                    style: TextStyle(
                                        color: FONT_COLOR,
                                        fontSize: 15,
                                        fontFamily: "Regular"),
                                    children: [
                                  TextSpan(
                                      text: "Akwa",
                                      style: TextStyle(
                                          color: FONT_COLOR,
                                          fontSize: 12,
                                          fontFamily: "Regular"))
                                ]))
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 16, right: 16, top: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("15/01/2022",
                                    style: TextStyle(
                                        color: FONT_COLOR.withOpacity(0.8),
                                        fontSize: 12,
                                        fontFamily: "Regular")),
                                Image.asset(
                                  "assets/images/image 40.png",
                                  width: 20,
                                  height: 20,
                                ),
                                Container(
                                  width: 15,
                                  child: Divider(color: FONT_COLOR1),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 12,
                                  width: 36,
                                  decoration: BoxDecoration(
                                      color: PRIMARY_COLOR,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text("4H ",
                                      style: TextStyle(
                                          color: WHITE_COLOR,
                                          fontSize: 7,
                                          fontFamily: "Bold")),
                                ),
                                Container(
                                  width: 15,
                                  child: Divider(color: FONT_COLOR1),
                                ),
                                Image.asset(
                                  "assets/images/image 42.png",
                                  width: 20,
                                  height: 20,
                                ),
                                Text("15/01/2022",
                                    style: TextStyle(
                                        color: FONT_COLOR.withOpacity(0.8),
                                        fontSize: 12,
                                        fontFamily: "Regular")),
                              ])),
                      Padding(
                          padding: EdgeInsets.only(left: 16, right: 16, top: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("7h00",
                                    style: TextStyle(
                                        color: FONT_COLOR.withOpacity(0.8),
                                        fontSize: 12,
                                        fontFamily: "Regular")),
                                Text("11h00",
                                    style: TextStyle(
                                        color: FONT_COLOR.withOpacity(0.8),
                                        fontSize: 12,
                                        fontFamily: "Regular")),
                              ]))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: heigth * .27,
                left: 8,
                right: 8,
                child: Container(
                    height: heigth * .5,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            children: List.generate(
                                nbreform, (index) => FormAddPassager()),
                          ),
                          TextButton(
                              onPressed: () => setState(() {
                                    nbreform++;
                                  }),
                              child: Text("+ Ajouter un passager ",
                                  style: TextStyle(
                                      color: PRIMARY_COLOR,
                                      fontSize: 18,
                                      fontFamily: "Bold"))),
                        ],
                      ),
                    ))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                height: 100,
                width: widht,
                color: Color.fromRGBO(5, 0, 235, 0.39),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Détails de votre facture",
                        style: TextStyle(
                            color: FONT_COLOR,
                            fontSize: 12,
                            fontFamily: "Regular")),
                    Container(
                      height: 60,
                      width: widht,
                      //color: WHITE_COLOR,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("1X",
                              style: TextStyle(
                                  color: FONT_COLOR,
                                  fontSize: 20,
                                  fontFamily: "Regular")),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 60,
                            width: 2,
                            color: FONT_COLOR,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 60,
                            width: 180,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Prix du ticket: 7000Fcfa",
                                    style: TextStyle(
                                        color: FONT_COLOR,
                                        fontSize: 12,
                                        fontFamily: "Regular")),
                                Text("Taxes: 0Fcfa",
                                    style: TextStyle(
                                        color: FONT_COLOR,
                                        fontSize: 12,
                                        fontFamily: "Regular")),
                                Text("Total à payer: 7000Fcfa",
                                    style: TextStyle(
                                        color: FONT_COLOR,
                                        fontSize: 12,
                                        fontFamily: "Regular")),
                              ],
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              height: 56,
                              width: 94,
                              decoration: BoxDecoration(
                                  color: PRIMARY_COLOR,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.arrow_forward,
                                    color: WHITE_COLOR,
                                    size: 35,
                                  ),
                                  Text("Payer billet",
                                      style: TextStyle(
                                          color: WHITE_COLOR,
                                          fontSize: 12,
                                          fontFamily: "Regular")),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Payement(),
                                  ));
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
