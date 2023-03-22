import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:landflight/vues/onboarding/onboarding3.dart';
import 'package:landflight/vues/onboarding/onboarding_base.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBase(
        imagePath: "assets/images/onboarding2.png",
        title: "Choisissez votre destination",
        description:
            "Parmi nos nombreuses agences partenaires, choisissez l’agence qui vous inspire et arrivez en toute sécurité",
        index: 1,
        back: () {
          retour(context);
        },
        next: () {
          suivant(context);
        });
  }

  retour(BuildContext context) {
    Navigator.pop(context);
  }

  suivant(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Onboarding3()),
    );
  }
}
