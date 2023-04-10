import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:landflight/vues/commandeBilletBus/recherche_voyage.dart';

class CommandeBillet extends StatefulWidget {
  const CommandeBillet({super.key});

  @override
  State<CommandeBillet> createState() => _CommandeBilletState();
}

class _CommandeBilletState extends State<CommandeBillet> {
  List<Map> recentResearchMaps = [
    {
      "from": "Yaounde",
      "to": "Douala",
      "date": "Sam, 02 Juin",
      "agence": "Générale Voyage",
      "type": "VIP"
    },
    {
      "from": "Yaounde",
      "to": "Douala",
      "date": "Sam, 02 Juin",
      "agence": "Générale Voyage",
      "type": "Standard"
    },
    {
      "from": "Yaounde",
      "to": "Douala",
      "date": "Sam, 02 Juin",
      "agence": "Générale Voyage",
      "type": "VIP"
    },
    {
      "from": "Yaounde",
      "to": "Douala",
      "date": "Sam, 02 Juin",
      "agence": "Générale Voyage",
      "type": "VIP"
    }
  ];
  double leftIconSize = 30;
  double rightIconSize = 30;
  double bottomSheetHeight = 70;
  String nombreDePassagers = "01 passager";
  List<String> listPassagers = ["01 passager", "02 passagers", "03 passager"];
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xffcccccc),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        getUpperSection(),
                        getLowerSection(),
                      ],
                    ),
                  ),
                ),
                getBottomMenu(
                    MediaQuery.of(context).size.width, bottomSheetHeight)
              ])),
    );
  }

  Widget getUpperSection() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white),
      child: Column(children: [
        getHeader(),
        getForm(),
        getValidationButton(),
        SizedBox(
          height: 15,
        )
      ]),
    );
  }

  Widget getHeader() {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [getLeftHeaderSection(), getHeaderImage()],
    ));
  }

  Widget getLeftHeaderSection() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getBackButton(),
            SizedBox(
              height: 20,
            ),
            getHeadingText()
          ]),
    );
  }

  Widget getBackButton() {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Color(0xff071C91),
        ));
  }

  Widget getHeadingText() {
    TextStyle headingTextStyle =
        TextStyle(fontSize: 30, color: Color(0xFF071C91));

    TextStyle subHeadingTextStyle =
        TextStyle(fontSize: 17, color: Color(0xFF000000));
    return Column(
      children: [
        Text(
          "Commandez",
          style: headingTextStyle,
        ),
        Text(
          "Votre billet de bus",
          style: subHeadingTextStyle,
        )
      ],
    );
  }

  Widget getHeaderImage() {
    String baseImagePath = "lib/assets/images/";
    return Expanded(
      child:
          Image(image: AssetImage("${baseImagePath}bus_with_background.png")),
    );
  }

  Widget getForm() {
    return Container(
      alignment: Alignment.center,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        getPositionField(),
        SizedBox(
          height: 30,
        ),
        getDestinationField(),
        SizedBox(
          height: 30,
        ),
        getPassengersField(),
        SizedBox(
          height: 10,
        ),
        getDateField()
      ]),
    );
  }

  Widget getPositionField() {
    return getCustomField(
        helperText: "Entrez votre postion",
        showOrderIcon: true,
        iconData: Icons.add_location_outlined);
  }

  getCustomField(
      {required String helperText,
      bool showOrderIcon = false,
      required IconData iconData}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getFieldHelperText(helperText),
        Container(
          width: MediaQuery.of(context).size.width * 0.7 +
              leftIconSize +
              6 +
              rightIconSize,
          child: Row(
            children: [
              getFieldAndIcon(iconData, context),
              getRightIcon(showOrderIcon)
            ],
          ),
        )
      ],
    );
  }

  getCustomDropDownField(
      {required String helperText,
      bool showOrderIcon = false,
      required IconData iconData}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getFieldHelperText(helperText),
        Container(
          width: MediaQuery.of(context).size.width * 0.7 +
              leftIconSize +
              6 +
              rightIconSize,
          child: Row(
            children: [
              getDropDownFieldAndIcon(iconData, context),
              getRightIcon(showOrderIcon)
            ],
          ),
        )
      ],
    );
  }

  Widget getRightIcon(bool canShow) {
    if (canShow) {
      return getIcon(Icons.sort, rightIconSize);
    } else {
      return SizedBox(
        width: rightIconSize,
      );
    }
  }

  Widget getFieldHelperText(String text) {
    return Container(
        margin: EdgeInsets.only(left: leftIconSize + 5),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              color: Color(0xff071C91),
              fontWeight: FontWeight.w300),
        ));
  }

  Widget getFieldAndIcon(IconData iconData, BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7 + leftIconSize + 6,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            getIcon(iconData, leftIconSize),
            Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: getTextField(leftPadding: leftIconSize + 5))
          ],
        ));
  }

  Widget getDropDownFieldAndIcon(IconData iconData, BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7 + leftIconSize + 6,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            getIcon(iconData, leftIconSize),
            Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: getDropDownField(leftPadding: leftIconSize + 5))
          ],
        ));
  }

  Widget getIcon(IconData iconData, double size) {
    return Icon(
      iconData,
      size: size,
    );
  }

  Widget getTextField({double leftPadding = 0}) {
    return TextField(
      style: TextStyle(fontSize: 19),
      decoration:
          InputDecoration(contentPadding: EdgeInsets.only(left: leftPadding)),
    );
  }

  Widget getDropDownField({double leftPadding = 0}) {
    return DropdownButton(
        value: nombreDePassagers,
        items: listPassagers
            .map((e) => DropdownMenuItem(
                  child: Container(
                      padding: EdgeInsets.only(left: leftPadding),
                      child: Text(
                        e,
                        style: TextStyle(fontSize: 19, color: Colors.black),
                      )),
                  value: e,
                ))
            .toList(),
        onChanged: (String? e) {
          e != null
              ? setState(() {
                  nombreDePassagers = e;
                })
              : null;
        });
  }

  Widget getDestinationField() {
    return getCustomField(
        helperText: "Entrez votre destination",
        showOrderIcon: false,
        iconData: Icons.location_on);
  }

  Widget getPassengersField() {
    return getCustomDropDownField(
        helperText: "Nombre de passagers", iconData: Icons.group);
  }

  Widget getDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [getDateTitle(), getDateButtons()],
    );
  }

  Widget getDateTitle() {
    return Text("Choisissez la date du voyage");
  }

  Widget getDateButtons() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7 +
            leftIconSize +
            6 +
            rightIconSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getDatePickerButton(),
            Row(children: [
              getTodayButton(),
              SizedBox(
                width: 5,
              ),
              getTomorrowButton()
            ]),
          ],
        ));
  }

  Widget getDatePickerButton() {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            getDateIcon(),
            SizedBox(
              width: 10,
            ),
            getDateText()
          ],
        ),
      ),
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: currentDate,
                firstDate: DateTime.now(),
                lastDate: currentDate.add(Duration(days: 365)))
            .then((newDate) => setState(
                  () {
                    if (newDate != null) {
                      currentDate = newDate;
                    }
                  },
                ));
      },
    );
  }

  Widget getDateIcon() {
    return Icon(
      Icons.date_range,
      color: Colors.blue,
    );
  }

  Widget getDateText() {
    return Text(getCurrentDateString());
  }

  Widget getTodayButton() {
    return TextButton(onPressed: changeDateToToday, child: Text("Aujourd'hui"));
  }

  Widget getTomorrowButton() {
    return TextButton(onPressed: changeDateToTomorrow, child: Text("Demain"));
  }

  Widget getValidationButton() {
    TextStyle validationTextStyle = TextStyle(
        fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RechercheVoyage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),
        child: Text("Chercher un voyage", style: validationTextStyle),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(22)),
            color: Color(0xFF071C91)),
      ),
    );
  }

  Widget getLowerSection() {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [getRecentResearchTitle(), getRecentResearchCards()]),
    );
  }

  Widget getRecentResearchTitle() {
    return Container(
      margin: EdgeInsets.only(left: 30, top: 20, bottom: 5),
      child: Text(
        "Recherches récentes",
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget getRecentResearchCards() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Row(
              children: recentResearchMaps
                  .map((element) => getRecentResearchCard(element))
                  .toList()),
        ));
  }

  Widget getRecentResearchCard(Map recentResearch) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        color: Colors.white,
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [getCardTextSection(recentResearch), getSortIcon()]),
    );
  }

  Widget getCardTextSection(Map recentResearch) {
    double pageWidth = MediaQuery.of(context).size.width;
    double cardTextWidth = pageWidth * 0.3;
    return Container(
      width: cardTextWidth,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        getFromToText(recentResearch),
        getCardDateText(recentResearch),
        getAgencyText(recentResearch),
        getTypeText(recentResearch)
      ]),
    );
  }

  getFromToText(Map recentResearch) {
    return Text(
      "De ${recentResearch["from"]} à ${recentResearch["to"]}",
      style: TextStyle(fontWeight: FontWeight.w500),
    );
  }

  getCardDateText(Map recentResearch) {
    return Text(
      recentResearch["date"],
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
    );
  }

  getAgencyText(Map recentResearch) {
    return Text(recentResearch["agence"],
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400));
  }

  getTypeText(Map recentResearch) {
    return Text(recentResearch["type"],
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300));
  }

  Widget getSortIcon() {
    return getIcon(Icons.sort, rightIconSize);
  }

  String getCurrentDateString() {
    return "${getWeekDayStr(currentDate.weekday)}, ${currentDate.day} ${getMonthStr(currentDate.month)}";
  }

  String getWeekDayStr(int weekDay) {
    List<String> weekDays = ["Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"];
    return weekDays[weekDay - 1];
  }

  String getMonthStr(int month) {
    List<String> months = [
      "Janvier",
      "Février",
      "Mars",
      "Avril",
      "Mai",
      "Juin",
      "Juillet",
      "Août",
      "Septembre",
      "Octobre",
      "Novembre",
      "Décembre"
    ];
    return months[month - 1];
  }

  void changeDateToToday() {
    setState(() {
      currentDate = DateTime.now();
    });
  }

  void changeDateToTomorrow() {
    setState(() {
      currentDate = DateTime.now().add(Duration(days: 1));
    });
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
}
