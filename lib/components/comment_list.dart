import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:landflight/utils/theme.dart';
import 'package:landflight/vues/home/homepage.dart';
import '../vues/home/home_screen.dart';
import 'dynamic_extension.dart';

class CommentList extends StatelessWidget {
  String postID;

  CommentList({required this.postID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: Text("Commentaires sur l'agence"),
        content: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('post')
              .doc(postID)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;

            List<dynamic> comments = data['comments'];

            return SingleChildScrollView(
              child: ListBody(
                children: comments.map((comment) {
                  return Card(
                    color: Colors.green[50],
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(comment),
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
