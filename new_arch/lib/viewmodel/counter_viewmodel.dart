import 'package:flutter/material.dart';
import 'package:mvp/model/counter_model.dart';
import 'package:mvp/repository/counter_repository.dart';
import 'package:mvp/shared/command.dart';

class CounterViewmodel extends ChangeNotifier {
  CounterModel model = const CounterModel(0);
  var result = '';

  final CounterRepository repository;
  late final Command0<int, String> incrementCounterCommand;

  CounterViewmodel(this.repository) {
    incrementCounterCommand = Command0(() => _incrementCounter());
  }

  _incrementCounter() {
    final value = repository.incrementCounter(model.counter);

    value.fold(
      (result) => model = CounterModel(result),
      (error) => result = error,
    );

    notifyListeners();
  }
}
