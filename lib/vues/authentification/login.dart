import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:landflight/components/Input.dart';
import 'package:landflight/components/button.dart';
import 'package:landflight/vues/authentification/mot_de_passe_oublie.dart';
import 'package:landflight/vues/authentification/registration.dart';
import 'package:landflight/vues/home/home_screen.dart';
import 'package:landflight/utils/theme.dart';
import 'package:landflight/vues/home/homepage.dart';

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
      } else if (passNonNullValue.length < 8) {
        return ("Le mot de passe doit dépasser 7 caractéres");
      } else if (!regex.hasMatch(passNonNullValue)) {
        return ("Le mot de passe doit contenir des charactéres \n majuscules, minuscules, Doit contenir\n Au moins un nombre et, Un charactére spécial ");
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
                    isPassword: false,
                    // onTapInput: onTapNom,
                    inputValidator: nomValidator,
                    //onChangedInput: onChangeNom,
                    inputController: nomController,
                    isTel: false,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    suffixIcon: Image.asset("assets/images/_.png")),
                SizedBox(
                  height: 18,
                ),
                Input(
                  isPassword: true,
                  //  onTapInput: onTapMotdepasse,
                  inputValidator: motdepasseValidator,
                  //onChangedInput: onChangeMotdepasse,
                  inputController: motdepasseController,
                  isTel: false,
                  hintText: "Mot de passe",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Image.asset("assets/images/_.png"),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MotdepasseOublie(),
                      ),
                    );
                  },
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
                      SmartDialog.showLoading(
                        msg: "loading...",
                        useAnimation: true,
                      );
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
                            backgroundColor: Colors.green,
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
                        SmartDialog.dismiss();
                      } on FirebaseAuthException catch (e) {
                        SmartDialog.dismiss();
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text("Cet email n'existe pas"),
                          ));
                        } else if (e.code == "wrong-password") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Le mots de passe de match pas'),
                          ));
                        }
                      }
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
              InkWell(
                child: Image.asset("assets/images/image 11.png"),
                onTap: () {
                  _loginWithFacebook();
                },
              ),
              // Image.asset("assets/images/image 12.png")
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
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
                  children: const [
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

  Future<void> _loginWithFacebook() async {
    // SmartDialog.showLoading();
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
        facebookLoginResult.accessToken!.token,
      );
      final User? user = FirebaseAuth.instance.currentUser;
      UserCredential userc = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      await FirebaseFirestore.instance
          .collection('user')
          .doc(userc.user!.uid)
          .set({
            'email': userData['email'],
            'name': userData['name'],
            'phone': userData['phoneNumber'],
            'numero_cni': int.parse("0"),
            'likedPosts': [],
          })
          .then((value) => SmartDialog.showNotify(
              msg: "Connecté en tant que: ${userData['email']}",
              notifyType: NotifyType.success))
          .catchError((error) => print("Failed to add user: $error"));

      SmartDialog.showNotify(
          msg: "Connecté en tant que: ${userData['email']}",
          notifyType: NotifyType.success);

      // ignore: use_build_context_synchronously
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
      SmartDialog.dismiss();
    } on FirebaseAuthException catch (e) {
      var contenuErreur = "";
      switch (e.code) {
        case 'account-exists-with-different-credentials':
          contenuErreur =
              "Désolé, ce compte existe déjà avec un autre provider.";
          break;
        case 'invalid-credentials':
          contenuErreur = "une erreur Inconnu s'est produite";
          break;
        case 'operation-not-allowed':
          contenuErreur = "L'opération n'est pas autorisée";
          break;
        case 'user-disabled':
          contenuErreur = "L'utilisateur a été desactivé ou rejeté.";
          break;
        case 'user-not-found':
          contenuErreur = "L'utilisateur n'a pas été trouvé";
          break;
        case 'account-exists-with-different-credential':
          contenuErreur =
              "Désolé, ce compte existe déjà avec des informations différentes. Créez un nouveau compte, ou connectez vous à votre compte.";
          break;
        default:
          contenuErreur = e.code;
          break;
      }
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text("La connexion à Facebook a échouée."),
              content: Text(contenuErreur),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok")),
              ],
            )),
      );
    }
  }
}
