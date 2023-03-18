import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:landflight/vues/onboarding/onboarding1.dart';
import 'package:landflight/vues/onboarding/onboarding2.dart';
import 'package:landflight/vues/onboarding/onboarding_base.dart';
import 'package:landflight/vues/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoixLangue extends StatefulWidget {
  const ChoixLangue({super.key});

  @override
  State<ChoixLangue> createState() => _ChoixLangueState();
}

class _ChoixLangueState extends State<ChoixLangue> {
  String language = 'français';
  Future shouldGoHome = checkIfOnboardingAlreadyMade();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: shouldGoHome,
        builder: (context, snapshot) {
          Widget mainWidget;
          if (snapshot.hasError) {
            mainWidget = getChoixDeLangue();
          } else if (snapshot.hasData) {
            if (snapshot.data == true) {
              mainWidget = Home();
            } else {
              mainWidget = getChoixDeLangue();
            }
          } else {
            mainWidget = getLoadingScreen();
          }
          return mainWidget;
        });
  }

  getChoixDeLangue() {
    return Scaffold(
        body: Column(
      children: [
        getLeftLogo(),
        const SizedBox(
          height: 40,
        ),
        getTitleWidget(),
        const SizedBox(
          height: 50,
        ),
        getLanguagesImages(),
        const SizedBox(
          height: 200,
        ),
        getContinueButton()
      ],
    ));
  }

  getLeftLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 50),
          child: const Image(
              width: 120, image: AssetImage("lib/assets/images/logo.png")),
        )
      ],
    );
  }

  getTitleWidget() {
    TextStyle textSyle = const TextStyle(
        fontFamily: 'inter-regular',
        fontSize: 21,
        fontWeight: FontWeight.w300,
        color: Color(0xff424E79));

    TextStyle boldTextSyle = const TextStyle(
        fontFamily: 'inter',
        fontSize: 21,
        fontWeight: FontWeight.w300,
        color: Color(0xff424E79));
    return Container(
        child: Column(children: [
      Text(
        "Choisissez votre langue",
        style: textSyle,
      ),
      Text(
        "/",
        style: boldTextSyle,
      ),
      Text(
        "Choose your language",
        style: textSyle,
      ),
    ]));
  }

  getLanguagesImages() {
    return Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getLanguageCard("lib/assets/images/french flag.png", "Français",
                () {
              changeLanguage("français");
            }),
            getLanguageCard("lib/assets/images/english flag.png", "English",
                () {
              changeLanguage("anglais");
            })
          ],
        ));
  }

  changeLanguage(newLanguage) {
    setState(() {
      language = newLanguage;
    });
  }

  getContinueButton() {
    TextStyle regularStyle = const TextStyle(
        color: Color(0xff071C91), fontFamily: "inter-regular", fontSize: 18);
    TextStyle boldStyle = const TextStyle(
        color: Color(0xff071C91), fontFamily: "inter", fontSize: 18);
    return GestureDetector(
      onTap: () {
        goToOnboarding1();
      },
      child: Container(
          margin: const EdgeInsets.only(right: 40),
          decoration: const BoxDecoration(color: Color(0x00ffffff)),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Text("Continuer en ", style: regularStyle),
            Text(language, style: boldStyle),
            const SizedBox(
              width: 10,
            ),
            getNextIcon()
          ])),
    );
  }

  getNextIcon() {
    return Image(image: AssetImage("lib/assets/images/nextIcon.png"));
  }

  getLanguageCard(imagePath, title, Function changeLanguage) {
    BoxDecoration languageCardDecoration = const BoxDecoration(
      color: Color(0xffD9D9D9),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );

    TextStyle textStyle = const TextStyle(
        fontFamily: 'inter-regular', color: Color(0xff424E79), fontSize: 20);
    return GestureDetector(
      onTap: () {
        changeLanguage();
      },
      child: Container(
          width: 140,
          height: 250,
          decoration: languageCardDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(imagePath)),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: textStyle,
              ),
            ],
          )),
    );
  }

  goToOnboarding1() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Onboarding1()),
    );
  }

  goHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  getLoadingScreen() {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(),
          ),
        ]));
  }
}

checkIfOnboardingAlreadyMade() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('onboarded') &&
      prefs.getBool('onboarded') != null &&
      prefs.getBool('onboarded')!;
}
