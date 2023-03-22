import 'package:flutter/material.dart';

class CommentController extends ChangeNotifier {
  bool iscomment = false;
  void close() {
    iscomment = false;
    notifyListeners();
  }

  void open() {
    iscomment = true;
    notifyListeners();
  }
}
