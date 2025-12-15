import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int getCount() => _count;

  void incrementCount(int value) {
    _count += value;
    notifyListeners();
  }

  void dicrementCount() {
    if (_count > 0) {
      _count--;
    }
    notifyListeners();
  }
}