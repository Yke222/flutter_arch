import 'package:async/async.dart';
import 'package:counter_with_clean_architecture/entities/counter.dart';
import 'package:counter_with_clean_architecture/interface_adapters/counter_presenter.dart';
import 'package:counter_with_clean_architecture/interface_adapters/fake_counter_gateway.dart';
import 'package:counter_with_clean_architecture/use_cases/counter_gateway.dart';
import 'package:counter_with_clean_architecture/use_cases/increment_counter.dart';
import 'package:counter_with_clean_architecture/use_cases/increment_counter_fake_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CounterPresenter should update the counter', () async {
    final CounterGateway dataSource = FakeCounterGateway();
    final IncrementCounter incrementCounter = IncrementCounterFakeImpl(
      dataSource,
    );
    final CounterPresenter presenter = CounterPresenter(incrementCounter);

    final StreamQueue<Counter> queue = StreamQueue<Counter>(
      presenter.counterStream,
    );

    final Counter initialCounter = await queue.next;
    expect(initialCounter.value, 0);

    presenter.increment();
    final Counter newCounter = await queue.next;
    expect(newCounter.value, 1);

    await queue.cancel();
  });
}
