// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      AuthEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      AuthEvent event,
    )
    success,
    required TResult Function(
      AppError? error,
      AuthEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult? Function(
      AppError? error,
      AuthEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult Function(
      AppError? error,
      AuthEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthIdle<T> value) idle,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthError<T> value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle<T> value)? idle,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthError<T> value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle<T> value)? idle,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthError<T> value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<T, $Res> {
  factory $AuthStateCopyWith(
    AuthState<T> value,
    $Res Function(AuthState<T>) then,
  ) = _$AuthStateCopyWithImpl<T, $Res, AuthState<T>>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<T, $Res, $Val extends AuthState<T>>
    implements $AuthStateCopyWith<T, $Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthIdleImplCopyWith<T, $Res> {
  factory _$$AuthIdleImplCopyWith(
    _$AuthIdleImpl<T> value,
    $Res Function(_$AuthIdleImpl<T>) then,
  ) = __$$AuthIdleImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$AuthIdleImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthIdleImpl<T>>
    implements _$$AuthIdleImplCopyWith<T, $Res> {
  __$$AuthIdleImplCopyWithImpl(
    _$AuthIdleImpl<T> _value,
    $Res Function(_$AuthIdleImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthIdleImpl<T> implements AuthIdle<T> {
  const _$AuthIdleImpl();

  @override
  String toString() {
    return 'AuthState<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthIdleImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      AuthEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      AuthEvent event,
    )
    success,
    required TResult Function(
      AppError? error,
      AuthEvent event,
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
    TResult? Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult? Function(
      AppError? error,
      AuthEvent event,
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
    TResult Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult Function(
      AppError? error,
      AuthEvent event,
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
    required TResult Function(AuthIdle<T> value) idle,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthError<T> value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle<T> value)? idle,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthError<T> value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle<T> value)? idle,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthError<T> value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class AuthIdle<T> implements AuthState<T> {
  const factory AuthIdle() = _$AuthIdleImpl<T>;
}

/// @nodoc
abstract class _$$AuthLoadingImplCopyWith<T, $Res> {
  factory _$$AuthLoadingImplCopyWith(
    _$AuthLoadingImpl<T> value,
    $Res Function(_$AuthLoadingImpl<T>) then,
  ) = __$$AuthLoadingImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({AuthEvent event, int? count, int? total, bool isInit});

  $AuthEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$AuthLoadingImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthLoadingImpl<T>>
    implements _$$AuthLoadingImplCopyWith<T, $Res> {
  __$$AuthLoadingImplCopyWithImpl(
    _$AuthLoadingImpl<T> _value,
    $Res Function(_$AuthLoadingImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
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
      _$AuthLoadingImpl<T>(
        event:
            null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                    as AuthEvent,
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

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthEventCopyWith<$Res> get event {
    return $AuthEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$AuthLoadingImpl<T> implements AuthLoading<T> {
  const _$AuthLoadingImpl({
    required this.event,
    this.count,
    this.total,
    this.isInit = true,
  });

  @override
  final AuthEvent event;
  @override
  final int? count;
  @override
  final int? total;
  @override
  @JsonKey()
  final bool isInit;

  @override
  String toString() {
    return 'AuthState<$T>.loading(event: $event, count: $count, total: $total, isInit: $isInit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthLoadingImpl<T> &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isInit, isInit) || other.isInit == isInit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event, count, total, isInit);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthLoadingImplCopyWith<T, _$AuthLoadingImpl<T>> get copyWith =>
      __$$AuthLoadingImplCopyWithImpl<T, _$AuthLoadingImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      AuthEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      AuthEvent event,
    )
    success,
    required TResult Function(
      AppError? error,
      AuthEvent event,
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
    TResult? Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult? Function(
      AppError? error,
      AuthEvent event,
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
    TResult Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult Function(
      AppError? error,
      AuthEvent event,
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
    required TResult Function(AuthIdle<T> value) idle,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthError<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle<T> value)? idle,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthError<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle<T> value)? idle,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthError<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading<T> implements AuthState<T> {
  const factory AuthLoading({
    required final AuthEvent event,
    final int? count,
    final int? total,
    final bool isInit,
  }) = _$AuthLoadingImpl<T>;

  AuthEvent get event;
  int? get count;
  int? get total;
  bool get isInit;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthLoadingImplCopyWith<T, _$AuthLoadingImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<T, $Res> {
  factory _$$AuthSuccessImplCopyWith(
    _$AuthSuccessImpl<T> value,
    $Res Function(_$AuthSuccessImpl<T>) then,
  ) = __$$AuthSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data, ApiResponseModel<T?> response, AuthEvent event});

  $AuthEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthSuccessImpl<T>>
    implements _$$AuthSuccessImplCopyWith<T, $Res> {
  __$$AuthSuccessImplCopyWithImpl(
    _$AuthSuccessImpl<T> _value,
    $Res Function(_$AuthSuccessImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? response = null,
    Object? event = null,
  }) {
    return _then(
      _$AuthSuccessImpl<T>(
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
                    as AuthEvent,
      ),
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthEventCopyWith<$Res> get event {
    return $AuthEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$AuthSuccessImpl<T> implements AuthSuccess<T> {
  const _$AuthSuccessImpl({
    required this.data,
    required this.response,
    required this.event,
  });

  @override
  final T? data;
  @override
  final ApiResponseModel<T?> response;
  @override
  final AuthEvent event;

  @override
  String toString() {
    return 'AuthState<$T>.success(data: $data, response: $response, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessImpl<T> &&
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

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessImplCopyWith<T, _$AuthSuccessImpl<T>> get copyWith =>
      __$$AuthSuccessImplCopyWithImpl<T, _$AuthSuccessImpl<T>>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      AuthEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      AuthEvent event,
    )
    success,
    required TResult Function(
      AppError? error,
      AuthEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) {
    return success(data, response, event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult? Function(
      AppError? error,
      AuthEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) {
    return success?.call(data, response, event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult Function(
      AppError? error,
      AuthEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, response, event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthIdle<T> value) idle,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthError<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle<T> value)? idle,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthError<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle<T> value)? idle,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthError<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AuthSuccess<T> implements AuthState<T> {
  const factory AuthSuccess({
    required final T? data,
    required final ApiResponseModel<T?> response,
    required final AuthEvent event,
  }) = _$AuthSuccessImpl<T>;

  T? get data;
  ApiResponseModel<T?> get response;
  AuthEvent get event;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthSuccessImplCopyWith<T, _$AuthSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<T, $Res> {
  factory _$$AuthErrorImplCopyWith(
    _$AuthErrorImpl<T> value,
    $Res Function(_$AuthErrorImpl<T>) then,
  ) = __$$AuthErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({AppError? error, AuthEvent event, bool isUnAuth, bool isCancel});

  $AppErrorCopyWith<$Res>? get error;
  $AuthEventCopyWith<$Res> get event;
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$AuthErrorImpl<T>>
    implements _$$AuthErrorImplCopyWith<T, $Res> {
  __$$AuthErrorImplCopyWithImpl(
    _$AuthErrorImpl<T> _value,
    $Res Function(_$AuthErrorImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? event = null,
    Object? isUnAuth = null,
    Object? isCancel = null,
  }) {
    return _then(
      _$AuthErrorImpl<T>(
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as AppError?,
        event:
            null == event
                ? _value.event
                : event // ignore: cast_nullable_to_non_nullable
                    as AuthEvent,
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

  /// Create a copy of AuthState
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

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthEventCopyWith<$Res> get event {
    return $AuthEventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$AuthErrorImpl<T> implements AuthError<T> {
  const _$AuthErrorImpl({
    required this.error,
    required this.event,
    required this.isUnAuth,
    this.isCancel = false,
  });

  @override
  final AppError? error;
  @override
  final AuthEvent event;
  @override
  final bool isUnAuth;
  @override
  @JsonKey()
  final bool isCancel;

  @override
  String toString() {
    return 'AuthState<$T>.error(error: $error, event: $event, isUnAuth: $isUnAuth, isCancel: $isCancel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl<T> &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.isUnAuth, isUnAuth) ||
                other.isUnAuth == isUnAuth) &&
            (identical(other.isCancel, isCancel) ||
                other.isCancel == isCancel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, error, event, isUnAuth, isCancel);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<T, _$AuthErrorImpl<T>> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<T, _$AuthErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
      AuthEvent event,
      int? count,
      int? total,
      bool isInit,
    )
    loading,
    required TResult Function(
      T? data,
      ApiResponseModel<T?> response,
      AuthEvent event,
    )
    success,
    required TResult Function(
      AppError? error,
      AuthEvent event,
      bool isUnAuth,
      bool isCancel,
    )
    error,
  }) {
    return error(this.error, event, isUnAuth, isCancel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult? Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult? Function(
      AppError? error,
      AuthEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
  }) {
    return error?.call(this.error, event, isUnAuth, isCancel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AuthEvent event, int? count, int? total, bool isInit)?
    loading,
    TResult Function(T? data, ApiResponseModel<T?> response, AuthEvent event)?
    success,
    TResult Function(
      AppError? error,
      AuthEvent event,
      bool isUnAuth,
      bool isCancel,
    )?
    error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, event, isUnAuth, isCancel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthIdle<T> value) idle,
    required TResult Function(AuthLoading<T> value) loading,
    required TResult Function(AuthSuccess<T> value) success,
    required TResult Function(AuthError<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthIdle<T> value)? idle,
    TResult? Function(AuthLoading<T> value)? loading,
    TResult? Function(AuthSuccess<T> value)? success,
    TResult? Function(AuthError<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthIdle<T> value)? idle,
    TResult Function(AuthLoading<T> value)? loading,
    TResult Function(AuthSuccess<T> value)? success,
    TResult Function(AuthError<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError<T> implements AuthState<T> {
  const factory AuthError({
    required final AppError? error,
    required final AuthEvent event,
    required final bool isUnAuth,
    final bool isCancel,
  }) = _$AuthErrorImpl<T>;

  AppError? get error;
  AuthEvent get event;
  bool get isUnAuth;
  bool get isCancel;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<T, _$AuthErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
