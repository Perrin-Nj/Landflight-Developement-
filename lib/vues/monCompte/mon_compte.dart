import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:landflight/vues/monCompte/profile_pic_picker.dart';

class MonCompte extends StatefulWidget {
  const MonCompte({super.key});

  @override
  State<MonCompte> createState() => _MonCompteState();
}

class _MonCompteState extends State<MonCompte> {
  XFile? profilePic;
  String name = "jordan roger";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double bottomSheetHeight = 70;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  getHeader(width, height),
                  const SizedBox(
                    height: 60,
                  ),
                  getButtons(),
                  Padding(padding: EdgeInsets.only(bottom: bottomSheetHeight))
                ],
              ),
              getBottomMenu(width, bottomSheetHeight)
            ],
          ),
        ),

        // bottomSheet: getBottomMenu(width, bottomSheetHeight),
      ),
    );
  }

  changePic(XFile newPic) {
    setState(() {
      profilePic = newPic;
    });
  }

  setName(String newName) {
    setState(() {
      name = newName;
    });
  }

  Widget getHeader(double width, double height) {
    return Container(
      width: width,
      height: height * 0.25,
      padding: EdgeInsets.only(top: 35),
      decoration: BoxDecoration(
          color: Color(0xff071c91),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60))),
      child: Column(
        children: [
          getHeaderButtons(),
          SizedBox(
            height: 25,
          ),
          getProfileInfo(width)
        ],
      ),
    );
  }

  Widget getProfileInfo(double width) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        getProfilePicPickerAndNameFields(width),
        SizedBox(
          width: 20,
        ),
        getEditIcon(),
        SizedBox(
          width: 20,
        ),
      ]),
    );
  }

  Widget getProfilePicPickerAndNameFields(double width) {
    return Row(children: [
      getProfilePicPicker(),
      SizedBox(
        width: 10,
      ),
      getNameField(width)
    ]);
  }

  Widget getProfilePicPicker() {
    return ProfilePicPicker(profilePic, scale: 0.3, (newPic) {
      changePic(newPic);
    });
  }

  Widget getNameField(double width) {
    return Container(
        width: width * 0.5,
        child: TextFormField(
          style: TextStyle(color: Colors.white),
          decoration: getNameFieldDecoration(),
          initialValue: name,
          onChanged: (newName) {
            setName(newName);
          },
        ));
  }

  Widget getEditIcon() {
    return Icon(
      Icons.edit,
      color: Colors.white,
    );
  }

  Widget getHeaderButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [getBackButton(), getThreeDots()],
    );
  }

  Widget getThreeDots() {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.more_vert_outlined,
          color: Colors.white,
        ));
    ;
  }

  Widget getBackButton() {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ));
  }

  Widget getButtons() {
    return Container(
      child: Column(children: [
        getChangePhoneButton(),
        getChangeLanguageButton(),
        getChangePaiementMethodButton(),
        getChangeCommandFormButton(),
        getLogoutButton()
      ]),
    );
  }

  Widget getChangePhoneButton() {
    return getButton(Icons.phone, "Changer numéro de téléphone");
  }

  Widget getChangeLanguageButton() {
    return getButton(Icons.g_translate_outlined, "Changer de langue");
  }

  Widget getChangePaiementMethodButton() {
    return getButton(Icons.credit_card_rounded, "Changer Méthode de paiement");
  }

  Widget getChangeCommandFormButton() {
    return getButton(Icons.edit_document, "Changer formulaire de commande");
  }

  Widget getLogoutButton() {
    return getButton(Icons.logout, "Se déconnecter", onTap: () {
      back();
    });
  }

  Widget getButton(IconData iconData, String text, {Function? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
          margin: EdgeInsets.only(left: 50, bottom: 20, top: 20),
          child: Row(
            children: [
              Icon(
                iconData,
                color: Color(0xff808080),
                size: 35,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16),
              )
            ],
          )),
    );
  }

  Widget getBottomMenu(double pageWidth, double bottomSheetHeight) {
    double bottomMenuHeight = bottomSheetHeight;
    return Container(
        height: bottomMenuHeight,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            getLowerIcons(pageWidth, bottomMenuHeight),
            getUpperIcon(bottomMenuHeight)
          ],
        ));
  }

  Widget getLowerIcons(double pageWidth, double bottomMenuHeight) {
    return Container(
      width: pageWidth,
      height: bottomMenuHeight * .6,
      decoration: BoxDecoration(
        color: Color(0xffd9d9d9),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [getMapIcon(), SizedBox(), getLikeIcon()]),
    );
  }

  Widget getMapIcon() {
    return IconButton(
      iconSize: 27,
      icon: Icon(Icons.map),
      onPressed: () {},
    );
  }

  Widget getLikeIcon() {
    return IconButton(
      icon: Icon(Icons.favorite_border_rounded),
      onPressed: () {},
      iconSize: 27,
    );
  }

  Widget getUpperIcon(double bottomMenuHeight) {
    return CircleAvatar(
      backgroundColor: Color(0xffd9d9d9),
      radius: bottomMenuHeight / 2,
      child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: IconButton(
            icon: Icon(Icons.home_outlined),
            color: Colors.black,
            onPressed: () {},
            iconSize: 30,
          )),
    );
  }

  back() {
    Navigator.of(context).pop();
  }

  InputDecoration getNameFieldDecoration() {
    return InputDecoration(
        border: InputBorder.none, contentPadding: EdgeInsets.only(right: 40));
  }
}
