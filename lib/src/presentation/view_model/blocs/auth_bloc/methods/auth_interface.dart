// Project imports:
import '../../../../../core/utils/api_info.dart';

abstract class AuthInterface {
  String? get route;

  void login({ApiInfo? query});
}
