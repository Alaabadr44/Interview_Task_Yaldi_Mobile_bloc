import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/src/core/utils/enums.dart';
import 'package:flutter_application_bloc/src/core/utils/extension.dart';
import '../../../../../../../core/config/assets/assets.gen.dart';
import '../../../../../../../core/config/injector.dart';
import '../../../../../../../core/services/sound_service.dart';
import '../../../../../../../core/services/user_service.dart';
import '../../../../../../../core/utils/api_info.dart';
import '../../../../../../../domain/entities/user_dash_model.dart';
import '../../../../../../view_model/blocs/data_bloc/api_data_bloc.dart';

import '../../../../../../../core/utils/page_controller.dart';
import '../../../../../../view_model/blocs/data_bloc/api_data_event.dart';

class DashboardController implements AppPageController {
  late ApiDataBloc<UserDashModel> dashboardBloc;
  @override
  void disposeDependencies({BuildContext? context}) {
    dashboardBloc.close();
  }

  @override
  void initDependencies({BuildContext? context}) {
    dashboardBloc = ApiDataBloc<UserDashModel>();
    getDashboardData();
  }

  getDashboardData() {
    dashboardBloc.add(ApiGeneralData(queryParams: ApiInfo(endpoint: route!)));
  }

  @override
  String? get route => ApiRoute.dashboard.route;




logout(BuildContext context) async {
    playSound();
    // Clear user data
    await UserService.removeUserData();

    // Navigate to login and clear stack
    if (context.mounted) {
      context.nextReplacementNamed(AppLocalRoute.login.route);
    }
  }

  void playSound() {
    injector<AudioPlayersServices>().playAssetSound(Assets.sounds.login);
  }
}
