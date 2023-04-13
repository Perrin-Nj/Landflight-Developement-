import 'package:flutter/material.dart';
import 'package:landflight/utils/theme.dart';

class Input extends StatefulWidget {
  String? hintText;
  Widget suffixIcon, prefixIcon;
  bool? isTel;
  TextEditingController inputController;
  final bool isPassword;
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
    required this.isPassword,
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
        !widget.isPassword
            ? Container(
                height: 40,
                color: WHITE_COLOR,
                child: TextFormField(
                    enableSuggestions: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
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
                            fontFamily: "Bold",
                            color: FONT_COLOR,
                            fontSize: 14))),
              )
            : Container(
                height: 60,
                color: WHITE_COLOR,
                child: TextFormField(
                    enableSuggestions: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.visiblePassword,
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
                        contentPadding:
                            const EdgeInsets.only(top: 35, bottom: 0),
                        // border: InputBorder(),
                        hintText: widget.hintText,
                        hintStyle: const TextStyle(
                            fontFamily: "Bold",
                            color: FONT_COLOR,
                            fontSize: 14))),
              ),
      ],
    );
  }
}
