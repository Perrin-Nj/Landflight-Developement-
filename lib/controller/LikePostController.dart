import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LikePostController extends ChangeNotifier {
  bool isLiked = false;

  static var staticPostUid;
  var postUid = staticPostUid;

  static int like = 0;
  int like2 = like;

  final User? user = FirebaseAuth.instance.currentUser;

  void onClickLike() {
    isLiked = !isLiked;
    notifyListeners();
  }

  void incrementLike(var postID) {
    like2 = like2 + 1;
    notifyListeners();
    //  print(user!.uid);
    var userId = user!.uid;
    final docUser = FirebaseFirestore.instance.collection("user").doc(userId);
    docUser.update({'likedPost': postID});
  }
/*
  void decrementLike() {
    like2 = like2 - 1;
    notifyListeners();

    var userId = user!.uid;
    final docUser = FirebaseFirestore.instance.collection("user").doc(userId);
    docUser.update({'likedPost': ""});
  }*/
}
