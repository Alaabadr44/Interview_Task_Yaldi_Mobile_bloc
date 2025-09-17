// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter_application_bloc/src/core/config/l10n/generated/l10n.dart';
import 'package:flutter/material.dart'
    show BuildContext, GlobalKey, Icon, Icons, NavigatorState, VoidCallback;

// import 'package:on_app/src/core/services/analytics_service.dart';

// Project imports:
import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/injector.dart';
import '../../../../../core/services/user_service.dart';
import '../../../../../core/utils/api_info.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/extension.dart';
import '../../../../../domain/entities/user_model.dart';
import '../../../../view/common/popup/dialog.dart';
import '../../../../view/common/popup/overlay_alert.dart';
import '../../../../view/common/popup/overlay_body_widget.dart';
import '../auth_bloc.dart';
import '../auth_event.dart';
import '../auth_state.dart';
import 'auth_interface.dart';

class AuthWithEmailPassword<MODEL> implements AuthInterface {
  @override
  String? get route => ApiRoute.login.route;

  late final AuthBloc<MODEL> _authBloc;
  late final BuildContext context =
      injector<GlobalKey<NavigatorState>>().currentContext!;
  AuthWithEmailPassword() {
    _authBloc = AuthBloc<MODEL>();
    // context = injector<GlobalKey<NavigatorState>>().currentContext!;
  }

  AuthBloc get authWithEmailPassword => _authBloc;

  @override
  void login({ApiInfo? query}) {
    if (query != null) {
      _authBloc.add(UserLoginEvent(authData: query));
    }
  }

  void register(ApiInfo query) {
    _authBloc.add(UserRegisterEvent(authData: query));
  }

  void verifyCode(ApiInfo query) {
    _authBloc.add(CheckCodeEvent(authData: query));
  }

  void logout() {
    _authBloc.add(
      UserLogoutEvent(authData: ApiInfo(endpoint: ApiRoute.logout.route)),
    );
  }

  void deleteAccount() {
    _authBloc.add(
      UserDeleteEvent(
        authData: ApiInfo(endpoint: ApiRoute.deleteAccount.route),
      ),
    );
  }

  void forgetPassword({required ApiInfo query}) {
    _authBloc.add(ForgetPasswordEvent(authData: query));
  }

  void updateProfile({required ApiInfo params}) {
    _authBloc.add(
      UserUpdateEvent(
        authData: params,
        // title: params.files != null ? S.of(context).shipper_setting_page_profile_update_profile_title : null,
      ),
    );
  }

  Future<void> listenLoginState<T>(
    AuthState state, {
    Function(T data)? onSuccess,
    VoidCallback? onVerify,
  }) async {
    state.whenOrNull(
      loading: (event, count, total, isInit) {
        event is UserLoginEvent || event is ForgetPasswordEvent
            ? _loading(isInit)
            : null;
      },
      error: (error, event, isUnAuth, isCancel) {
        if (event is UserLoginEvent && error?.code == HttpStatus.forbidden) {
          if (!isCancel) context.popWidget();
          onVerify?.call();
        } else if (event is UserLoginEvent || event is ForgetPasswordEvent) {
          if (!isCancel) context.popWidget();
          OverlayAlert.notify(
            context: context,
            message: error?.message ?? '',
            type: OverlayType.error,
          );
        }
      },
      success: (data, response, event) async {
        if (event is UserLoginEvent) {
          UserService.storeUserData((response.data as UserModel));
        
          context.popWidget();
        } else if (event is ForgetPasswordEvent) {
          context.popWidget();
          OverlayAlert.notify(
            context: context,
            message: response.message ?? '',
            type: OverlayType.success,
          );
        }
        onSuccess != null ? onSuccess(data) : null;
      },
    );
  }

  Future<void> listenUpdateState<T>(
    AuthState state, {
    Function(T data)? onSuccess,
  }) async {
    state.whenOrNull(
      // loading: (event, count, total) {
      //   event is ChangePasswordEvent ? _loading(event, count, total) : null;
      // },
      error: (error, event, _, isCancel) {
        // if (event is ChangePasswordEvent) context.popWidget();
        if (event is UserUpdateEvent) {
          OverlayAlert.notify(
            context: context,
            message: error?.message ?? '',
            type: OverlayType.error,
          );
        }
      },
      success: (data, response, event) async {
        // if (event is ChangePasswordEvent) context.popWidget();
        if (event is UserUpdateEvent) {
          OverlayAlert.notify(
            context: context,
            message: response.message ?? '',
            type: OverlayType.success,
          );
          onSuccess != null ? onSuccess(data) : null;
        }
        /* await StorageService().saveString(kUserToken, data['access_token']);
        await StorageService().saveString(kUserData, jsonEncode(data));
        await UserService().initializeService(); */
      },
    );
  }

  Future<void> listenLogoutState(AuthState state) async {
    state.whenOrNull(
      loading: (event, count, total, isInit) {
        if (event is UserLogoutEvent || event is UserDeleteEvent)
          _loading(isInit);
      },
      error: (error, event, _, isCancel) {
        context.popWidget();
        if (event is UserLogoutEvent || event is UserDeleteEvent) {
          OverlayAlert.notify(
            context: context,
            message: error?.message ?? '',
            type: OverlayType.error,
          );
        }
      },
      success: (data, response, event) async {
        if (event is UserLogoutEvent || event is UserDeleteEvent) {
          context.popWidget();
          /* OverlayAlert.notify(
            context: context,
            message: response.message ?? '',
            type: OverlayType.success,
          ); */
          UserService.removeUserData().then(
            (value) => context.nextNamedAndRemoveUntil(
              AppLocalRoute.login.route,
              (p0) => false,
            ),
          );
        }
      },
    );
  }

  /* Future<void> listenVerifyCodeState(
    AuthState state, {
    Function(AuthEvent? event)? successOnDone,
  }) async {
    state.whenOrNull(
      loading:
          (event, count, total, isInit) =>
              isInit ? showLoadingDialog(context) : null,
      success: (data, response, event) {
        context.popWidget();
        if (event is CheckCodeEvent) {
          if (data != null) {
            UserModel user = UserModel.fromJson(data);
            // TODO:: handel token
            String token = response.data['data']['token'];
            UserService.storeUserData(user, token);
          }
          bool isForget = event.authData.endpoint.endsWith(
            ApiRoute.verifyForgetPassword.route,
          );
          final timer = Timer(
            const Duration(seconds: 4),
            () => successOnDone != null ? successOnDone(event) : null,
          );
          showAlertDialog(
            context: context,
            title: context.localText.congratulations,
            content:
                isForget
                    ? context.localText.otp_success
                    : context.localText.yourAccountIsReadyToUse,
            canClose: false,
            backgroundColor: AppColors.baseColor.withOpacity(.95),
            onDone: () {
              timer.cancel();
              successOnDone != null ? successOnDone(event) : null;
            },
            withAnimate: true,
            header: Icon(
              Icons.check_circle,
              color: AppColors.secondaryColor,
              size: context.sizeSide.width * .2,
            ),
          );
        } else if (event is SendCodeEvent) {
          successOnDone != null ? successOnDone(event) : null;
          OverlayAlert.notify(
            context: context,
            message: response.message ?? '',
            type: OverlayType.success,
          );
        }
      },
      error: (error, event, isUnAuth, isCancel) {
        context.popWidget();
        OverlayAlert.notify(
          message: error?.message ?? '',
          context: context,
          type: OverlayType.error,
        );
      },
    );
  }
 */
  void _loading(bool isInit) {
    if (isInit) {
      showLoadingDialog(context);
      // showLoadingDialog(context, screenWidth * (context.isTablet ? .05 : 0.1));
    }
  }

  static Future<void> userUnauthorized(BuildContext ctx, String message) async {
    /* await showAlertDialog(
        ctx,
        notDismiss: true,
        AlertDialogApp(
          header: HeaderAlertDialogWidget(
            icon: FontAwesomeIcons.xmark,
            color: ThemeManager().appColor[ThemeColor.errorColor]!,
          ),
          onDone: () async {
            await UserService().removeUserData().then((value) {
              ctx.goNamed(LoginPage.pageName);
              // ctx.popWidget();
            });
          },
          body: message,
        )); */
  }
}
