import 'package:flutter/material.dart';
import 'package:mvp/model/counter_model.dart';

class CounterViewmodel extends ChangeNotifier {
  CounterModel model = const CounterModel(0);

  void incrementCounter() {
    model = CounterModel(model.counter + 1);
    notifyListeners();
  }
}
