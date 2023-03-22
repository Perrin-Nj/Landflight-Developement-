import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:landflight/screens/home/payement.dart';
import 'package:landflight/utils/theme.dart';

class FormAddPassager extends StatefulWidget {
  FormAddPassager({Key? key}) : super(key: key);

  @override
  State<FormAddPassager> createState() => _FormAddPassagerState();
}

class _FormAddPassagerState extends State<FormAddPassager> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: FONT_COLOR.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
      height: 200,
      width: widht * 0.95,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: widht,
            height: 20,
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: WHITE_COLOR,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.6),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // décalage de l'ombre portée
                          ),
                        ],
                      ),
                      child: Text("M.",
                          style: TextStyle(
                              color: FONT_COLOR,
                              fontSize: 18,
                              fontFamily: "Bold")),
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(144, 144, 144, 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(.6),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // décalage de l'ombre portée
                          ),
                        ],
                      ),
                      child: Text("Mme.",
                          style: TextStyle(
                              color: WHITE_COLOR,
                              fontSize: 18,
                              fontFamily: "Bold")),
                    )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 8, right: 8),
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: WHITE_COLOR,
                        border: Border.all(color: PRIMARY_COLOR)),
                    child: TextField(
                      controller: TextEditingController(text: "Ngandjou"),
                      style: const TextStyle(
                          fontFamily: "Bold", color: FONT_COLOR, fontSize: 18),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 8, right: 8),
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: WHITE_COLOR,
                        border: Border.all(color: PRIMARY_COLOR)),
                    child: TextField(
                      controller: TextEditingController(text: "/"),
                      style: const TextStyle(
                          fontFamily: "Bold", color: FONT_COLOR, fontSize: 18),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ))
            ],
          ),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 8, right: 8),
              height: 28,
              width: widht,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: WHITE_COLOR,
                  border: Border.all(color: PRIMARY_COLOR)),
              child: Row(
                children: [
                  Container(
                      width: widht * .15,
                      height: 28,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("CNI",
                              style: TextStyle(
                                  color: PRIMARY_COLOR,
                                  fontSize: 18,
                                  fontFamily: "Regular")),
                          Icon(
                            Icons.arrow_drop_down,
                            color: PRIMARY_COLOR,
                            size: 17,
                          ),
                        ],
                      )),
                  Container(
                    height: 28,
                    width: 2,
                    color: FONT_COLOR,
                  ),
                  Container(
                    width: widht * .5,
                    child: TextField(
                      controller: TextEditingController(text: ""),
                      style: const TextStyle(
                          fontFamily: "Bold", color: FONT_COLOR, fontSize: 18),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              )),
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              print(number.phoneNumber);
            },
            onInputValidated: (bool value) {
              print(value);
            },
            selectorConfig: SelectorConfig(
              //trailingSpace: false,
              leadingPadding: 8,
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: TextStyle(color: Colors.black),

            //textFieldController: controller,
            formatInput: false,
            keyboardType:
                TextInputType.numberWithOptions(signed: true, decimal: true),
            // inputBorder: OutlineInputBorder(),
            onSaved: (PhoneNumber number) {
              print('On Saved: $number');
            },
          ),
        ],
      ),
    );
  }
}
