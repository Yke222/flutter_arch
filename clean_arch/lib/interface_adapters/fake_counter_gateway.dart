import 'dart:async';

import 'package:counter_with_clean_architecture/entities/counter.dart';
import 'package:counter_with_clean_architecture/use_cases/counter_gateway.dart';

class FakeCounterGateway implements CounterGateway {
  FakeCounterGateway() {
    _controller.add(_counter);
  }

  Counter _counter = const Counter(0);
  final StreamController<Counter> _controller = StreamController<Counter>();

  @override
  Stream<Counter> watch() => _controller.stream;

  @override
  Future<void> saveCounter(Counter counter) async {
    await Future<void>.delayed(Duration.zero);
    _counter = counter;
    _controller.add(_counter);
  }
}
