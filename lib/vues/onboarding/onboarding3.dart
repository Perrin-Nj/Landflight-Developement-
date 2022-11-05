import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:landflight/vues/onboarding/onboarding_base.dart';
import 'package:landflight/vues/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingBase(
        imagePath: "lib/assets/images/onboarding3.png",
        title: "Emmenez votre famille",
        description:
            "Commandez autant de billet que possible, nos offres et cadeaux serons à votre merci.",
        index: 2,
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
    setOnboardedSharedPreference();

    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => const Home()), (r) {
      return false;
    });
  }

  setOnboardedSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboarded', true);
  }
}
