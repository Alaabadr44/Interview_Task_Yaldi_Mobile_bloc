// Dart imports:
import 'dart:io';

// Package imports:
import 'package:dio/dio.dart' show CancelToken, Response;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// Project imports:
import '../../../../core/config/injector.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utils/api_info.dart';
import '../../../../core/utils/app_logger.dart';
import '../../../../core/utils/data_state.dart';
import '../../../../core/utils/extension.dart';
import '../../../../data/models/api_response_model.dart';
import '../assistance/base_bloc_helper.dart';
import '../assistance/bloc_progress_helper.dart';
import '../assistance/bloc_progress_model.dart';
import '../assistance/unauthorized_notifier.dart';
import '../bloc_assist.dart';
import 'api_data_event.dart';
import 'api_data_state.dart';

class ApiDataBloc<MODEL> extends Bloc<ApiDataEvent, ApiDataState<MODEL>> with BlocAssist {
  BaseBlocHelper<MODEL>? _helper;

  ApiInfo? get requestQuery => _helper?.query;
  PagingController<int, MODEL>? get controller => _helper?.controller;

  late ApiDataEvent _event;

  ApiDataBloc({ApiInfo? query}) : super(const ApiDataIdle()) {
    _helper = BaseBlocHelper<MODEL>(query: query, bloc: this);
    // late bool? isPaginate = false;
    on<ApiGeneralData>(
      (event, emit) {
        _event = event;
        return event.deferentApi! ? _getDataFromDeferentApi(event, emit) : _getGeneralData(event, emit);
      },
    );
    on<ApiStoreData>(
      (event, emit) {
        _event = event;
        return event.deferentApi! ? _storeDeferentApi(event, emit) : _store(event, emit);
      },
    );
    on<ApiIndexData>((event, emit) {
      _event = event;
      // isPaginate = !event.listWithoutPagination!;
      query ??= event.queryParams;

      if (event.listWithoutPagination!) {
        // data = [];
        // return ApiResponseModel<List<MODEL>>
        return _getDataWithoutPagination(event, emit);
      }
      query?.queries = _helper?.initQueries(pQuery: query, isPagination: !event.listWithoutPagination!);

      /* data = {
          Pagination
          data = []
        } 
      */
      // return ApiResponseModel<ApiPagination<MODEL>>
      return _getIndexData(
          event.copyWith.call(
            apiMethod: event.apiMethod,
            listWithoutPagination: event.listWithoutPagination,
            queryParams: query!,
          ),
          emit);
    });
    if (query != null) {
      _helper!.initializeController();
    }
  }

  Future<void> _getGeneralData(ApiGeneralData event, Emitter<ApiDataState<MODEL>> emit) async {
    _helper?.cancelToken = CancelToken();
    emit(ApiDataLoading<MODEL>(event: event));
    final DataState<ApiResponseModel<MODEL>> dataState =
        await _helper!.getGeneralDataUseCase(event: event, cancel: cancelRequest);
    dataState.when(
      success: (successState) {
        emit(ApiDataSuccessModel<MODEL>(data: successState.data, response: successState, event: event));
      },
      failure: (error, errorResponse) {
        emitError(emit, event, error, errorResponse);
        // injector<UnauthorizedNotifier>().unauthorized(errorState.code, errorState.message);
        // emit(ApiDataError<MODEL>(error: errorState, event: event));
      },
    );
    _helper?.cancelToken = null;
  }

  Future<void> _getDataFromDeferentApi(ApiGeneralData event, Emitter<ApiDataState<MODEL>> emit) async {
    _helper?.initDeferentApiUseCase(event.queryParams, event.interceptors);
    _helper?.cancelToken = CancelToken();
    emit(ApiDataLoading<MODEL>(event: event));
    final DataState<MODEL> dataState = await _helper!.getDataDeferentApiUseCase!(event: event, cancel: cancelRequest);
    dataState.when(
      success: (successState) {
        emit(ApiSuccessDeferentApiModel<MODEL>(data: successState, event: event));
      },
      failure: (error, errorResponse) {
        emitError(emit, event, error, errorResponse);
        // injector<UnauthorizedNotifier>().unauthorized(errorState.code, errorState.message);
        // emit(ApiDataError<MODEL>(error: errorState, event: event));
      },
    );
    _helper?.cancelToken = null;
  }

  Future<void> _getIndexData(ApiIndexData event, Emitter<ApiDataState<MODEL>> emit) async {
    _helper?.cancelToken = CancelToken();
    emit(ApiDataLoading<MODEL>(event: event));
    final DataState<ApiResponseModel<List<MODEL>>> dataState =
        await _helper!.getIndexDataUseCase(event: event, cancel: cancelRequest);
    dataState.when(
      success: (successState) {
        emit(ApiDataSuccessPagination<MODEL>(data: successState.data, response: successState, event: event));
        if (_helper!.controller != null && successState.data != null) {
          _helper!.newSettingForPagination(successState);
        }
      },
      failure: (error, errorResponse) {
        controller?.error = error;
        emitError(emit, event, error, errorResponse);
        // injector<UnauthorizedNotifier>().unauthorized(errorState.code, errorState.message);
        // emit(ApiDataError<MODEL>(error: errorState, event: event));
      },
    );
    _helper?.cancelToken = null;
  }

  Future<void> _getDataWithoutPagination(ApiIndexData event, Emitter<ApiDataState<MODEL>> emit) async {
    _helper?.cancelToken = CancelToken();
    emit(ApiDataLoading<MODEL>(event: event));
    final dataState = await _helper!.getListDataUseCase(event: event, cancel: cancelRequest);
    dataState.when(
      success: (successState) {
        emit(ApiDataSuccessList<MODEL>(data: successState.data, response: successState, event: event));
      },
      failure: (error, errorResponse) {
        emitError(emit, event, error, errorResponse);
        // injector<UnauthorizedNotifier>().unauthorized(errorState.code, errorState.message);
        // emit(ApiDataError<MODEL>(error: errorState, event: event));
      },
    );
    _helper?.cancelToken = null;
  }

  Future<void> _store(ApiStoreData event, Emitter<ApiDataState<MODEL>> emit) async {
    _helper?.cancelToken = CancelToken();
    BlocProgressModel? progressModel = _helper?.addProgress(event);
    emit(ApiDataLoading<MODEL>(event: event));
    event.queryParams.body = _helper!.getDataForStore(event.queryParams);
    final DataState<ApiResponseModel<MODEL?>> dataState = await _helper!.storeUseCase(
      event: event,
      cancel: cancelRequest,
      progress: (count, total) {
        injector<BlocProgressHelper>().updateProgress(progressModel?.id, total: total, count: count);
        emit(ApiDataLoading<MODEL>(event: event, count: count, total: total, isInit: false));
      },
    );
    dataState.when(
      success: (successState) {
        injector<BlocProgressHelper>().updateProgress(progressModel?.id, success: true);
        emit(ApiDataSuccessModel<MODEL>(data: successState.data, response: successState, event: event));
      },
      failure: (error, errorResponse) {
        emitError(emit, event, error, errorResponse, id: progressModel?.id);
        // injector<UnauthorizedNotifier>().unauthorized(errorState.code, errorState.message);
        // injector<BlcProgressHelper>().updateProgress(progressModel?.id, success: false);
        // emit(ApiDataError<MODEL>(error: errorState, event: event));
      },
    );
    _helper?.cancelToken = null;
    injector<BlocProgressHelper>().removeProgress(progressModel);
  }

  Future<void> _storeDeferentApi(ApiStoreData event, Emitter<ApiDataState<MODEL>> emit) async {
    _helper?.initDeferentApiUseCase(event.queryParams, event.interceptors);
    _helper?.cancelToken = CancelToken();
    BlocProgressModel? progressModel = _helper?.addProgress(event);
    emit(ApiDataLoading<MODEL>(event: event));
    event.queryParams.body = _helper!.getDataForStore(event.queryParams);
    final DataState<MODEL> dataState = await _helper!.getDataDeferentApiUseCase!.storeInDeferentApi(
      event: event,
      cancel: cancelRequest,
      progress: (count, total) {
        injector<BlocProgressHelper>().updateProgress(progressModel?.id, total: total, count: count);
        emit(ApiDataLoading<MODEL>(event: event, count: count, total: total));
      },
    );
    dataState.when(
      success: (successState) {
        injector<BlocProgressHelper>().updateProgress(progressModel?.id, success: true);
        emit(ApiSuccessDeferentApiModel<MODEL>(data: successState, event: event));
      },
      failure: (error, errorResponse) {
        emitError(emit, event, error, errorResponse, id: progressModel?.id);
        // injector<UnauthorizedNotifier>().unauthorized(errorState.code, errorState.message);
        // injector<BlcProgressHelper>().updateProgress(progressModel?.id, success: false);
        // emit(ApiDataError<MODEL>(error: errorState, event: event));
      },
    );
    _helper?.cancelToken = null;
    injector<BlocProgressHelper>().removeProgress(progressModel);
  }

  void emitError(Emitter<ApiDataState<MODEL>> emit, dynamic event, AppError? errorState, Response? errorRes, {String? id}) {
    AppLogger.logError('Emit Error: \n${errorState?.toJson()}');
    if (id.isNotNull) {
      injector<BlocProgressHelper>().updateProgress(id!, success: false);
    }
    emit(ApiDataError<MODEL>(
      error: errorState,
      event: event,
      isUnAuth: errorState?.code != null && errorState?.code == HttpStatus.unauthorized,
      errorResponse: errorRes,
    ));
    injector<UnauthorizedNotifier>().unauthorized(errorState?.code, errorState?.message);
    // if ((errorState.code != null && errorState.code != HttpStatus.unauthorized) || errorState.code == null) {
    //   emit(ApiDataError<MODEL>(error: errorState, event: event, ));
    // }
  }

  void refresh() {
    if (_event is ApiIndexData) {
      (_event as ApiIndexData).listWithoutPagination! ? add(_event) : controller?.refresh();
    } else {
      add(_event);
    }
  }

  @override
  Future<void> close() async {
    cancelRequest?.cancel();
    _helper?.cancelToken = null;
    if (_helper?.dioService != null) {
      _helper?.dioService!.dio.close();
      _helper?.dioService = null;
    }
    _helper?.disposeController();
    super.close();
  }

  @override
  CancelToken? get cancelRequest => _helper?.cancelToken;
}
