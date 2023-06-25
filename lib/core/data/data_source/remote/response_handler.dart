// ignore: one_member_abstracts
abstract class ResponseHandler<T> {
  /// [T] data response type
  T handleResponse(T response);
}
