import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:landflight/components/card_agance.dart';
import 'package:landflight/components/card_post.dart';
import 'package:landflight/components/comment_popup.dart';
import 'package:landflight/components/search_popup.dart';
import 'package:landflight/controller/ControllerComment.dart';
import 'package:landflight/controller/MenuController.dart';
import 'package:landflight/controller/SearchController.dart';
import 'package:landflight/utils/theme.dart';
import 'package:provider/provider.dart';

class NosAgences extends StatefulWidget {
  NosAgences({Key? key}) : super(key: key);

  @override
  State<NosAgences> createState() => _NosAgencesState();
}

class _NosAgencesState extends State<NosAgences> {
  bool SearchOpen = false;
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    final search = context.watch<SearchController>();
    final comment = context.watch<CommentController>();
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: widht,
        height: heigth,
        padding: EdgeInsets.only(bottom: 50),
        // color: Colors.amber,
        child: Stack(
          children: [
            Container(
                child: SingleChildScrollView(
              child: Column(children: [
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
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 24,
                              color: WHITE_COLOR,
                            )),
                        Text("Nos agences",
                            style: TextStyle(
                                color: WHITE_COLOR,
                                fontSize: 20,
                                fontFamily: "Regular"))
                      ],
                    )),

                SizedBox(
                  height: 32,
                ),

                //-------------
                Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: List.generate(5, (index) => CardAgences()),
                    ))
                //----------
              ]),
            )),
            Positioned(
                top: 20,
                left: widht * .8,
                child: GestureDetector(
                  onTap: () {
                    search.open();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: WHITE_COLOR,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Icon(
                      Icons.search_outlined,
                      color: FONT_COLOR,
                    ),
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            if (search.isSearch)
              Align(
                alignment: Alignment.topCenter,
                child: SearchPoppUP(),
              ),
            if (comment.iscomment)
              Align(
                alignment: Alignment.topCenter,
                child: CommentPopup(),
              )
          ],
        ),
      )),
    );
  }
}
