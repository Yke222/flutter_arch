[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://stand-with-ukraine.pp.ua)
[![style: flutter lints](https://img.shields.io/badge/style-flutter__lints-blue)](https://pub.dev/packages/flutter_lints)
[![Code Quality](https://github.com/Turskyi/flutter_clean_architecture_counter/actions/workflows/code-quality-tests.yml/badge.svg?branch=master&event=push)](https://github.com/flutter/flutter/blob/master/docs/contributing/Style-guide-for-Flutter-repo.md)
[![codecov](https://codecov.io/gh/Turskyi/flutter_clean_architecture_counter/graph/badge.svg?token=R2N9ND3EQD)](https://codecov.io/gh/Turskyi/flutter_clean_architecture_counter)
<img alt="GitHub commit activity" src="https://img.shields.io/github/commit-activity/m/Turskyi/flutter_clean_architecture_counter">

# Flutter Clean Architecture Counter With Stream

This project is a refactored version of the
[default Flutter counter app](https://dartpad.dev/?sample=counter),
demonstrating how it could be implemented in a production environment using
Clean Architecture, originally introduced by
[Robert Cecil Martin](https://en.wikipedia.org/wiki/Robert_C._Martin) in his 
articles 
[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2011/11/22/Clean-Architecture.html) 
and
[The Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).

The default counter app is often criticized for its simplicity and lack of
real-world applicability. This example showcases a more maintainable and
scalable approach, incorporating immutability, dependency injection, and
reactive state management using 
[streams](https://dart.dev/libraries/async/using-streams).

<!--suppress CheckImageSize -->
<a href="https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html">
<!--suppress CheckImageSize -->
<img src="documentation/CleanArchitecture.jpg" width="800" title="Onion Architecture" alt="Image of the Clean Architecture Pattern">
</a>

## Architecture Overview

The project follows the four main layers of Clean Architecture:

1. **Enterprise Business Rules**: Core business logic and entities.
2. **Application Business Rules**: Business rules and operations.
3. **Interface Adapters**: Application-specific logic and orchestration, 
including the User Interface.
4. **Frameworks & Drivers**: Technical details like the database and web 
frameworks, and the main entry point of the application.

### Enterprise Business Rules (Entities) Layer

Contains the `Counter` entity. This layer does not depend on anything else, 
which is evident from the imports in the class.

### Application Business Rules (Use Cases) Layer

Contains the `IncrementCounter` interface and its implementation 
`IncrementCounterFakeImpl`. This layer depends only on the Entities layer. 
It also includes the `CounterGateway` interface to allow use cases to 
communicate with the outer layers.

### Interface Adapters Layer

Contains the `CounterPresenter` which manages the state and business logic. 
This layer depends on both Use Cases and Entities layers. 
It also includes the User Interface components like the `MyHomePage` widget 
and the implementation of the Gateway (`FakeCounterGateway`).

### Frameworks & Drivers Layer

Contains technical details like the database and web frameworks. This layer 
also includes the main entry point of the application, where dependencies are 
injected and the application is initialized.

The Frameworks & Drivers components have access to all inner layers.

### Note on Layer Separation

For the sake of simplicity, the inner layers are not decoupled into separate 
packages in this example. 
In a production environment, it is essential to enforce the dependency flow by 
separating these layers into different packages. 
This ensures that, for example, the Entities layer cannot access the 
Frameworks & Drivers Layer.

### Project Structure

The simplified structure of the project is as follows:

```
lib/
├── main.dart
├── interface_adapters/
├── use_cases/
└── entities/
```

## Getting Started

To get started with this project, clone the repository and run the following
commands:

```bash
flutter pub get
flutter run
```

You can also test the implementation directly on DartPad:
https://dartpad.dev/?id=e4faa4d8c6fd26106d566af076795917

## Running Tests

To run the tests, use the following command:

```bash
flutter test
```

The tests are adjusted for Clean Architecture, demonstrating how to test each
layer independently and ensuring the overall integrity of the application.

## Full Implementation

This implementation is so simple that it can even fit in the README:

```dart
import 'dart:async';

import 'package:flutter/material.dart';

// Frameworks & Drivers Layer
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', presenter: presenter),
    );
  }
}

// Interface Adapters Layer (Presenter)
class CounterPresenter {
  CounterPresenter(this.incrementCounter) {
    incrementCounter.counterStream.listen(_updateCounter);
  }

  final IncrementCounter incrementCounter;
  Counter? _counter;
  final StreamController<Counter> _controller = StreamController<Counter>();

  Stream<Counter> get counterStream => _controller.stream;

  void increment() {
    if (_counter != null) {
      incrementCounter.increment(_counter!);
    }
  }

  void _updateCounter(Counter counter) {
    _counter = counter;
    _controller.add(_counter!);
  }

  void dispose() => _controller.close();
}

// Interface Adapters Layer (UI)
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    required this.presenter,
    super.key,
  });

  final String title;
  final CounterPresenter presenter;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<Counter>(
              stream: widget.presenter.counterStream,
              initialData: const Counter(0),
              builder: (BuildContext context, AsyncSnapshot<Counter> snapshot) {
                return Text(
                  '${snapshot.data?.value ?? 0}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.presenter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }
}

// Interface Adapters Layer (Fake Gateway Implementation)
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

// UseCases Layer
abstract interface class IncrementCounter {
  const IncrementCounter();

  void increment(Counter counter);

  Stream<Counter> get counterStream;
}

abstract interface class CounterGateway {
  const CounterGateway();

  Stream<Counter> watch();

  Future<void> saveCounter(Counter counter);
}

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

// Entities Layer
class Counter {
  const Counter(this.value);

  final int value;

  Counter copyWith({int? value}) {
    return Counter(value ?? this.value);
  }
}
```

### Screenshot:

<!--suppress CheckImageSize -->
<img src="screenshots/Android_Screenshot_20240805.png" width="200"  alt="screenshot">