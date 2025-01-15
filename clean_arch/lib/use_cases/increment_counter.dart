import 'package:counter_with_clean_architecture/entities/counter.dart';

/// UseCases Layer
abstract interface class IncrementCounter {
  const IncrementCounter();

  void increment(Counter counter);

  Stream<Counter> get counterStream;
}
