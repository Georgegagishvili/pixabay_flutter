enum ApiStatus { initial, loading, success, error }

class ApiResource<T> {
  final ApiStatus status;
  final T? data;
  final String? message;

  const ApiResource._({required this.status, this.data, this.message});

  factory ApiResource.initial() {
    return const ApiResource._(
      status: ApiStatus.initial,
    );
  }

  factory ApiResource.success(T data) {
    return ApiResource._(
      status: ApiStatus.success,
      data: data,
    );
  }

  factory ApiResource.loading() {
    return const ApiResource._(
      status: ApiStatus.loading,
    );
  }

  factory ApiResource.error(String message) {
    return ApiResource._(
      status: ApiStatus.error,
      message: message,
    );
  }

  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(T data) success,
    required R Function(String message) error,
  }) {
    switch (status) {
      case ApiStatus.loading:
        return loading();
      case ApiStatus.success:
        return success(data as T);
      case ApiStatus.error:
        return error(message!);
      default:
        return initial();
    }
  }

  @override
  String toString() {
    return 'ApiResource(status: $status, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiResource<T> &&
        other.status == status &&
        other.data == data &&
        other.message == message;
  }

  @override
  int get hashCode {
    return status.hashCode ^ data.hashCode ^ message.hashCode;
  }
}
