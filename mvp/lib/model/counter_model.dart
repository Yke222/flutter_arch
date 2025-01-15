class CounterModel {
  const CounterModel(this.counter);

  final int counter;

  CounterModel increase() => CounterModel(counter + 1);
}
