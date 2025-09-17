// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

// Project imports:
import '../../../../../../core/utils/api_info.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/utils/page_controller.dart';
import '../../../../../../domain/entities/user_reg_model.dart';
import '../../../../../view_model/blocs/auth_bloc/methods/auth_with_email_password.dart';

class RegisterController implements AppPageController {
  late final ValueNotifier<bool> obscurePassword;
  late final ValueNotifier<bool> obscureRePassword;
  late final GlobalKey<FormBuilderFieldState<FormBuilderField, dynamic>>
  passwordKey;
  late final GlobalKey<FormBuilderState> globalKey;

  late final AuthWithEmailPassword<UserRegModel> authHelper;
  @override
  String? get route => throw UnimplementedError();


  @override
  void initDependencies({BuildContext? context}) {
    globalKey = GlobalKey<FormBuilderState>();
    passwordKey = GlobalKey<FormBuilderFieldState>();
    obscurePassword = ValueNotifier(true);
    obscureRePassword = ValueNotifier(true);
    authHelper = AuthWithEmailPassword();
    
  }

  void register() {
    if (globalKey.currentState!.saveAndValidate()) {
      authHelper.register(
        ApiInfo(
          endpoint: ApiRoute.register.route,
          body: globalKey.currentState!.value,
        ),
      );
    }
  }

  void cancelRequestDialog(BuildContext context) {
    if (authHelper.authWithEmailPassword.cancelRequest != null) {
      authHelper.authWithEmailPassword.cancel('');
    }
  }

  @override
  void disposeDependencies({BuildContext? context}) {
    obscurePassword.dispose();
    obscureRePassword.dispose();
  authHelper.authWithEmailPassword.close();
  }
}
