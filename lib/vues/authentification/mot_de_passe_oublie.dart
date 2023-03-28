import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:landflight/vues/authentification/login.dart';
import 'package:landflight/vues/authentification/registration.dart';

class MotdepasseOublie extends StatefulWidget {
  const MotdepasseOublie({super.key});

  @override
  State<MotdepasseOublie> createState() => _MotdepasseOublieState();
}

class _MotdepasseOublieState extends State<MotdepasseOublie> {
  final emailController = TextEditingController();
  final formKeyReset = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    return (!regex.hasMatch(value)) ? "Entrez un email valide" : null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        const Text(
          "Recevez un email pour \n Réinitialiser votre mot de passe.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          key: formKeyReset,
          decoration: const InputDecoration(labelText: "Entrez votre email."),
          controller: emailController,
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) => validateEmail(email!),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          style:
              ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          onPressed: resetPassword,
          icon: const Icon(
            Icons.email_outlined,
          ),
          label: const Text("Réinitialisez le mot de passe"),
        ),
      ]),
    );
  }

  Future resetPassword() async {
    SmartDialog.showLoading();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );
      SmartDialog.showNotify(
        useAnimation: true,
        msg: "Email de réinitialisation envoyé",
        notifyType: NotifyType.success,
      );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      SmartDialog.showNotify(
          msg: "Désolé, une erreur s'est produite...${e.message}",
          useAnimation: true,
          notifyType: NotifyType.error);
    }
    SmartDialog.dismiss();
  }
}
