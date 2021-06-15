import 'package:flutter/material.dart';

class DrawerIndexController extends ChangeNotifier{
  int _index=1;

  int get index => _index;

  set index(int value) {
    _index = value;
    notifyListeners();
  }
}