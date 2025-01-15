import 'package:mvp/model/counter_model.dart';

abstract class CounterView {
  void refresh();
}

class CounterPresenter {
  CounterPresenter(this.view);

  final CounterView view;

  CounterModel model = const CounterModel(0);

  void incrementCounter() {
    model = model.increase();
    view.refresh();
  }
}
