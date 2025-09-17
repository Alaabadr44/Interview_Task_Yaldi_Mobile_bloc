// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// Project imports:
import '../../../core/config/l10n/generated/l10n.dart';
import '../../../core/error/error.dart';
import '../../../core/utils/extension.dart';
import '../general/app_indicator.dart';
import 'custom_error_widget.dart';
import 'image_widget.dart';
import 'text_widget.dart';

enum ListType { list, grid, both }

Widget defaultLoading({Widget? child, Color? color}) {
  return const Center(child: AppIndicator());
}

Widget errorDuringBrowsing(BuildContext context, PagingController controller, [bool showImage = false]) {
  return Padding(
    padding: EdgeInsets.only(
        top: (context.sizeSide.smallSide / 1.5) / 3.5,
        right: context.sizeSide.smallSide * 0.03,
        left: context.sizeSide.smallSide * 0.03),
    child: CustomErrorWidget(
      showImage: showImage,
      message: (controller.error as AppError).message ?? '',
      btnTitle: S.of(context).button_retry_title,
      onTab: controller.refresh,
    ),
  );
}

Widget noDataAvailable(BuildContext context, {dynamic image, String? message}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      if (image != null)
        Expanded(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: ImageWidget(
              image: image,
              fit: BoxFit.contain,
            ),
          ),
        ),
      // (context.sizeSide.smallSide * .05).h,
      TextWidget(
        text: message ?? S.of(context).no_item_found,
        style: context.titleM,
        textAlign: TextAlign.center,
      ),
      (context.bottomPadding).ph,
    ],
  );
}
