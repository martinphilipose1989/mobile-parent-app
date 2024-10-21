class BaseInfo<T> {
  int? status;
  T? data;
  String? message;

  BaseInfo({
    this.status,
    this.data,
    this.message,
  });
}

class BaseDetails{}