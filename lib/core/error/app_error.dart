// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_error.freezed.dart';

sealed class AppError {
  final String msg;

  AppError({required this.msg});
}

class ServerError extends AppError {
  ServerError({required super.msg});
}

@freezed
abstract class ErrorOr<T> with _$ErrorOr<T> {
  factory ErrorOr.success({required T data}) = SuccessState<T>;
  factory ErrorOr.error({required AppError error}) = ErrorState;
}

extension A<T> on ErrorOr<T> {
  bool get isError => when(success: (success) => false, error: (_) => true);
  bool get isSuccess => when(success: (success) => true, error: (_) => false);

  T? get data => whenOrNull(success: (s) => s);
  AppError? get error => whenOrNull(error: (s) => s);
}
