// part of 'api_data_bloc.dart';

// Package imports:
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// Project imports:
import '../../../../core/error/error.dart';
import '../../../../data/models/api_response_model.dart';
import 'api_data_event.dart';

part 'api_data_state.freezed.dart';

@freezed
class ApiDataState<T> with _$ApiDataState<T> {
  const factory ApiDataState.idle() = ApiDataIdle;

  const factory ApiDataState.loading({
    required ApiDataEvent event,
    int? count,
    int? total,
    @Default(true)
    bool isInit,
  }) = ApiDataLoading;

  const factory ApiDataState.successModel({
    T? data,
    required ApiResponseModel<T?> response,
    required ApiDataEvent event,
  }) = ApiDataSuccessModel<T>;

  const factory ApiDataState.successDeferentApi({
    required T data,
    required ApiDataEvent event,
  }) = ApiSuccessDeferentApiModel<T>;

  const factory ApiDataState.successList({
    List<T>? data,
    required ApiResponseModel<List<T>?> response,
    required ApiDataEvent event,
  }) = ApiDataSuccessList<T>;

  const factory ApiDataState.successPagination({
    List<T>? data,
    required ApiResponseModel<List<T>> response,
    required ApiDataEvent event,
  }) = ApiDataSuccessPagination<T>;

  const factory ApiDataState.error({
    required AppError? error,
    required Response? errorResponse,
    required ApiDataEvent event,
    required bool isUnAuth,
    @Default(false) bool isCancel,
  }) = ApiDataError<T>;
}
