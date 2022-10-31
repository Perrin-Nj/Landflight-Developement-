import 'package:flutter/material.dart';
import 'package:landflight/components/Input.dart';
import 'package:landflight/components/button.dart';
import 'package:landflight/screens/authentification/login.dart';
import 'package:landflight/utils/theme.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        padding: EdgeInsets.only(left: 16, right: 16, top: 60),
        children: [
          const SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: 32),
            child: Text(
              "S’enregistrer",
              style: TextStyle(
                  color: FONT_COLOR, fontSize: 30, fontFamily: "Bold"),
            ),
          )),
          const SizedBox(
            height: 32,
          ),
          Input(
              isTel: false,
              hintText: "Nom",
              prefixIcon: Icon(Icons.person_outlined),
              suffixIcon: Image.asset("assets/images/_.png")),
          const SizedBox(
            height: 32,
          ),
          Input(
              isTel: false,
              hintText: "Email",
              prefixIcon: Icon(Icons.mail_outline),
              suffixIcon: Image.asset("assets/images/_.png")),
          const SizedBox(
            height: 32,
          ),
          Input(
              isTel: false,
              hintText: "Mot de passe",
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: Image.asset("assets/images/_.png")),
          const SizedBox(
            height: 32,
          ),
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
          const SizedBox(
            height: 40,
          ),
          Button(
            text: "S’enregistrer",
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Ou se connecter avec",
            textAlign: TextAlign.center,
            style:
                TextStyle(color: FONT_COLOR, fontSize: 14, fontFamily: "Bold"),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/image 11.png"),
              Image.asset("assets/images/image 12.png")
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "J’ai déjà un compte! ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: FONT_COLOR, fontSize: 14, fontFamily: "Light"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                },
                child: Row(
                  children: [
                    const Text(
                      "Se connecter",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 14,
                          fontFamily: "Bold"),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Icon(
                      Icons.arrow_back,
                      color: PRIMARY_COLOR,
                      size: 25,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
