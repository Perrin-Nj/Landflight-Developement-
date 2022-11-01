import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:landflight/vues/onboarding/onboarding2.dart';
import 'package:landflight/vues/onboarding/onboarding_base.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBase(
        imagePath: "lib/assets/images/onboarding1.png",
        title: "Planifiez votre voyage",
        description:
            "Planifiez votre voyage, dés maintenant en restant chez vous.",
        index: 0,
        back: () {
          retour(context);
        },
        next: () {
          suivant(context);
        },
        sweepleft: () {
          suivant(context);
        });
  }

  retour(BuildContext context) {
    Navigator.pop(context);
  }

  suivant(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Onboarding2()),
    );
  }
}
