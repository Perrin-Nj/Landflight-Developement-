import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:landflight/vues/monCompte/mon_compte.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(100),
        child: Row(
          children: [
            Text(
              "Home",
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
                onPressed: () {
                  goToMonCompte(context);
                },
                child: Text("edit Profile"))
          ],
        ),
      ),
    );
  }

  goToMonCompte(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MonCompte()));
  }
}
