import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RechercheVoyage extends StatefulWidget {
  const RechercheVoyage({super.key});

  @override
  State<RechercheVoyage> createState() => _RechercheVoyageState();
}

class _RechercheVoyageState extends State<RechercheVoyage> {
  late String selectedFilterItem = filterItems[0];
  List<String> filterItems = [
    "Trier par",
    "Nom de l'agence",
    "Heure de voyage",
    "Lieu de départ",
    "Type de voyage"
  ];
  List<Map> results = [];
  List<Map> initial_items = [
    {
      "agency_pic":
          "https://assets.volvo.com/is/image/VolvoInformationTechnologyAB/2326x800-volvo-9700-CGI?qlt=82&wid=1920&ts=1656563752972&dpr=off&fit=constrain",
      "agency_name": "NINA voyage",
      "start_time": 2300,
      "end_time": 100,
      "ticket_type": "VIP",
      "ticket_price": 7000,
      "state": "voyage passé",
      "start_town": "Yaoundé",
      "start_quarter": "Mvan",
      "end_town": "Douala",
      "end_quarter": "Akwa",
    },
    {
      "agency_pic":
          "https://assets.volvo.com/is/image/VolvoInformationTechnologyAB/2326x800-volvo-9700-CGI?qlt=82&wid=1920&ts=1656563752972&dpr=off&fit=constrain",
      "agency_name": "NINA voyage",
      "start_time": 700,
      "end_time": 1100,
      "ticket_type": "VIP",
      "ticket_price": 7000,
      "state": "voyage passé",
      "start_town": "Garoua",
      "start_quarter": "Ekang",
      "end_town": "Douala",
      "end_quarter": "Akwa",
    },
    {
      "agency_pic":
          "https://assets.volvo.com/is/image/VolvoInformationTechnologyAB/2326x800-volvo-9700-CGI?qlt=82&wid=1920&ts=1656563752972&dpr=off&fit=constrain",
      "agency_name": "United Express",
      "start_time": 1300,
      "end_time": 1700,
      "ticket_type": "VIP",
      "ticket_price": 7000,
      "state": "voyage passé",
      "start_town": "Douala",
      "start_quarter": "Akwa",
      "end_town": "Yaounde",
      "end_quarter": "Mvan",
    },
    {
      "agency_pic":
          "https://assets.volvo.com/is/image/VolvoInformationTechnologyAB/2326x800-volvo-9700-CGI?qlt=82&wid=1920&ts=1656563752972&dpr=off&fit=constrain",
      "agency_name": "Touristique Express",
      "start_time": 2300,
      "end_time": 100,
      "ticket_type": "Standard",
      "ticket_price": 7000,
      "state": "voyage passé",
      "start_town": "Yaoundé",
      "start_quarter": "Mvan",
      "end_town": "Douala",
      "end_quarter": "Akwa",
    },
  ];

  double bottomSheetHeight = 70;

  @override
  void initState() {
    // TODO: implement initState
    results = initial_items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                getHeader(),
                SizedBox(
                  height: 20,
                ),
                getSearchDropDown(),
                SizedBox(
                  height: 15,
                ),
                getSearchResult(),
                getSearchButton(),
              ],
            ),
          )),
          getBottomMenu(MediaQuery.of(context).size.width, bottomSheetHeight)
        ],
      )),
    );
  }

  Widget getHeader() {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [getBackButton(), getTripResultsTitle(), getIcon()]),
    );
  }

  Widget getSearchDropDown() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 3,
                offset: Offset(0, 3))
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: DropdownButton<String>(
          underline: SizedBox(),
          value: selectedFilterItem,
          onChanged: (String? newItem) {
            if (newItem != null) {
              setState(() {
                selectedFilterItem = newItem;
              });
            }
          },
          items: filterItems
              .map((e) => DropdownMenuItem<String>(
                    child: Container(
                        margin: EdgeInsets.only(left: 10, right: 30),
                        child: Text(e)),
                    value: e,
                  ))
              .toList()),
    );
  }

  Widget getSearchResult() {
    List<Widget> searchItems = [];
    for (Map item in results) {
      searchItems.addAll([
        getSearchItem(item),
        SizedBox(
          height: 20,
        )
      ]);
    }
    return Container(
        child: Column(
      children: searchItems,
    ));
  }

  Widget getSearchItem(Map itemMeta) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xffa5c1c7),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff000000).withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 4))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getLeftSearchItemSection(itemMeta),
            getRightSearchItemSection(itemMeta)
          ],
        ));
  }

  Widget getLeftSearchItemSection(Map itemMeta) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getImageAndName(itemMeta),
          SizedBox(
            height: 10,
          ),
          getTimes(itemMeta),
          SizedBox(
            height: 10,
          ),
          getLocations(itemMeta)
        ],
      ),
    );
  }

  Widget getLocations(Map itemMeta) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getStartLocationWidget(itemMeta),
        getEndLocationWidget(itemMeta)
      ],
    );
  }

  Widget getEndLocationWidget(Map itemMeta) {
    return Row(
      children: [
        getEndLocationIcon(itemMeta),
        getEndLocationTown(itemMeta),
        getEndLocationQuarter(itemMeta)
      ],
    );
  }

  Widget getEndLocationIcon(Map itemMeta) {
    return Icon(size: 20, Icons.location_on_outlined);
  }

  Widget getEndLocationTown(itemMeta) {
    return Text("${itemMeta['end_town']},",
        style: TextStyle(color: Color(0xff071C91), fontSize: 12));
  }

  Widget getEndLocationQuarter(itemMeta) {
    return Text(
      " ${itemMeta["end_quarter"]}",
      style: TextStyle(fontSize: 11),
    );
  }

  Widget getStartLocationWidget(Map itemMeta) {
    return Row(
      children: [
        getStartLocationIcon(itemMeta),
        getStartLocationTown(itemMeta),
        getStartLocationQuarter(itemMeta)
      ],
    );
  }

  Widget getStartLocationIcon(Map itemMeta) {
    return Icon(size: 20, Icons.bus_alert_outlined);
  }

  Widget getStartLocationTown(itemMeta) {
    return Text(
      "${itemMeta['start_town']},",
      style: TextStyle(color: Color(0xff071C91), fontSize: 12),
    );
  }

  Widget getStartLocationQuarter(itemMeta) {
    return Text(
      " ${itemMeta["start_quarter"]}",
      style: TextStyle(fontSize: 11),
    );
  }

  Widget getImageAndName(Map itemMeta) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(itemMeta["agency_pic"]),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          itemMeta["agency_name"],
          style:
              TextStyle(color: Color(0xff336671), fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget getTimes(Map meta) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getTimeText(meta["start_time"]),
            getTimeDivider(),
            getDurationWidget(
                getDuration(meta["start_time"], meta["end_time"])),
            getTimeDivider(),
            getTimeText(meta["end_time"])
          ],
        ));
  }

  Widget getTimeDivider() {
    return Container(
        width: 20,
        child: Divider(
          color: Color(0xff336671),
        ));
  }

  String getDuration(int startTime, int endTime) {
    int startTimeHours = startTime ~/ 100;
    int startTimeMinutes = startTime % 100;
    int endTimeHours = endTime ~/ 100;
    int endTimeMinutes = endTime % 100;

    if (endTime < startTime) {
      endTimeHours = endTimeHours + 24;
    }
    int durationHours = endTimeHours - startTimeHours;
    int durationMinutes = endTimeMinutes - startTimeMinutes;
    if (durationHours == 0) {
      return "${durationMinutes}m";
    } else {
      return "${durationHours}h";
    }
  }

  Widget getTimeText(int time) {
    String displayTime = getDisplayTime(time);
    return Text(
      "$displayTime",
    );
  }

  String getDisplayTime(int time) {
    String displayHours;
    String displayMinutes;
    int hours = time ~/ 100;
    int minutes = time % 100;
    if (hours < 10) {
      displayHours = "0$hours";
    } else {
      displayHours = "$hours";
    }
    if (minutes < 10) {
      displayMinutes = "0$minutes";
    } else {
      displayMinutes = "$minutes";
    }
    return "${displayHours}h${displayMinutes}";
  }

  Widget getDurationWidget(String duration) {
    return Text(
      duration,
      style: TextStyle(color: Color(0xff336671)),
    );
  }

  Widget getRightSearchItemSection(Map itemMeta) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getTicketType(itemMeta),
        SizedBox(
          height: 5,
        ),
        getTicketPrice(itemMeta),
        SizedBox(
          height: 5,
        ),
        getTripStatus(itemMeta)
      ],
    );
  }

  Widget getTicketType(Map itemMeta) {
    return Text(
      itemMeta["ticket_type"],
      style: TextStyle(fontSize: 12, color: Color(0xff0987AE)),
    );
  }

  Widget getTicketPrice(Map itemMeta) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xff071C91),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: [
            Text(
              "${itemMeta["ticket_price"]}",
              style: TextStyle(color: Color(0xffffffff)),
            ),
            Text(
              "FCFA",
              style: TextStyle(color: Color(0xffffffff), fontSize: 10),
            )
          ],
        ));
  }

  Widget getTripStatus(Map itemMeta) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Color(0xffEDFF20),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Text(
        itemMeta["state"],
        style: TextStyle(fontSize: 10),
      ),
    );
  }

  Widget getSearchButton() {
    TextStyle validationTextStyle = TextStyle(
        fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500);

    return InkWell(
      onTap: () {
        search();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 30),
        child: Text("Chercher encore", style: validationTextStyle),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(22)),
            color: Color(0xFF071C91)),
      ),
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

  Widget getTripResultsTitle() {
    return Row(
      children: [
        Text(
          "${results.length} ",
          style: TextStyle(color: Color(0xff071C91)),
        ),
        Text("Voyages trouvés", style: TextStyle(color: Color(0xff789aa1)))
      ],
    );
  }

  Widget getIcon() {
    String baseImagePath = "lib/assets/images/";
    return Container(
      width: 90,
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("${baseImagePath}bus_with_background.png"),
              fit: BoxFit.fill)),
    );
  }

  search() {
    switch (selectedFilterItem) {
      case "Nom de l'agence":
        filterItemsByName();
        break;

      case "Heure de voyage":
        filterItemsByStartTime();
        break;

      case "Lieu de départ":
        filterItemsByStartPlace();
        break;

      case "Type de voyage":
        filterItemsByTripType();
        break;
      default:
        getInitialItems();
    }
  }

  filterItemsByName() {
    filterItemsBy("agency_name");
  }

  filterItemsByStartTime() {
    filterItemsBy("start_time");
  }

  filterItemsByStartPlace() {
    filterItemsBy("start_town");
  }

  filterItemsByTripType() {
    filterItemsBy("ticket_type");
  }

  getInitialItems() {
    setState(() {
      results = List.from(initial_items);
    });
  }

  filterItemsBy(String key) {
    results = List.from(initial_items);
    setState(() {
      results..sort((e1, e2) => e1[key].compareTo(e2[key]));
    });
  }
}
