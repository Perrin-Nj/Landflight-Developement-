import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:landflight/components/Input.dart';
import 'package:landflight/components/button.dart';
import 'package:landflight/vues/authentification/login.dart';
import 'package:landflight/utils/theme.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../home/home_screen.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
  final motdepasseController = TextEditingController();
  final nomController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  bool hasRegistrationError = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    motdepasseController.dispose();
    nomController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void showFormRequiredTooltip() {
    const Tooltip(
      message: "Champ obligatoire",
    );
  }

  void onTapNom() {
    showFormRequiredTooltip();
  }

  void onTapMotdepasse() {
    showFormRequiredTooltip();
  }

  void onTapEmail() {
    showFormRequiredTooltip();
  }

  void onChangeNom() {}
  void onChangeMotdepasse() {}
  void onChangeEmail() {}

  String? nomValidator(value) {
    if (value == null || value.isEmpty) {
      return "Entrez un nom d'utilisateur valide";
    }
    return null;
  }

  String? motdepasseValidator(value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
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

  static String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    return (!regex.hasMatch(value)) ? "Entrez un email valide" : null;
  }

  String? phoneValidator(String value) {
    return (value.isEmpty || value == null)
        ? "Entrez un numéro de téléphone"
        : null;
  }

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
              "S’enregistrer",
              style: TextStyle(
                  color: FONT_COLOR, fontSize: 30, fontFamily: "Bold"),
            ),
          )),
          const SizedBox(
            height: 32,
          ),
          Form(
            key: _formKeyRegister,
            child: Column(
              children: [
                Input(
                  inputController: nomController,
                  inputValidator: nomValidator,
                  onChangedInput: onChangeNom,
                  onTapInput: onTapNom,
                  isTel: false,
                  hintText: "Nom",
                  prefixIcon: Icon(Icons.person_outlined),
                  suffixIcon: Image.asset("assets/images/_.png"),
                ),
                const SizedBox(
                  height: 32,
                ),
                Input(
                    inputController: emailController,
                    inputValidator: validateEmail,
                    onChangedInput: onChangeEmail,
                    onTapInput: onTapEmail,
                    isTel: false,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.mail_outline),
                    suffixIcon: Image.asset("assets/images/_.png")),
                const SizedBox(
                  height: 32,
                ),
                Input(
                    inputController: motdepasseController,
                    inputValidator: motdepasseValidator,
                    onChangedInput: onChangeMotdepasse,
                    onTapInput: onTapMotdepasse,
                    isTel: false,
                    hintText: "Mot de passe",
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: Image.asset("assets/images/_.png")),
                const SizedBox(
                  height: 32,
                ),
                InternationalPhoneNumberInput(
                  validator: (value) {
                    return phoneValidator(value!);
                  },
                  textFieldController: phoneController,
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: const SelectorConfig(
                    //trailingSpace: false,
                    leadingPadding: 8,
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),

                  //textFieldController: controller,
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  // inputBorder: OutlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Button(
            text: "S’enregistrer",
            onTap: () async {
              if (_formKeyRegister.currentState!.validate()) {
                SmartDialog.showLoading(
                  msg: "loading",
                  useAnimation: true,
                );
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: motdepasseController.text,
                  )
                      .then((user) async {
                    const SnackBar(
                      backgroundColor: Colors.greenAccent,
                      content: Text(
                        "Utilisateur crée!",
                      ),
                    );
                    return user;
                  });
                  await FirebaseFirestore.instance
                      .collection('user')
                      .doc(userCredential.user!.uid)
                      .set({
                    'email': emailController.text,
                    'name': nomController.text,
                    'phone': int.parse(phoneController.text),
                    'numero_cni': int.parse("0"),
                    // 'password': motdepasseController.text,
                  });
                  await FirebaseAuth.instance.currentUser!
                      .updateDisplayName(nomController.text);
                  await FirebaseAuth.instance.currentUser!.updatePhoneNumber(
                      phoneController.text as PhoneAuthCredential);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Désolé, le mot de passe est trop faible. Essayez à nouveau",
                        ),
                      ),
                    );
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Désolé, l'email entré existe déjà. Essayez à nouveau",
                        ),
                      ),
                    );
                  } else {
                    SnackBar(
                      content: Text(
                        e.toString(),
                      ),
                    );
                  }
                } catch (e) {
                  SnackBar(
                    content: Text(
                      e.toString(),
                    ),
                  );
                }

                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
                SmartDialog.dismiss();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content:
                        Text("Connecté en tant que: ${emailController.text}"),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 32,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Text(
                      "Se connecter",
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
