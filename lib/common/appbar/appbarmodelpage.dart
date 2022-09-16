// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';

class AppbarmodalPage extends ChangeNotifier {
  int _counter = 1;
  int get counter => _counter;

  incrementCounter() {
    _counter++;
    notifyListeners();
    print('counter>>>>...  $_counter');
  }

  counterreset() {
    _counter = 0;
    notifyListeners();

    print('counter>>>>  $_counter');
  }
}
