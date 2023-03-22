import 'package:flutter/material.dart';
import 'package:landflight/controller/ControllerComment.dart';
import 'package:landflight/utils/theme.dart';
import 'package:provider/provider.dart';

class CardAgences extends StatefulWidget {
  CardAgences({Key? key}) : super(key: key);

  @override
  State<CardAgences> createState() => _CardAgencesState();
}

class _CardAgencesState extends State<CardAgences> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(
        top: 6,
        left: 8,
        right: 8,
      ),
      width: widht,
      height: 150,
      decoration: BoxDecoration(
          color: GREENlIGTH_COLOR, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            // width: widht,
            //color: PRIMARY_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/busTemplate.png"),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      height: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "LALA VOYAGES",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: FONT_COLOR1,
                                fontSize: 18,
                                fontFamily: "Bold"),
                          ),
                        ],
                      ),
                    )),
                Container(
                    height: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.more_vert)),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                //  top: 10,
                left: 8,
                right: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 17,
                    color: GRAY_COLOR,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Directions vers l’agence",
                    style: TextStyle(
                        color: FONT_COLOR, fontSize: 14, fontFamily: "Regular"),
                  ),
                ],
              )),
          Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 8,
                right: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 209, 236, 75),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text("etoiles",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 14,
                              fontFamily: "Light")),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<CommentController>().open();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.comment_outlined),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Commenter",
                            style: TextStyle(
                                color: FONT_COLOR,
                                fontSize: 14,
                                fontFamily: "Light")),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.favorite_outline),
                      SizedBox(
                        width: 8,
                      ),
                      Text("Likes",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 14,
                              fontFamily: "Light")),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
