// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import '../../presentation/view_model/blocs/auth_bloc/auth_event.dart';
import '../../presentation/view_model/blocs/data_bloc/api_data_event.dart';

abstract class RemoteAppRepository {
  // Future<HttpResponse> getIndexData(QueryParams params);
  // Future<HttpResponse> getShowData(QueryParams params);
  // Future<HttpResponse> getGeneralData(ApiDataEvent event);
  // Future<HttpResponse> store(QueryParams query);
  Future<Response> callApi(ApiDataEvent event, {ProgressCallback? onSendProgress, CancelToken? cancelRequest});
  Future<Response> auth(AuthEvent event, ProgressCallback onSendProgress, [CancelToken? cancelRequest]);
}
