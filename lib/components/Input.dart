import 'package:flutter/material.dart';
import 'package:landflight/utils/theme.dart';

class Input extends StatefulWidget {
  String? hintText;
  Widget suffixIcon, prefixIcon;
  bool? isTel;
  TextEditingController inputController;
  //Function onTapInput;
 // Function onChangedInput;
  Function inputValidator;
  Input({
    Key? key,
    required this.hintText,
    required this.isTel,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.inputController,
  //  required this.onChangedInput,
  //  required this.onTapInput,
    required this.inputValidator,
  }) : super(key: key);

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
          child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              controller: widget.inputController,
             /* onTap: () => widget.onTapInput(),*/
              validator: (value) {
                return widget.inputValidator(value);
              },
              style: const TextStyle(
                fontFamily: "Bold",
                color: FONT_COLOR,
                fontSize: 14,
              ),
              textAlign: TextAlign.start,
            /*  onChanged: (value) {
                widget.onChangedInput;
              },*/
              decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon,

                  // ]),
                  suffixIcon: widget.suffixIcon,
                  contentPadding: const EdgeInsets.all(12),
                  // border: InputBorder(),
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      fontFamily: "Bold", color: FONT_COLOR, fontSize: 14))),
        ),
      ],
    );
  }
}
