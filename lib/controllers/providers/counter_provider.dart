import 'package:flutter/material.dart';
import 'package:state_management_provider/models/counter_model.dart';

class CounterProvider extends ChangeNotifier {
  Counter c1 = Counter(count: 0);

  void increment() {
    c1.count = c1.count! + 1;
    notifyListeners();
  }
}
