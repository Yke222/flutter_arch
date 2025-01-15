import 'package:counter_with_clean_architecture/interface_adapters/counter_presenter.dart';
import 'package:counter_with_clean_architecture/interface_adapters/fake_counter_gateway.dart';
import 'package:counter_with_clean_architecture/interface_adapters/my_home_page.dart';
import 'package:counter_with_clean_architecture/use_cases/counter_gateway.dart';
import 'package:counter_with_clean_architecture/use_cases/increment_counter.dart';
import 'package:counter_with_clean_architecture/use_cases/increment_counter_fake_impl.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
      title: 'Flutter Demo Clean Arch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', presenter: presenter),
    );
  }
}
