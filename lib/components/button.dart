import 'package:flutter/material.dart';
import 'package:landflight/utils/theme.dart';

class Button extends StatefulWidget {
  String text;
  Button({Key? key, required this.text}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 52,
      width: 223,
      decoration: BoxDecoration(
          color: PRIMARY_COLOR, borderRadius: BorderRadius.circular(22)),
      child: Text(
        "Se Connecter!",
        style: TextStyle(color: WHITE_COLOR, fontSize: 20, fontFamily: "Bold"),
      ),
    );
  }
}
