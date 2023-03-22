import 'package:flutter/material.dart';
import 'package:landflight/controller/ControllerComment.dart';
import 'package:landflight/utils/theme.dart';
import 'package:provider/provider.dart';

class CommentPopup extends StatefulWidget {
  CommentPopup({Key? key}) : super(key: key);

  @override
  State<CommentPopup> createState() => _CommentPopupState();
}

class _CommentPopupState extends State<CommentPopup> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Container(
      height: 140,
      width: widht * .9,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: GREENlIGTH_COLOR,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    context.read<CommentController>().close();
                  },
                  child: Icon(Icons.close))),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/images/image 30.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Container(
                        height: 31,
                        width: widht,
                        decoration: BoxDecoration(
                            color: GRAY_COLOR,
                            borderRadius: BorderRadius.circular(18)),
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
                                contentPadding: const EdgeInsets.only(
                                    bottom: 18, top: 5, left: 10),
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
              Text("Commenter",
                  style: TextStyle(
                      color: FONT_COLOR, fontSize: 14, fontFamily: "Light")),
              SizedBox(
                width: 8,
              ),
              Icon(Icons.comment_outlined),
            ],
          ),
        ],
      ),
    );
  }
}
