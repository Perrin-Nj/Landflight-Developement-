import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:landflight/vues/splash_screen.dart';

class OnboardingBase extends StatelessWidget {
  String? imagePath;
  String? title;
  String? description;
  int? index;
  Function? next;
  Function? back;
  Function? sweepleft;

  OnboardingBase(
      {Key? key,
      this.imagePath,
      this.title,
      this.description,
      this.index,
      this.next,
      this.back,
      this.sweepleft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: ((details) {
          changeOnboardingPane(details);
        }),
        child: Scaffold(
            body: Column(
          children: [
            getImageWidget(),
            getTitleWidget(),
            getDescription(),
            getDivider(),
            getBottomWidgets(context),
          ],
        )));
  }

  getImageWidget() {
    BoxDecoration decoration =
        BoxDecoration(image: DecorationImage(image: AssetImage(imagePath!)));
    return Container(
      decoration: decoration,
      width: 283,
      height: 283,
      margin: const EdgeInsets.only(top: 170, bottom: 50),
    );
  }

  getTitleWidget() {
    TextStyle titleStyle = TextStyle(
      fontFamily: "inter",
      fontSize: 20,
    );
    return Container(
      child: Text(
        title!,
        style: titleStyle,
      ),
    );
  }

  getDescription() {
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 58, right: 58),
      child: Text(
        description!,
        textAlign: TextAlign.center,
      ),
    );
  }

  getDivider() {
    return Container(
      margin: EdgeInsets.only(top: 28),
      width: 88,
      child: const Divider(
        thickness: 3,
        color: Color(0xff000000),
      ),
    );
  }

  getBottomWidgets(context) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [getBackButton(context), getDots(), getNextButton()],
        ));
  }

  getBackButton(context) {
    if (back != null && index! < 2) {
      // if (back != null) {
      TextStyle textStyle = const TextStyle(
          fontFamily: "inter", fontSize: 17, color: Color(0xff000000));
      return TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
            );
          },
          child: Text(
            "Passer",
            style: textStyle,
          ));
    } else {
      return SizedBox(
        width: 90,
      );
    }
  }

  getDots() {
    return Container(
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getCircle(0, index),
            getCircle(1, index),
            getCircle(2, index)
          ],
        ));
  }

  getNextButton() {
    String text = index == 2 ? "Terminer" : "Suivant";
    TextStyle textStyle = const TextStyle(
        fontFamily: "inter", fontSize: 17, color: Color(0xff000000));
    return TextButton(
        onPressed: () {
          next!();
        },
        child: Text(
          text,
          style: textStyle,
        ));
  }

  getCircle(circleIndex, filledCircleIndex) {
    BoxDecoration circleDecoration;
    if (circleIndex == filledCircleIndex) {
      circleDecoration = BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff0F2CFF),
          border: Border.all(width: 1));
    } else {
      circleDecoration =
          BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1));
    }
    return Container(
      height: 15,
      width: 15,
      decoration: circleDecoration,
    );
  }

  changeOnboardingPane(details) {
    int sensitivity = 8;
    if (details.delta.dx > sensitivity) {
      // Right Swipe
      if (index! > 0) {
        back!();
      }
    } else if (details.delta.dx < -sensitivity) {
      //Left Swipe
      next!();
    }
  }
}
