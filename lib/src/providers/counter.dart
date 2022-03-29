import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _value = 0;

  get counter => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}
