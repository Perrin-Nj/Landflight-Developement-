import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfilePicPicker extends StatelessWidget {
  XFile? pic;
  Function changePic;
  double scale;
  String baseImagePath = "assets/images/";
  ProfilePicPicker(this.pic, this.changePic, {this.scale = 1, super.key});

  @override
  Widget build(BuildContext context) {
    double width = getContextRatioWidth(context, 1 / 3);
    return getPicWidget(context, width);
  }

  getContextRatioWidth(BuildContext context, double ratio) {
    return MediaQuery.of(context).size.width * ratio;
  }

  Widget getLoadingWidget(BuildContext context, double width) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: width,
      child: SpinKitCircle(
          color: Theme.of(context).primaryColor,
          size: getContextRatioWidth(context, 0.15)),
    );
  }

  Widget getPicWidget(BuildContext context, double width) {
    Widget picChild;

    if (pic != null) {
      picChild = getChosenImageWidget(width * scale);
    } else {
      picChild = getDefaultPic(width * scale);
    }

    return GestureDetector(
        onTap: () async {
          final ImagePicker picker = ImagePicker();
          final XFile? image =
              await picker.pickImage(source: ImageSource.gallery);
          if (image != null) {
            changePic(image);
          }
        },
        child: picChild);
  }

  Widget getChosenImageWidget(double width) {
    return CircleAvatar(
      radius: width / 2,
      backgroundImage: FileImage(File(pic!.path)),
    );
  }

  Widget getDefaultPic(double width) {
    return Container(
      width: width,
      height: width,
      decoration: getDefaultPicContainerDecoration(),
    );
  }

  getDefaultPicContainerDecoration() {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage("${baseImagePath}defaultProfilePic.png")));
  }
}
