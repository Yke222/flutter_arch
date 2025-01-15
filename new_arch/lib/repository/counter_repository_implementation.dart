import 'package:mvp/repository/counter_repository.dart';
import 'package:mvp/shared/result.dart';

class CounterRepositoryImplementation implements CounterRepository {
  @override
  Result<int, String> incrementCounter(int counter) {
    return Success(counter + 1);
  }
}
