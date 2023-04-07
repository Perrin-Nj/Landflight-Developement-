import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../vues/home/home_screen.dart';
import 'dynamic_extension.dart';

class CommentList extends StatelessWidget {
  final String postID;

  CommentList({required this.postID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: Text("Comments"),
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
                  return Text(comment);
                }).toList(),
              ),
            );
          },
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ],
      ),
    );
  }
}
/* AlertDialog(
          title: Text('Comments'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: commentList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(commentList[index]),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: Text('Close'),
            ),
          ],
        );
      },
    ); */