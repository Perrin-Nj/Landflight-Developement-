import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserLikedPostController extends StatefulWidget {
  const UserLikedPostController({super.key});

  @override
  State<UserLikedPostController> createState() => _UserLikedPostControllerState();
}

class _UserLikedPostControllerState extends State<UserLikedPostController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('user').snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) {
      return Text('Something went wrong');
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return Text("Loading");
    }

    final likedPosts = snapshot.data?.docs.map((doc) => doc['likedPosts']).toList();

    return ListView.builder(
      itemCount: likedPosts?.length,
      itemBuilder: (context, index) {
        final likePost = likedPosts![index];
        // check if a particular 'likePost' belong to the retrieved 'likedPösts'
        // do something with it
        return ListTile(
          title: Text(likePost),
        );
      },
    );
  },
);
  }
}