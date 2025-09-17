// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../core/config/app_colors.dart';
import '../../../core/config/assets/assets.gen.dart';
import '../../../core/config/l10n/generated/l10n.dart';
import '../../../core/error/error.dart';
import '../../../core/utils/extension.dart';
import 'buttons/button_widget.dart';
import 'image_widget.dart';
import 'text_widget.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final Color? textColor;
  final String btnTitle;
  final VoidCallback onTab;
  final bool? showImage;
  const CustomErrorWidget({
    super.key,
    required this.message,
    required this.btnTitle,
    required this.onTab,
    this.textColor,
    this.showImage = true,
  });


  factory CustomErrorWidget.normalError({
 required AppError error,
    required VoidCallback onTab,
    bool? showImage,
 
  }) {
    
    return CustomErrorWidget(
      message: error. message??"",
      btnTitle:  S.current.button_retry_title,
      onTab: onTab,
      textColor: AppColors.reverseBaseColor,
      showImage: showImage??false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showImage!) ...[
            ImageWidget(
              image: Assets.icons.warning,
              // fit: BoxFit.none,
              // width: context.sizeSide.smallSide,
              // height: context.sizeSide.smallSide,
            ),
            (context.sizeSide.smallSide * 0.07).ph,
          ],
          TextWidget(
            text: message,
            style: context.bodyL?.white.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),
          (context.sizeSide.smallSide * 0.07).ph,
          ButtonWidget(
            width: context.sizeSide.smallSide * .6,
            onTab: onTab,
            title: btnTitle,
          ),
          // (context.bottomPadding).ph,
        ],
      ),
    );
  }
}
