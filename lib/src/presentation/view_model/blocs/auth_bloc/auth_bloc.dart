// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart' show CancelToken;
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../core/config/injector.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../data/models/api_response_model.dart';
import '../assistance/base_bloc_helper.dart';
import '../assistance/bloc_progress_helper.dart';
import '../assistance/bloc_progress_model.dart';
import '../assistance/unauthorized_notifier.dart';
import '../bloc_assist.dart';
import 'auth_event.dart';
import 'auth_state.dart';

// Project imports:
class AuthBloc<MODEL> extends Bloc<AuthEvent, AuthState<MODEL>> with BlocAssist {
  BaseBlocHelper<MODEL>? _helper;

  AuthBloc() : super(const AuthIdle()) {
    _helper = BaseBlocHelper<MODEL>(bloc: this);
    on<UserLoginEvent>(_callApi);
    on<UserLogoutEvent>(_callApi);
    on<UserDeleteEvent>(_callApi);
    on<ForgetPasswordEvent>(_callApi);
    on<CheckCodeEvent>(_callApi);
    on<UserRegisterEvent>(_callApi);
    on<UserUpdateEvent>(_callApi);
    on<SendCodeEvent>(_callApi);
  }

  Future<void> _callApi(AuthEvent event, Emitter<AuthState<MODEL>> emit) async {
    _helper?.cancelToken = CancelToken();
    BlocProgressModel? progressModel = _helper?.addProgress(event);
    emit(AuthLoading<MODEL>(event: event));

    event.authData.body = _helper!.getDataForStore(event.authData);

    final DataState<ApiResponseModel<MODEL?>> dataState = await _helper!.authUserUseCase(
      event: event,
      cancel: cancelRequest,
      progress: (count, total) {
        injector<BlocProgressHelper>().updateProgress(progressModel?.id, total: total, count: count);
        emit(AuthLoading<MODEL>(event: event, count: count, total: total, isInit: false));
      },
    );
    dataState.when(
      success: (successState) {
        // print(successState.data);
        injector<BlocProgressHelper>().updateProgress(progressModel?.id, success: true);
        emit(AuthSuccess<MODEL>(data: successState.data, response: successState, event: event));
      },
      failure: (error, errorResponse) {
        injector<BlocProgressHelper>().updateProgress(progressModel?.id, success: false);

        emit(AuthError<MODEL>(
            error: error,
            event: event,
            isUnAuth: error?.code != null && error?.code == HttpStatus.unauthorized,
            isCancel: cancelRequest?.isCancelled ?? false));
        injector<UnauthorizedNotifier>().unauthorized(error?.code, error?.message);
        // if ((errorState.code != null && errorState.code != HttpStatus.unauthorized) || errorState.code == null) {
        //   emit(AuthError<MODEL>(error: errorState, event: event));
        // }
      },
    );
    _helper?.cancelToken = null;
    // injector<BlcProgressHelper>().removeProgress(progressModel);
  }

  @override
  CancelToken? get cancelRequest => _helper?.cancelToken;
}
