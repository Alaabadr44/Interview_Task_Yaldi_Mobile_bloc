// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../common/buttons/button_widget.dart';
import '../controller/register_controller.dart';

class BottomActions extends StatelessWidget {
  final RegisterController? controller;
  final Bloc bloc;
  final VoidCallback onAction;
  BottomActions({
    super.key,
    this.controller,
    required this.bloc,
    required this.onAction,
  }) : assert(
         (!UserService.isExistUser && controller != null) ||
             UserService.isExistUser,
       );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.sizeSide.width * .04),
      decoration: const BoxDecoration(color: AppColors.baseColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonWidget(
            onTab: onAction,
            type: ButtonType.download,
            bloc: bloc,
            title:
                UserService.currentUser != null
                    ? context.localText.button_save_change_title
                    : context.localText.signUp,
            backgroundColor: AppColors.baseColor.withOpacity(.25),
            progressColor: AppColors.baseColor,
          ),
          (context.sizeSide.smallSide * (UserService.isExistUser ? .1 : .01))
              .ph,
          5.ph,
          if (!UserService.isExistUser)
            ButtonWidget(
              onTab: () {
                context.pop();
              },
              title: context.localText.login,
              style: context.titleM?.copyWith(color: AppColors.primaryColor),
              backgroundColor: AppColors.grey50,
              borderOutlinedColor: AppColors.primaryColor.withOpacity(0.1),
              type: ButtonType.outline,
            ),
          5.ph,
        ],
      ),
    );
  }
}
