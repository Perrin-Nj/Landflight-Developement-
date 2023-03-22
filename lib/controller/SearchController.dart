import 'package:flutter/material.dart';

class SearchController extends ChangeNotifier {
  bool isSearch = false;
  void close() {
    isSearch = false;
    notifyListeners();
  }

  void open() {
    isSearch = true;
    notifyListeners();
  }
}
