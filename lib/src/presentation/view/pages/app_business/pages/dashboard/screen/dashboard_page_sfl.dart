import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_bloc/src/core/services/user_service.dart';
import 'package:flutter_application_bloc/src/core/utils/layout/responsive_layout.dart';
import 'package:flutter_application_bloc/src/core/utils/enums.dart';
import 'package:flutter_application_bloc/src/core/utils/extension.dart';
import 'package:flutter_application_bloc/src/presentation/view/general/app_indicator.dart';
import 'package:flutter_application_bloc/src/presentation/view/pages/app_business/pages/dashboard/dialogs/log_out_alert_dialog.dart';

import '../../../../../../../core/config/l10n/generated/l10n.dart';
import '../../../../../../../domain/entities/user_dash_model.dart';
import '../../../../../../view_model/blocs/data_bloc/typedefs_bloc.dart';
import '../../../../../commbonant/lang_bottom_sheet.dart';
import '../../../../../common/text_widget.dart';
import '../controller/dashboard_controller.dart';
import '../widgets/user_dashboard_widget.dart';

class DashboardPageSfl extends StatefulWidget {
  const DashboardPageSfl({super.key});

  @override
  State<DashboardPageSfl> createState() => _DashboardPageSflState();
}

class _DashboardPageSflState extends State<DashboardPageSfl> {
  late DashboardController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = DashboardController();
    _pageController.initDependencies(context: context);

    // Prevent back navigation
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void dispose() {
    _pageController.disposeDependencies();
    super.dispose();
  }

  Future<void> _refreshData() async {
    // Refresh the dashboard data
    _pageController.initDependencies(context: context);
  }

  Future<void> _logout() async {
    // Show confirmation dialog
    final shouldLogout = await showDialog<bool>(
      context: context,
      builder: (context) => const LogOutAlertDialog(),
    );

    if (shouldLogout == true) {
      _pageController.logout(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      onBackPage: (context) {}, // Prevent back navigation
      canPop: false,
      appBar: AppBar(
        title: TextWidget(text: S.current.dashboard),
        automaticallyImplyLeading: false,

        actions: [
          IconButton(
            tooltip: S.current.select_language,
            onPressed: () {
              context.showSheet(
                SizedBox(
                  height: context.screenSize.height * 0.4,
                  child: LangBottomWidget(isLable: true, onTab: () {}),
                ),
              );
            },
            icon: const Icon(Icons.language_rounded),
          ),
        ], // Remove back button
      ),
      builder: (context, info) {
        return RefreshIndicator(
          onRefresh: _refreshData,
          child: BlocDataBuilder<UserDashModel>(
            bloc: _pageController.dashboardBloc,
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => const AppIndicator(),

                loading: (event, count, total, isInit) => const AppIndicator(),
                successModel:
                    (data, response, event) =>
                        UserDashboardWidget(user: data!, onLogout: _logout),
                error: (error, errorResponse, event, isUnAuth, isCancel) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64,
                              color: Colors.red.shade400,
                            ),
                            const SizedBox(height: 16),
                            TextWidget(
                              text: S.current.unknown_error_message,
                              style: context.headlineM?.copyWith(
                                color: Colors.red.shade600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextWidget(
                              text:
                                  error?.message ??
                                  S.current.unknown_error_message,
                              style: context.bodyM?.copyWith(
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: _refreshData,
                              child: TextWidget(
                                text: S.current.button_retry_title,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
