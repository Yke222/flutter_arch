import 'package:flutter/material.dart';
import 'package:mvp/shared/result.dart';

abstract class Command<TSuccess, TFailure> extends ChangeNotifier {
  bool _isExecuting = false;

  bool get isExecuting => _isExecuting;

  Result<TSuccess, TFailure>? _result;

  bool get isSuccess => _result is Success;

  bool get isFailure => _result is Failure;

  Future<void> _execute(
    Future<Result<TSuccess, TFailure>> Function() action,
  ) async {
    if (!_isExecuting) {
      _isExecuting = true;
      notifyListeners();

      _result = await action();

      _isExecuting = false;
      notifyListeners();
    }
  }
}

class Command0<TSuccess, TFailure> extends Command<TSuccess, TFailure> {
  final Future<Result<TSuccess, TFailure>> Function() action;

  Command0(this.action);

  Future<void> execute() async {
    await _execute(action);
  }
}

class Command1<TSuccess, TFailure, TParam1>
    extends Command<TSuccess, TFailure> {
  final Future<Result<TSuccess, TFailure>> Function(TParam1) action;

  Command1(this.action);

  Future<void> execute(TParam1 param1) async {
    await _execute(() => action(param1));
  }
}

class Command2<TSuccess, TFailure, TParam1, TParam2>
    extends Command<TSuccess, TFailure> {
  final Future<Result<TSuccess, TFailure>> Function(TParam1, TParam2) action;

  Command2(this.action);

  Future<void> execute(TParam1 param1, TParam2 param2) async {
    await _execute(() => action(param1, param2));
  }
}
