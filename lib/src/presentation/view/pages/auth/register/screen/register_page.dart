import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
// Flutter imports:
import 'package:flutter_application_bloc/src/core/config/app_colors.dart';
import 'package:flutter_application_bloc/src/core/config/l10n/generated/l10n.dart'; // Dart imports:

import '../../../../../../core/services/environment_service.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../../core/utils/layout/responsive_layout.dart';
import '../../../../../../domain/entities/user_reg_model.dart';
import '../../../../../view_model/blocs/auth_bloc/auth_bloc.dart';
import '../../../../../view_model/blocs/data_bloc/typedefs_bloc.dart';
import '../../../../app_logo.dart';
import '../../../../common/animation_widget.dart';
import '../../../../common/containers/general_container.dart';
import '../../../../common/text_widget.dart';
import '../controller/register_controller.dart';
import '../widgets/body_register.dart';
import '../widgets/bottom_actions.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterController registerController;

  @override
  void initState() {
    super.initState();
    registerController =
        RegisterController()..initDependencies(context: context);
  }

  void _fillWithFakeData() {
    if (registerController.globalKey.currentState != null) {
      String _password = faker.internet.password();
      registerController.globalKey.currentState!.patchValue({
        'firstName': faker.person.firstName(),
        'lastName': faker.person.lastName(),
        'email': faker.internet.email(),
        'username': faker.internet.userName(),
        'password': _password,
        'password_confirmation': _password,
      });

      // Show a snackbar to indicate fake data was filled
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Fake data filled successfully!'),
          duration: Duration(seconds: 2),
          backgroundColor: AppColors.primaryColor,
        ),
      );
    }
  }

  @override
  void dispose() {
    registerController.disposeDependencies();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      showAppBar: false,
      isPadding: false,
      maintainBodyViewPadding: false,
      onBackAllApp: registerController.cancelRequestDialog,
      onBackPage: (context) {
        registerController.cancelRequestDialog(context);
        context.popWidget();
      },
      builder: (context, info) {
        return BlocAuthListener<UserRegModel>(
          bloc:
              registerController.authHelper.authWithEmailPassword
                  as AuthBloc<UserRegModel>,
          listener: (ctx, state) {
            state.mapOrNull(
              success: (value) {
                context.showSuccess(
                  "User registered successfully",
                  popLoadingDialog: false,
                );
              },
              error: (value) {
                context.showError(
                  value.error?.message ?? '',
                  popLoadingDialog: false,
                );
              },
            );
          },
          child: AnimationWidget(
            type: AnimationDirection.fade,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryColor.withOpacity(0.1),
                    Colors.white,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: info.screenWidth * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo Section
                    GeneralContainer.white(
                      padding: const EdgeInsets.all(20),
                      borderRadius: 20,
                      shadowColor: AppColors.primaryColor.withOpacity(0.1),
                      shadowBlurRadius: 20,
                      shadowOffset: const Offset(0, 10),
                      child: const Center(child: AppLogo()),
                    ),

                    const SizedBox(height: 40),

                    // Welcome Text
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: TextWidget(
                        text: S.of(context).welcome_get_started,
                        style: context.headlineL?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    TextWidget(
                      text: S.current.enter_data_to_create_account,
                      style: context.bodyL?.copyWith(color: AppColors.grey600),
                    ),

                    const SizedBox(height: 32),

                    Expanded(
                      child: SingleChildScrollView(
                        child: BodyRegister(
                          registerController: registerController,
                          formKey: registerController.globalKey,
                          obscurePassword: registerController.obscurePassword,
                          obscureRePassword:
                              registerController.obscureRePassword,
                          passwordKey: registerController.passwordKey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      bottomNavigationBar: BottomActions(
        bloc: registerController.authHelper.authWithEmailPassword,
        controller: registerController,
        onAction: registerController.register,
      ),
      fab: Visibility(
          visible: EnvironmentService.isDevelopment,
          child: FloatingActionButton(
            onPressed: _fillWithFakeData,
            backgroundColor: AppColors.primaryColor,
            child: const Icon(Icons.auto_fix_high, color: Colors.white),
            tooltip: 'Fill with fake data',
          ),
        ),
    );
  }
}
