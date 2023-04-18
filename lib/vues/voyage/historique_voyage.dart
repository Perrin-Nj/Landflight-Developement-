import 'package:flutter/material.dart';
import 'package:landflight/utils/theme.dart';
import 'package:landflight/vues/home/home_screen.dart';

class Historique_voyage extends StatefulWidget {
  Historique_voyage({Key? key}) : super(key: key);

  @override
  State<Historique_voyage> createState() => _Historique_voyageState();
}

class _Historique_voyageState extends State<Historique_voyage> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final widht = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(204, 204, 204, 1),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Historique de Voyage",
          style:
              TextStyle(color: PRIMARY_COLOR, fontSize: 16, fontFamily: "Bold"),
        ),
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: PRIMARY_COLOR,
            )),
        backgroundColor: Color.fromRGBO(204, 204, 204, 1),
      ),
      body: Container(
        height: heigth,
        width: widht,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 113,
              width: widht * 0.6,
              decoration: BoxDecoration(
                  color: GRAY_COLOR,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      topLeft: Radius.circular(100))),
              child: Image.asset("assets/images/image 45.png"),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: widht,
                height: heigth * 0.72,
                padding: EdgeInsets.all(10),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widht < 650
                            ? widht < 450
                                ? 2
                                : 3
                            : 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) => Card(
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: WHITE_COLOR,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Text("De Yaoundé à Douala",
                                        style: TextStyle(
                                            color: FONT_COLOR.withOpacity(.8),
                                            fontSize: 15,
                                            fontFamily: "Regular")),
                                  ),
                                  const Expanded(
                                      flex: 1, child: Icon(Icons.swap_vert))
                                ],
                              ),
                              Text("Sam, 02 Juin",
                                  style: TextStyle(
                                      color: FONT_COLOR.withOpacity(.8),
                                      fontSize: 12,
                                      fontFamily: "Light")),
                              Text("Générale Voyage",
                                  style: TextStyle(
                                      color: FONT_COLOR.withOpacity(.8),
                                      fontSize: 15,
                                      fontFamily: "Light")),
                              Text("02 places",
                                  style: TextStyle(
                                      color: FONT_COLOR.withOpacity(.8),
                                      fontSize: 12,
                                      fontFamily: "Light")),
                              Text("VIP",
                                  style: TextStyle(
                                      color: FONT_COLOR.withOpacity(.8),
                                      fontSize: 12,
                                      fontFamily: "Light")),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
