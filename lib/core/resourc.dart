abstract class Resource<T> {}

class Success<T> extends Resource<T> {
  final T? date;
  Success({this.date});
}

class Error<T> extends Resource<T> {
  final String? message;
  Error({this.message});
}

class Loading<T> extends Resource<T> {}
