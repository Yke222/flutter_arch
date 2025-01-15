abstract class Result<TSuccess, TFailure> {
  TSuccess? getOrNull() {
    if (this is Success) {
      return (this as Success).value;
    }
    return null;
  }

  TFailure? getFailureOrNull() {
    if (this is Failure) {
      return (this as Failure).error;
    }
    return null;
  }

  T fold<T>(T Function(TSuccess value) onSuccess,
      T Function(TFailure error) onFailure) {
    if (this is Success) {
      return onSuccess((this as Success).value);
    } else {
      return onFailure((this as Failure).error);
    }
  }
}

class Success<TSuccess, TFailure> extends Result<TSuccess, TFailure> {
  final TSuccess value;

  Success(this.value);
}

class Failure<TSuccess, TFailure> extends Result<TSuccess, TFailure> {
  final TFailure error;

  Failure(this.error);
}

class ResultExtensions<TSuccess, TFailure> {
  final Result<TSuccess, TFailure> _result;

  ResultExtensions(this._result);

  TSuccess get success => (_result as Success<TSuccess, TFailure>).value;

  TFailure get failure => (_result as Failure<TSuccess, TFailure>).error;

  bool get isSuccess => _result is Success<TSuccess, TFailure>;

  bool get isFailure => _result is Failure<TSuccess, TFailure>;
}
