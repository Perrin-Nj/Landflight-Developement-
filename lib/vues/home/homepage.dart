import 'package:flutter/material.dart';
import 'package:landflight/components/card_post.dart';
import 'package:landflight/components/comment_popup.dart';
import 'package:landflight/components/search_popup.dart';
import 'package:landflight/controller/ControllerComment.dart';
import 'package:landflight/controller/MenuController.dart';
import 'package:landflight/controller/SearchController.dart';
import 'package:landflight/utils/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool SearchOpen =
      false; // si la barre de recherche est devoiler par defaut il est fermer
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
                  child: IconButton(
                      onPressed: () {
                        context.read<menuController>().controlMenu();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 24,
                        color: WHITE_COLOR,
                      )),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                    ),
                    height: 100,
                    width: widht,
                    decoration: BoxDecoration(
                        color: GREENlIGTH_COLOR,
                        borderRadius: BorderRadius.circular(14)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundImage:
                                  AssetImage('assets/images/image 30.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: widht,
                                      decoration: BoxDecoration(
                                          color: GRAY_COLOR,
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                      child: TextField(
                                          keyboardType: TextInputType.text,
                                          onTap: () {},
                                          onSubmitted: (_) {},
                                          style: const TextStyle(
                                              fontFamily: "Bold",
                                              color: FONT_COLOR,
                                              fontSize: 14),
                                          textAlign: TextAlign.start,
                                          onChanged: (value) {},
                                          decoration: InputDecoration(
                                              focusColor: PRIMARY_COLOR,
                                              // ]),
                                              //suffixIcon: widget.suffixIcon,
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      bottom: 18,
                                                      top: 5,
                                                      left: 10),
                                              border: InputBorder.none,
                                              // hintText: widget.hintText,
                                              hintStyle: const TextStyle(
                                                  fontFamily: "Bold",
                                                  color: FONT_COLOR,
                                                  fontSize: 14))),
                                    ),
                                    Divider(
                                      color: Color.fromRGBO(86, 134, 145, 1),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person_outline),
                            SizedBox(
                              width: 16,
                            ),
                            Icon(Icons.send_outlined)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                //-------------
                Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: List.generate(5, (index) => CardPost()),
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
