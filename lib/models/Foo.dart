import 'package:flutter/material.dart';

class Foo with ChangeNotifier {
  String value = 'Foo';

  void switchValue() {
    value = value == 'Foo' ? 'Bar' : 'Foo';
    print(value);
    notifyListeners();
  }
}
