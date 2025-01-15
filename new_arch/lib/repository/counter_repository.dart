import 'package:mvp/shared/result.dart';

abstract class CounterRepository {
  Result<int, String> incrementCounter(int counter);
}
