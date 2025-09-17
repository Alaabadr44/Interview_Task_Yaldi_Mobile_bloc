import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/src/core/config/l10n/generated/l10n.dart'; // Flutter imports:
// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/utils/api_info.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../common/buttons/button_widget.dart';
import '../../../../common/fields/generic_text_field.dart';
import '../controller/login_controller.dart';

class FooterActionLogin extends StatelessWidget {
  final GlobalKey<FormBuilderState> globalKey;
  final LoginController loginController;
  const FooterActionLogin({
    super.key,
    required this.globalKey,
    required this.loginController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          onTab: () {
            if (globalKey.currentState!.saveAndValidate()) {
              final formData = globalKey.currentState!.value;

              // Manually format as JSON object for DummyJSON API
              final jsonBody = {
                'username': formData['username'],
                'password': formData['password'],
                'expiresInMins': 30, // Convert to int, not string
              };

              loginController.authWithEmailPassword.login(
                query: ApiInfo(
                  endpoint: ApiRoute.login.route,
                  body:
                      jsonBody, // Use manually formatted JSON instead of FormBuilder data
                ),
              );
            }
          },
          title: context.localText.signIn,
        ),
        (context.sizeSide.smallSide * .05).ph,
        ButtonWidget(
          onTab: () {
            context.nextNamed(AppLocalRoute.register.route);
          },
          title: S.current.create_account,
          style: context.titleM?.copyWith(color: AppColors.primaryColor),
          backgroundColor: AppColors.grey50,
        ),
      ],
    );
  }
}
