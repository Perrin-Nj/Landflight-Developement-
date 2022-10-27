import 'package:flutter/material.dart';
import 'package:landflight/utils/theme.dart';

class Input extends StatefulWidget {
  String? suffixIcon, prefixIcon, hintText;
  bool? isTel;
  Input(
      {Key? key,
      required this.hintText,
      required this.isTel,
      required this.prefixIcon,
      required this.suffixIcon})
      : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          color: WHITE_COLOR,
          child: TextField(
              keyboardType: TextInputType.text,
              onTap: () {},
              onSubmitted: (_) {},
              style: const TextStyle(
                  fontFamily: "Bold", color: FONT_COLOR, fontSize: 14),
              textAlign: TextAlign.start,
              onChanged: (value) {},
              decoration: InputDecoration(
                  prefixIcon: !widget.isTel!
                      ? Image.asset(widget.prefixIcon!)
                      : Image.asset(
                          "assets/images/image 8.png",
                          width: 22,
                        ), //Row(
                  //  mainAxisAlignment: MainAxisAlignment.start,
                  ///children: [
                  //Icon(Icons.keyboard_arrow_down_outlined),

                  // ]),
                  suffixIcon: Image.asset(widget.suffixIcon!),
                  contentPadding: EdgeInsets.all(12),
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                      fontFamily: "Bold", color: FONT_COLOR, fontSize: 14))),
        ),
        Divider(
          color: FONT_COLOR,
        )
      ],
    );
  }
}
