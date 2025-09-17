import 'package:flutter_application_bloc/src/core/config/injector.dart';
import 'package:flutter_application_bloc/src/core/services/sound_service.dart';
// Flutter imports:
import 'dart:convert';

import 'package:flutter/material.dart'
    show BuildContext, GlobalKey, ValueNotifier, WidgetsBinding;
import 'package:flutter_application_bloc/src/core/config/injector.dart';
import 'package:flutter_application_bloc/src/core/utils/extension.dart';
// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/config/assets/assets.gen.dart';
import '../../../../../../core/services/storage_service.dart';
import '../../../../../../core/utils/api_info.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/utils/page_controller.dart';
import '../../../../../../domain/entities/user_model.dart';
import '../../../../../view_model/blocs/auth_bloc/methods/auth_with_email_password.dart';

class LoginController implements AppPageController {
  late final GlobalKey<FormBuilderState> globalKey;
  late final ValueNotifier<bool> passwordNotifier;
  late final ValueNotifier<bool> rememberMeNotifier; // Added for Remember Me

  late final AuthWithEmailPassword<UserModel> authWithEmailPassword;

  @override
  String? get route => ApiRoute.login.route;

  @override
  void initDependencies({BuildContext? context}) {
    globalKey = GlobalKey<FormBuilderState>();

    passwordNotifier = ValueNotifier<bool>(true);

    String? value = injector<StorageService>().getString(kRememberMe);
    rememberMeNotifier = ValueNotifier<bool>(value.isNotNull);
    loadValueIfRememberMe(value);

    authWithEmailPassword = AuthWithEmailPassword();
  }

  void toggleRememberMe(bool? state) {
    if (state == null) return;
    rememberMeNotifier.value = state; // Toggle Remember Me
  }

  @override
  void disposeDependencies({BuildContext? context}) {
    authWithEmailPassword.authWithEmailPassword.close();
    passwordNotifier.dispose();
    rememberMeNotifier.dispose(); // Dispose Remember Me
  }

  void login() {
    if (globalKey.currentState!.saveAndValidate()) {
      authWithEmailPassword.login(
        query: ApiInfo(
          endpoint: ApiRoute.login.route,
          body: globalKey.currentState!.value,
        ),
      );
    }
  }

  saveValueIfRememberMe() {
    if (rememberMeNotifier.value) {
      injector<StorageService>().saveString(
        kRememberMe,
        jsonEncode(globalKey.currentState!.value),
      );
    } else {
      injector<StorageService>().remove(kRememberMe);
    }
  }

  loadValueIfRememberMe(String? value) {
    if (rememberMeNotifier.value) {
      if (value != null) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          globalKey.currentState!.patchValue(jsonDecode(value));
        });
      }
    }
  }

  void playSound() {
    injector<AudioPlayersServices>().playAssetSound(Assets.sounds.login);
  }
}
