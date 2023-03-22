import 'package:flutter/material.dart';
import 'package:landflight/utils/theme.dart';

class Button extends StatefulWidget {
  String text;
  void Function()? onTap;
  Button({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          height: 52,
          width: 223,
          decoration: BoxDecoration(
              color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(22)),
          child: Text(
            widget.text,
            style:
                TextStyle(color: WHITE_COLOR, fontSize: 20, fontFamily: "Bold"),
          ),
        ));
  }
}
