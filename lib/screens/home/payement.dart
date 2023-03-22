import 'package:flutter/material.dart';
import 'package:landflight/components/Input.dart';
import 'package:landflight/utils/theme.dart';

class Payement extends StatefulWidget {
  Payement({Key? key}) : super(key: key);

  @override
  State<Payement> createState() => _PayementState();
}

class _PayementState extends State<Payement> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: WHITE_COLOR,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: PRIMARY_COLOR,
        ),
        centerTitle: false,
        title: Text(
          "Payement",
          style:
              TextStyle(color: PRIMARY_COLOR, fontSize: 16, fontFamily: "Bold"),
        ),
      ),
      body: Container(
        height: heigth,
        width: widht,
        padding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(5),
          color: FONT_COLOR1,
          width: 296,
          height: heigth * 0.6,
          child: Container(
            width: widht,
            height: heigth * .3,
            decoration: BoxDecoration(
                color: WHITE_COLOR,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              children: [
                Row(
                  children: [
                    Expanded(child: Image.asset("assets/images/logo.png")),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "LandFlight\n",
                              style: TextStyle(
                                  color: FONT_COLOR,
                                  fontSize: 20,
                                  fontFamily: "Bold"),
                            ),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
                Divider(
                  color: GRAY_COLOR,
                  height: 2,
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Opération:  ",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 16,
                              fontFamily: "Regular"),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                              width: 100,
                              child: TextField(
                                controller: TextEditingController(
                                    text: "Achat en ligne"),
                                style: const TextStyle(
                                    fontFamily: "Bold",
                                    color: FONT_COLOR,
                                    fontSize: 18),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              )),
                        )
                      ],
                    ),
                    Divider(
                      color: GRAY_COLOR,
                      height: 2,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Montant:  ",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 16,
                              fontFamily: "Regular"),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                              width: 100,
                              child: TextField(
                                controller:
                                    TextEditingController(text: "7000FCFA"),
                                style: const TextStyle(
                                    fontFamily: "Regular",
                                    color: FONT_COLOR,
                                    fontSize: 16),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              )),
                        )
                      ],
                    ),
                    Divider(
                      color: GRAY_COLOR,
                      height: 2,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Net à payer:  ",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 16,
                              fontFamily: "Regular"),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                              width: 100,
                              child: TextField(
                                controller:
                                    TextEditingController(text: "7000FCFA"),
                                style: const TextStyle(
                                    fontFamily: "Regular",
                                    color: FONT_COLOR,
                                    fontSize: 16),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              )),
                        )
                      ],
                    ),
                    Divider(
                      color: GRAY_COLOR,
                      height: 2,
                    ),
                    SizedBox(height: 3),
                    RichText(
                        maxLines: 2,
                        text: TextSpan(
                            text: "Paiement de  ",
                            style: TextStyle(
                                color: FONT_COLOR,
                                fontSize: 13,
                                fontFamily: "Regular"),
                            children: [
                              TextSpan(
                                text: "01 réservation ",
                                style: TextStyle(
                                    color: GRAY_COLOR,
                                    fontSize: 12,
                                    fontFamily: "Regular"),
                              ),
                              TextSpan(
                                text: " sur LandFlight",
                                style: TextStyle(
                                    color: FONT_COLOR,
                                    fontSize: 18,
                                    fontFamily: "Bold"),
                              ),
                            ])),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 63,
                  width: 243,
                  decoration: BoxDecoration(
                      color: GRAY_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.info,
                        color: FONT_COLOR.withOpacity(.6),
                        size: 25,
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Text(
                          "Veuillez selectionner un mode de paiement ci-dessous",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 11),
                        ))
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: true,
                      groupValue: true,
                      onChanged: (value) {},
                    ),
                    Image.asset("assets/images/image 60.png"),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset("assets/images/image 59.png")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: false,
                      groupValue: true,
                      onChanged: (value) {},
                    ),
                    Image.asset("assets/images/image 61.png"),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Annuler",
                      style: TextStyle(
                          color: FONT_COLOR,
                          fontSize: 16,
                          fontFamily: "Regular"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
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
                    )
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Divider(
                  color: GRAY_COLOR,
                  height: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
