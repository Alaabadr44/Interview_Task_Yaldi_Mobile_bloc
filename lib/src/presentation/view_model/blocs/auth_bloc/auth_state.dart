// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../../../core/error/error.dart';
import '../../../../data/models/api_response_model.dart';
import 'auth_event.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState<T> with _$AuthState<T> {
  const factory AuthState.idle() = AuthIdle;
  const factory AuthState.loading({
    required AuthEvent event,
    int? count,
    int? total,
    @Default(true) bool isInit,
  }) = AuthLoading;

  const factory AuthState.success({
    required T? data,
    required ApiResponseModel<T?> response,
    required AuthEvent event,
  }) = AuthSuccess<T>;

  const factory AuthState.error({
    required AppError? error,
    required AuthEvent event,
    required bool isUnAuth,
    @Default(false) bool isCancel,
  }) = AuthError<T>;
}
