import 'package:flutter/material.dart';
import 'package:landflight/components/Input.dart';
import 'package:landflight/components/button.dart';
import 'package:landflight/screens/authentification/registration.dart';
import 'package:landflight/utils/theme.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 60),
        children: [
          const SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: 32),
            child: Text(
              "Se Connecter",
              style: TextStyle(
                  color: FONT_COLOR, fontSize: 30, fontFamily: "Bold"),
            ),
          )),
          const SizedBox(
            height: 32,
          ),
          Input(
              isTel: false,
              hintText: "Nom d’utilisateur",
              suffixIcon: "assets/images/_.png",
              prefixIcon: "assets/images/image 11 (1).png"),
          SizedBox(
            height: 20,
          ),
          Input(
              isTel: false,
              hintText: "Mot de passe",
              suffixIcon: "assets/images/_.png",
              prefixIcon: "assets/images/image 1.png"),
          Text(
            "J’ai oublié mon mot de passe",
            textAlign: TextAlign.right,
            style: TextStyle(
                color: PRIMARY_COLOR, fontSize: 10, fontFamily: "Regular"),
          ),
          SizedBox(
            height: 40,
          ),
          Button(text: "Se Connecter"),
          SizedBox(
            height: 20,
          ),
          Text(
            "Ou se connecter avec",
            textAlign: TextAlign.center,
            style:
                TextStyle(color: FONT_COLOR, fontSize: 14, fontFamily: "Bold"),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/image 11.png"),
              Image.asset("assets/images/image 12.png")
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Je n’ai pas de compte! ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: FONT_COLOR, fontSize: 14, fontFamily: "Light"),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Row(
                  children: [
                    Text(
                      "S’enregistrer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 14,
                          fontFamily: "Bold"),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Image.asset("assets/images/image 5.png"),
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
