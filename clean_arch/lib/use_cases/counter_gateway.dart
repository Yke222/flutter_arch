import 'package:counter_with_clean_architecture/entities/counter.dart';

/// UseCases Layer (Gateway Interface)
abstract interface class CounterGateway {
  const CounterGateway();

  Stream<Counter> watch();

  Future<void> saveCounter(Counter counter);
}
