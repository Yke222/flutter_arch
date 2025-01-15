import 'package:counter_with_clean_architecture/interface_adapters/counter_presenter.dart';
import 'package:counter_with_clean_architecture/interface_adapters/fake_counter_gateway.dart';
import 'package:counter_with_clean_architecture/interface_adapters/my_home_page.dart';
import 'package:counter_with_clean_architecture/use_cases/counter_gateway.dart';
import 'package:counter_with_clean_architecture/use_cases/increment_counter.dart';
import 'package:counter_with_clean_architecture/use_cases/increment_counter_fake_impl.dart';
import 'package:flutter/material.dart';

/// The [main] is the ultimate detail — the lowest-level policy.
/// It is the initial entry point of the system.
/// Nothing, other than the operating system, depends on it.
/// It is in this [main] component that dependencies should be injected.
/// The [main] is a dirty low-level module in the outermost circle of the clean
/// architecture.
/// Think of [main] as a plugin to the [MyApp] — a plugin that sets up the
/// initial conditions and configurations, gathers all the outside resources,
/// and then hands control over to the high-level policy of the [MyApp].
/// When [main] is released, it has utterly no effect on any of the other
/// components in the system. They don’t know about [main], and they don’t care
/// when it changes.
void main() => runApp(const MyApp());

/// Frameworks & Drivers Layer.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterGateway gateway = FakeCounterGateway();
    final IncrementCounter incrementCounter = IncrementCounterFakeImpl(
      gateway,
    );
    final CounterPresenter presenter = CounterPresenter(incrementCounter);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', presenter: presenter),
    );
  }
}
