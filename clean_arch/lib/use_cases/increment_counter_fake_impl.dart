import 'dart:async';

import 'package:counter_with_clean_architecture/entities/counter.dart';
import 'package:counter_with_clean_architecture/use_cases/counter_gateway.dart';
import 'package:counter_with_clean_architecture/use_cases/increment_counter.dart';

/// UseCases Layer
class IncrementCounterFakeImpl implements IncrementCounter {
  IncrementCounterFakeImpl(this.gateway) {
    _init();
  }

  final CounterGateway gateway;

  final StreamController<Counter> _controller = StreamController<Counter>();

  Future<void> _init() async {
    gateway.watch().listen((Counter counter) {
      _controller.add(counter);
    });
  }

  @override
  void increment(Counter counter) async {
    final Counter newCounter = counter.copyWith(value: counter.value + 1);
    await gateway.saveCounter(newCounter);
  }

  @override
  Stream<Counter> get counterStream => _controller.stream;
}
