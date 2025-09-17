// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_data_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ApiDataState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      ApiDataEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )
    successModel,
    required TResult Function(T data, ApiDataEvent event) successDeferentApi,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )
    successList,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )
    successPagination,
    required TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult? Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult? Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) successModel,
    required TResult Function(ApiSuccessDeferentApiModel<T> value)
    successDeferentApi,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataSuccessPagination<T> value)
    successPagination,
    required TResult Function(ApiDataError<T> value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? successModel,
    TResult? Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult? Function(ApiDataError<T> value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? successModel,
    TResult Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiDataStateCopyWith<T, $Res> {
  factory $ApiDataStateCopyWith(
    ApiDataState<T> value,
    $Res Function(ApiDataState<T>) then,
  ) = _$ApiDataStateCopyWithImpl<T, $Res, ApiDataState<T>>;
}

/// @nodoc
class _$ApiDataStateCopyWithImpl<T, $Res, $Val extends ApiDataState<T>>
    implements $ApiDataStateCopyWith<T, $Res> {
  _$ApiDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ApiDataIdleImplCopyWith<T, $Res> {
  factory _$$ApiDataIdleImplCopyWith(
    _$ApiDataIdleImpl<T> value,
    $Res Function(_$ApiDataIdleImpl<T>) then,
  ) = __$$ApiDataIdleImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ApiDataIdleImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataIdleImpl<T>>
    implements _$$ApiDataIdleImplCopyWith<T, $Res> {
  __$$ApiDataIdleImplCopyWithImpl(
    _$ApiDataIdleImpl<T> _value,
    $Res Function(_$ApiDataIdleImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ApiDataIdleImpl<T> implements ApiDataIdle<T> {
  const _$ApiDataIdleImpl();

  @override
  String toString() {
    return 'ApiDataState<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ApiDataIdleImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      ApiDataEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )
    successModel,
    required TResult Function(T data, ApiDataEvent event) successDeferentApi,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )
    successList,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )
    successPagination,
    required TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult? Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult? Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) successModel,
    required TResult Function(ApiSuccessDeferentApiModel<T> value)
    successDeferentApi,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataSuccessPagination<T> value)
    successPagination,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? successModel,
    TResult? Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? successModel,
    TResult Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class ApiDataIdle<T> implements ApiDataState<T> {
  const factory ApiDataIdle() = _$ApiDataIdleImpl<T>;
}

/// @nodoc
abstract class _$$ApiDataLoadingImplCopyWith<T, $Res> {
  factory _$$ApiDataLoadingImplCopyWith(
    _$ApiDataLoadingImpl<T> value,
    $Res Function(_$ApiDataLoadingImpl<T>) then,
  ) = __$$ApiDataLoadingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ApiDataEvent event, int? count, int? total, bool isInit});

  $ApiDataEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$ApiDataLoadingImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataLoadingImpl<T>>
    implements _$$ApiDataLoadingImplCopyWith<T, $Res> {
  __$$ApiDataLoadingImplCopyWithImpl(
    _$ApiDataLoadingImpl<T> _value,
    $Res Function(_$ApiDataLoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
    Object? count = freezed,
    Object? total = freezed,
    Object? isInit = null,
  }) {
    return _then(
      _$ApiDataLoadingImpl<T>(
        event:
            null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                    as ApiDataEvent,
        count:
            freezed == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                    as int?,
        total:
            freezed == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                    as int?,
        isInit:
            null == isInit
                ? _value.isInit
                : isInit // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiDataEventCopyWith<$Res> get event {
    return $ApiDataEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$ApiDataLoadingImpl<T> implements ApiDataLoading<T> {
  const _$ApiDataLoadingImpl({
    required this.event,
    this.count,
    this.total,
    this.isInit = true,
  });

  @override
  final ApiDataEvent event;
  @override
  final int? count;
  @override
  final int? total;
  @override
  @JsonKey()
  final bool isInit;

  @override
  String toString() {
    return 'ApiDataState<$T>.loading(event: $event, count: $count, total: $total, isInit: $isInit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataLoadingImpl<T> &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isInit, isInit) || other.isInit == isInit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event, count, total, isInit);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataLoadingImplCopyWith<T, _$ApiDataLoadingImpl<T>> get copyWith =>
      __$$ApiDataLoadingImplCopyWithImpl<T, _$ApiDataLoadingImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      ApiDataEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )
    successModel,
    required TResult Function(T data, ApiDataEvent event) successDeferentApi,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )
    successList,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )
    successPagination,
    required TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) {
    return loading(event, count, total, isInit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult? Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult? Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) {
    return loading?.call(event, count, total, isInit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(event, count, total, isInit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) successModel,
    required TResult Function(ApiSuccessDeferentApiModel<T> value)
    successDeferentApi,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataSuccessPagination<T> value)
    successPagination,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? successModel,
    TResult? Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? successModel,
    TResult Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ApiDataLoading<T> implements ApiDataState<T> {
  const factory ApiDataLoading({
    required final ApiDataEvent event,
    final int? count,
    final int? total,
    final bool isInit,
  }) = _$ApiDataLoadingImpl<T>;

  ApiDataEvent get event;
  int? get count;
  int? get total;
  bool get isInit;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataLoadingImplCopyWith<T, _$ApiDataLoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiDataSuccessModelImplCopyWith<T, $Res> {
  factory _$$ApiDataSuccessModelImplCopyWith(
    _$ApiDataSuccessModelImpl<T> value,
    $Res Function(_$ApiDataSuccessModelImpl<T>) then,
  ) = __$$ApiDataSuccessModelImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data, ApiResponseModel<T?> response, ApiDataEvent event});

  $ApiDataEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$ApiDataSuccessModelImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataSuccessModelImpl<T>>
    implements _$$ApiDataSuccessModelImplCopyWith<T, $Res> {
  __$$ApiDataSuccessModelImplCopyWithImpl(
    _$ApiDataSuccessModelImpl<T> _value,
    $Res Function(_$ApiDataSuccessModelImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? response = null,
    Object? event = null,
  }) {
    return _then(
      _$ApiDataSuccessModelImpl<T>(
        data:
            freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as T?,
        response:
            null == response
                ? _value.response
                : response // ignore: cast_nullable_to_non_nullable
                    as ApiResponseModel<T?>,
        event:
            null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                    as ApiDataEvent,
      ),
    );
  }

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiDataEventCopyWith<$Res> get event {
    return $ApiDataEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$ApiDataSuccessModelImpl<T> implements ApiDataSuccessModel<T> {
  const _$ApiDataSuccessModelImpl({
    this.data,
    required this.response,
    required this.event,
  });

  @override
  final T? data;
  @override
  final ApiResponseModel<T?> response;
  @override
  final ApiDataEvent event;

  @override
  String toString() {
    return 'ApiDataState<$T>.successModel(data: $data, response: $response, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataSuccessModelImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    response,
    event,
  );

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataSuccessModelImplCopyWith<T, _$ApiDataSuccessModelImpl<T>>
  get copyWith =>
      __$$ApiDataSuccessModelImplCopyWithImpl<T, _$ApiDataSuccessModelImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      ApiDataEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )
    successModel,
    required TResult Function(T data, ApiDataEvent event) successDeferentApi,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )
    successList,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )
    successPagination,
    required TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) {
    return successModel(data, response, event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult? Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult? Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) {
    return successModel?.call(data, response, event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) {
    if (successModel != null) {
      return successModel(data, response, event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) successModel,
    required TResult Function(ApiSuccessDeferentApiModel<T> value)
    successDeferentApi,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataSuccessPagination<T> value)
    successPagination,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return successModel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? successModel,
    TResult? Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return successModel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? successModel,
    TResult Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (successModel != null) {
      return successModel(this);
    }
    return orElse();
  }
}

abstract class ApiDataSuccessModel<T> implements ApiDataState<T> {
  const factory ApiDataSuccessModel({
    final T? data,
    required final ApiResponseModel<T?> response,
    required final ApiDataEvent event,
  }) = _$ApiDataSuccessModelImpl<T>;

  T? get data;
  ApiResponseModel<T?> get response;
  ApiDataEvent get event;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataSuccessModelImplCopyWith<T, _$ApiDataSuccessModelImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiSuccessDeferentApiModelImplCopyWith<T, $Res> {
  factory _$$ApiSuccessDeferentApiModelImplCopyWith(
    _$ApiSuccessDeferentApiModelImpl<T> value,
    $Res Function(_$ApiSuccessDeferentApiModelImpl<T>) then,
  ) = __$$ApiSuccessDeferentApiModelImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data, ApiDataEvent event});

  $ApiDataEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$ApiSuccessDeferentApiModelImplCopyWithImpl<T, $Res>
    extends
        _$ApiDataStateCopyWithImpl<T, $Res, _$ApiSuccessDeferentApiModelImpl<T>>
    implements _$$ApiSuccessDeferentApiModelImplCopyWith<T, $Res> {
  __$$ApiSuccessDeferentApiModelImplCopyWithImpl(
    _$ApiSuccessDeferentApiModelImpl<T> _value,
    $Res Function(_$ApiSuccessDeferentApiModelImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed, Object? event = null}) {
    return _then(
      _$ApiSuccessDeferentApiModelImpl<T>(
        data:
            freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                    as T,
        event:
            null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                    as ApiDataEvent,
      ),
    );
  }

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiDataEventCopyWith<$Res> get event {
    return $ApiDataEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$ApiSuccessDeferentApiModelImpl<T>
    implements ApiSuccessDeferentApiModel<T> {
  const _$ApiSuccessDeferentApiModelImpl({
    required this.data,
    required this.event,
  });

  @override
  final T data;
  @override
  final ApiDataEvent event;

  @override
  String toString() {
    return 'ApiDataState<$T>.successDeferentApi(data: $data, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiSuccessDeferentApiModelImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(data),
    event,
  );

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiSuccessDeferentApiModelImplCopyWith<
    T,
    _$ApiSuccessDeferentApiModelImpl<T>
  >
  get copyWith => __$$ApiSuccessDeferentApiModelImplCopyWithImpl<
    T,
    _$ApiSuccessDeferentApiModelImpl<T>
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      ApiDataEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )
    successModel,
    required TResult Function(T data, ApiDataEvent event) successDeferentApi,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )
    successList,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )
    successPagination,
    required TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) {
    return successDeferentApi(data, event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult? Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult? Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) {
    return successDeferentApi?.call(data, event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) {
    if (successDeferentApi != null) {
      return successDeferentApi(data, event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) successModel,
    required TResult Function(ApiSuccessDeferentApiModel<T> value)
    successDeferentApi,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataSuccessPagination<T> value)
    successPagination,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return successDeferentApi(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? successModel,
    TResult? Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return successDeferentApi?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? successModel,
    TResult Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (successDeferentApi != null) {
      return successDeferentApi(this);
    }
    return orElse();
  }
}

abstract class ApiSuccessDeferentApiModel<T> implements ApiDataState<T> {
  const factory ApiSuccessDeferentApiModel({
    required final T data,
    required final ApiDataEvent event,
  }) = _$ApiSuccessDeferentApiModelImpl<T>;

  T get data;
  ApiDataEvent get event;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiSuccessDeferentApiModelImplCopyWith<
    T,
    _$ApiSuccessDeferentApiModelImpl<T>
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiDataSuccessListImplCopyWith<T, $Res> {
  factory _$$ApiDataSuccessListImplCopyWith(
    _$ApiDataSuccessListImpl<T> value,
    $Res Function(_$ApiDataSuccessListImpl<T>) then,
  ) = __$$ApiDataSuccessListImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({
    List<T>? data,
    ApiResponseModel<List<T>?> response,
    ApiDataEvent event,
  });

  $ApiDataEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$ApiDataSuccessListImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataSuccessListImpl<T>>
    implements _$$ApiDataSuccessListImplCopyWith<T, $Res> {
  __$$ApiDataSuccessListImplCopyWithImpl(
    _$ApiDataSuccessListImpl<T> _value,
    $Res Function(_$ApiDataSuccessListImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? response = null,
    Object? event = null,
  }) {
    return _then(
      _$ApiDataSuccessListImpl<T>(
        data:
            freezed == data
                ? _value._data
                : data // ignore: cast_nullable_to_non_nullable
                    as List<T>?,
        response:
            null == response
                ? _value.response
                : response // ignore: cast_nullable_to_non_nullable
                    as ApiResponseModel<List<T>?>,
        event:
            null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                    as ApiDataEvent,
      ),
    );
  }

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiDataEventCopyWith<$Res> get event {
    return $ApiDataEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$ApiDataSuccessListImpl<T> implements ApiDataSuccessList<T> {
  const _$ApiDataSuccessListImpl({
    final List<T>? data,
    required this.response,
    required this.event,
  }) : _data = data;

  final List<T>? _data;
  @override
  List<T>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ApiResponseModel<List<T>?> response;
  @override
  final ApiDataEvent event;

  @override
  String toString() {
    return 'ApiDataState<$T>.successList(data: $data, response: $response, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataSuccessListImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    response,
    event,
  );

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataSuccessListImplCopyWith<T, _$ApiDataSuccessListImpl<T>>
  get copyWith =>
      __$$ApiDataSuccessListImplCopyWithImpl<T, _$ApiDataSuccessListImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      ApiDataEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )
    successModel,
    required TResult Function(T data, ApiDataEvent event) successDeferentApi,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )
    successList,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )
    successPagination,
    required TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) {
    return successList(data, response, event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult? Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult? Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) {
    return successList?.call(data, response, event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) {
    if (successList != null) {
      return successList(data, response, event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) successModel,
    required TResult Function(ApiSuccessDeferentApiModel<T> value)
    successDeferentApi,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataSuccessPagination<T> value)
    successPagination,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return successList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? successModel,
    TResult? Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return successList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? successModel,
    TResult Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (successList != null) {
      return successList(this);
    }
    return orElse();
  }
}

abstract class ApiDataSuccessList<T> implements ApiDataState<T> {
  const factory ApiDataSuccessList({
    final List<T>? data,
    required final ApiResponseModel<List<T>?> response,
    required final ApiDataEvent event,
  }) = _$ApiDataSuccessListImpl<T>;

  List<T>? get data;
  ApiResponseModel<List<T>?> get response;
  ApiDataEvent get event;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataSuccessListImplCopyWith<T, _$ApiDataSuccessListImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiDataSuccessPaginationImplCopyWith<T, $Res> {
  factory _$$ApiDataSuccessPaginationImplCopyWith(
    _$ApiDataSuccessPaginationImpl<T> value,
    $Res Function(_$ApiDataSuccessPaginationImpl<T>) then,
  ) = __$$ApiDataSuccessPaginationImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({
    List<T>? data,
    ApiResponseModel<List<T>> response,
    ApiDataEvent event,
  });

  $ApiDataEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$ApiDataSuccessPaginationImplCopyWithImpl<T, $Res>
    extends
        _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataSuccessPaginationImpl<T>>
    implements _$$ApiDataSuccessPaginationImplCopyWith<T, $Res> {
  __$$ApiDataSuccessPaginationImplCopyWithImpl(
    _$ApiDataSuccessPaginationImpl<T> _value,
    $Res Function(_$ApiDataSuccessPaginationImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? response = null,
    Object? event = null,
  }) {
    return _then(
      _$ApiDataSuccessPaginationImpl<T>(
        data:
            freezed == data
                ? _value._data
                : data // ignore: cast_nullable_to_non_nullable
                    as List<T>?,
        response:
            null == response
                ? _value.response
                : response // ignore: cast_nullable_to_non_nullable
                    as ApiResponseModel<List<T>>,
        event:
            null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                    as ApiDataEvent,
      ),
    );
  }

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiDataEventCopyWith<$Res> get event {
    return $ApiDataEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$ApiDataSuccessPaginationImpl<T> implements ApiDataSuccessPagination<T> {
  const _$ApiDataSuccessPaginationImpl({
    final List<T>? data,
    required this.response,
    required this.event,
  }) : _data = data;

  final List<T>? _data;
  @override
  List<T>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ApiResponseModel<List<T>> response;
  @override
  final ApiDataEvent event;

  @override
  String toString() {
    return 'ApiDataState<$T>.successPagination(data: $data, response: $response, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataSuccessPaginationImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    response,
    event,
  );

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataSuccessPaginationImplCopyWith<T, _$ApiDataSuccessPaginationImpl<T>>
  get copyWith => __$$ApiDataSuccessPaginationImplCopyWithImpl<
    T,
    _$ApiDataSuccessPaginationImpl<T>
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      ApiDataEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )
    successModel,
    required TResult Function(T data, ApiDataEvent event) successDeferentApi,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )
    successList,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )
    successPagination,
    required TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) {
    return successPagination(data, response, event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult? Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult? Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) {
    return successPagination?.call(data, response, event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) {
    if (successPagination != null) {
      return successPagination(data, response, event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) successModel,
    required TResult Function(ApiSuccessDeferentApiModel<T> value)
    successDeferentApi,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataSuccessPagination<T> value)
    successPagination,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return successPagination(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? successModel,
    TResult? Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return successPagination?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? successModel,
    TResult Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (successPagination != null) {
      return successPagination(this);
    }
    return orElse();
  }
}

abstract class ApiDataSuccessPagination<T> implements ApiDataState<T> {
  const factory ApiDataSuccessPagination({
    final List<T>? data,
    required final ApiResponseModel<List<T>> response,
    required final ApiDataEvent event,
  }) = _$ApiDataSuccessPaginationImpl<T>;

  List<T>? get data;
  ApiResponseModel<List<T>> get response;
  ApiDataEvent get event;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataSuccessPaginationImplCopyWith<T, _$ApiDataSuccessPaginationImpl<T>>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiDataErrorImplCopyWith<T, $Res> {
  factory _$$ApiDataErrorImplCopyWith(
    _$ApiDataErrorImpl<T> value,
    $Res Function(_$ApiDataErrorImpl<T>) then,
  ) = __$$ApiDataErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({
    AppError? error,
    Response<dynamic>? errorResponse,
    ApiDataEvent event,
    bool isUnAuth,
    bool isCancel,
  });

  $AppErrorCopyWith<$Res>? get error;
  $ApiDataEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$ApiDataErrorImplCopyWithImpl<T, $Res>
    extends _$ApiDataStateCopyWithImpl<T, $Res, _$ApiDataErrorImpl<T>>
    implements _$$ApiDataErrorImplCopyWith<T, $Res> {
  __$$ApiDataErrorImplCopyWithImpl(
    _$ApiDataErrorImpl<T> _value,
    $Res Function(_$ApiDataErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? errorResponse = freezed,
    Object? event = null,
    Object? isUnAuth = null,
    Object? isCancel = null,
  }) {
    return _then(
      _$ApiDataErrorImpl<T>(
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppError?,
        errorResponse:
            freezed == errorResponse
                ? _value.errorResponse
                : errorResponse // ignore: cast_nullable_to_non_nullable
                    as Response<dynamic>?,
        event:
            null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                    as ApiDataEvent,
        isUnAuth:
            null == isUnAuth
                ? _value.isUnAuth
                : isUnAuth // ignore: cast_nullable_to_non_nullable
                    as bool,
        isCancel:
            null == isCancel
                ? _value.isCancel
                : isCancel // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $AppErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value));
    });
  }

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiDataEventCopyWith<$Res> get event {
    return $ApiDataEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$ApiDataErrorImpl<T> implements ApiDataError<T> {
  const _$ApiDataErrorImpl({
    required this.error,
    required this.errorResponse,
    required this.event,
    required this.isUnAuth,
    this.isCancel = false,
  });

  @override
  final AppError? error;
  @override
  final Response<dynamic>? errorResponse;
  @override
  final ApiDataEvent event;
  @override
  final bool isUnAuth;
  @override
  @JsonKey()
  final bool isCancel;

  @override
  String toString() {
    return 'ApiDataState<$T>.error(error: $error, errorResponse: $errorResponse, event: $event, isUnAuth: $isUnAuth, isCancel: $isCancel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiDataErrorImpl<T> &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorResponse, errorResponse) ||
                other.errorResponse == errorResponse) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.isUnAuth, isUnAuth) ||
                other.isUnAuth == isUnAuth) &&
            (identical(other.isCancel, isCancel) ||
                other.isCancel == isCancel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, error, errorResponse, event, isUnAuth, isCancel);

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiDataErrorImplCopyWith<T, _$ApiDataErrorImpl<T>> get copyWith =>
      __$$ApiDataErrorImplCopyWithImpl<T, _$ApiDataErrorImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      ApiDataEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )
    successModel,
    required TResult Function(T data, ApiDataEvent event) successDeferentApi,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )
    successList,
    required TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )
    successPagination,
    required TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) {
    return error(this.error, errorResponse, event, isUnAuth, isCancel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult? Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult? Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult? Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) {
    return error?.call(this.error, errorResponse, event, isUnAuth, isCancel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(ApiDataEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      ApiDataEvent event,
    )?
    successModel,
    TResult Function(T data, ApiDataEvent event)? successDeferentApi,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>?> response,
      ApiDataEvent event,
    )?
    successList,
    TResult Function(
      List<T>? data,
      ApiResponseModel<List<T>> response,
      ApiDataEvent event,
    )?
    successPagination,
    TResult Function(
      AppError? error,
      Response<dynamic>? errorResponse,
      ApiDataEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, errorResponse, event, isUnAuth, isCancel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApiDataIdle<T> value) idle,
    required TResult Function(ApiDataLoading<T> value) loading,
    required TResult Function(ApiDataSuccessModel<T> value) successModel,
    required TResult Function(ApiSuccessDeferentApiModel<T> value)
    successDeferentApi,
    required TResult Function(ApiDataSuccessList<T> value) successList,
    required TResult Function(ApiDataSuccessPagination<T> value)
    successPagination,
    required TResult Function(ApiDataError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApiDataIdle<T> value)? idle,
    TResult? Function(ApiDataLoading<T> value)? loading,
    TResult? Function(ApiDataSuccessModel<T> value)? successModel,
    TResult? Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult? Function(ApiDataSuccessList<T> value)? successList,
    TResult? Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult? Function(ApiDataError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApiDataIdle<T> value)? idle,
    TResult Function(ApiDataLoading<T> value)? loading,
    TResult Function(ApiDataSuccessModel<T> value)? successModel,
    TResult Function(ApiSuccessDeferentApiModel<T> value)? successDeferentApi,
    TResult Function(ApiDataSuccessList<T> value)? successList,
    TResult Function(ApiDataSuccessPagination<T> value)? successPagination,
    TResult Function(ApiDataError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ApiDataError<T> implements ApiDataState<T> {
  const factory ApiDataError({
    required final AppError? error,
    required final Response<dynamic>? errorResponse,
    required final ApiDataEvent event,
    required final bool isUnAuth,
    final bool isCancel,
  }) = _$ApiDataErrorImpl<T>;

  AppError? get error;
  Response<dynamic>? get errorResponse;
  ApiDataEvent get event;
  bool get isUnAuth;
  bool get isCancel;

  /// Create a copy of ApiDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiDataErrorImplCopyWith<T, _$ApiDataErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
