import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:landflight/components/Input.dart';
import 'package:landflight/components/button.dart';
import 'package:landflight/vues/authentification/registration.dart';
import 'package:landflight/vues/home/home_screen.dart';
import 'package:landflight/utils/theme.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKeyLogin = GlobalKey<FormState>();
  final motdepasseController = TextEditingController();
  final nomController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    motdepasseController.dispose();
    nomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showFormRequiredTooltip() {
      const Tooltip(
        message: "Champ obligatoire",
        decoration: BoxDecoration(color: Colors.blue),
      );
    }

    void onTapNom() {
      showFormRequiredTooltip();
    }

    void onTapMotdepasse() {
      showFormRequiredTooltip();
    }

    void onChangeNom() {}
    void onChangeMotdepasse() {}
    String? nomValidator(value) {
      if (value == null || value.isEmpty) {
        return "Entrez un nom d'utilisateur valide";
      }
      return null;
    }

    String? motdepasseValidator(value) {
      RegExp regex = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      var passNonNullValue = value ?? "";
      if (passNonNullValue.isEmpty) {
        return ("Mot de passe requis");
      } else if (passNonNullValue.length < 5) {
        return ("Le mot de passe doit dépasser 4 charactéres");
      } else if (!regex.hasMatch(passNonNullValue)) {
        return ("Le mot de passe doit contenir des charactéres majuscules, minuscules, au moins un nombre et un charactére spécial ");
      }
      return null;
    }

    return Scaffold(
      backgroundColor: WHITE_COLOR,
      body: ListView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 150),
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
            height: 40,
          ),
          Form(
            key: _formKeyLogin,
            child: Column(
              children: [
                Input(
                    onTapInput: onTapNom,
                    inputValidator: nomValidator,
                    onChangedInput: onChangeNom,
                    inputController: nomController,
                    isTel: false,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    suffixIcon: Image.asset("assets/images/_.png")),
                SizedBox(
                  height: 18,
                ),
                Input(
                  onTapInput: onTapMotdepasse,
                  inputValidator: motdepasseValidator,
                  onChangedInput: onChangeMotdepasse,
                  inputController: motdepasseController,
                  isTel: false,
                  hintText: "Mot de passe",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Image.asset("assets/images/_.png"),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "J’ai oublié mon mot de passe",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 10,
                        fontFamily: "Regular"),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Button(
                  text: "Se Connecter",
                  onTap: () async {
                    if (_formKeyLogin.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      /* try {
                          UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
                      }on FirebaseAuthException catch(e){

                      }*/
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: nomController.text,
                          password: motdepasseController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Connecté en tant que ${nomController.text}",
                            ),
                          ),
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Cet email n'existe pas"),
                          ));
                        } else if (e.code == "wrong-password") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Les mots de passe de match pas'),
                          ));
                        }
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Informations valides')),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "Ou se connecter avec",
            textAlign: TextAlign.center,
            style:
                TextStyle(color: FONT_COLOR, fontSize: 14, fontFamily: "Bold"),
          ),
          SizedBox(
            height: 32,
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
                    Icon(
                      Icons.arrow_forward,
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
