// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_error.freezed.dart';

sealed class AppError{
  final String msg;
  // final String msg;

  AppError({required this.msg});

}





@freezed
abstract class ErrorOr<T> with _$ErrorOr<T> {

  factory ErrorOr.succes({required T data} ) = SuccessState<T>;
  factory ErrorOr.error({required AppError error}) = ErrorState;
}