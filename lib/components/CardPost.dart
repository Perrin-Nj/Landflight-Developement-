import 'package:flutter/material.dart';
import 'package:landflight/controller/ControllerComment.dart';
import 'package:landflight/utils/theme.dart';
import 'package:provider/provider.dart';

class CardPost extends StatefulWidget {
  CardPost({Key? key}) : super(key: key);

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
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
      height: 300,
      decoration: BoxDecoration(
          color: GREENlIGTH_COLOR, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Générale",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: FONT_COLOR,
                                fontSize: 14,
                                fontFamily: "Bold"),
                          ),
                          Text(
                            "il y’a 1h",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: FONT_COLOR,
                                fontSize: 14,
                                fontFamily: "Regular"),
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
                            onPressed: () {}, icon: Icon(Icons.more_horiz)),
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 8,
              right: 8,
            ),
            child: Text(
              "meilleure agence de voyage au pays, pour vous servir meilleure agence de voyage au pays, ",
              style: TextStyle(
                  color: FONT_COLOR, fontSize: 14, fontFamily: "Regular"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 8,
              right: 8,
            ),
            child: Container(
              height: 95,
              width: widht,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/image 26.png'))),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 8,
                right: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("100 likes",
                      style: TextStyle(
                          color: FONT_COLOR,
                          fontSize: 14,
                          fontFamily: "Light")),
                  Text("10 commentaires",
                      style: TextStyle(
                          color: FONT_COLOR, fontSize: 14, fontFamily: "Light"))
                ],
              )),
          Padding(
            padding: EdgeInsets.only(
              top: 6,
              left: 8,
              right: 8,
            ),
            child: Divider(
              color: Color.fromRGBO(86, 134, 145, 1),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                top: 6,
                left: 8,
                right: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite),
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
                  )
                ],
              )),
        ],
      ),
    );
  }
}
