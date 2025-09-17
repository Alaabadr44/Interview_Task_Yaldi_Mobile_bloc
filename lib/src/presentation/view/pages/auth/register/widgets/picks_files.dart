/* import 'package:flutter/material.dart';

// Package imports:
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../common/fields/_field_helper/decoration_field.dart';
import '../../../../common/fields/pick_file_field/box_file_widget.dart';
import '../../../../common/fields/pick_file_field/single_file_form_field.dart';
import '../../../../common/text_widget.dart';

class PicksFiles extends StatelessWidget {
  final bool isClickable;
  const PicksFiles({super.key, this.isClickable = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: context.localText.civilId,
          style: context.bodyL?.copyWith(fontWeight: FontWeight.w500),
        ),
        6.ph,
        Row(
          children: [
            SingleFileFormField(
              width: context.sizeSide.largeSide * .13,
              height: context.sizeSide.largeSide * .13,
              name: 'civil_id_front',
              initValue: UserService.currentUser?.civilIdFront,
              imageSource: FileSource.both,
              validator: FormBuilderValidators.required(errorText: ''),
              decorationField: DecorationField(isBorder: false, radiusBorder: kRadiusSmall),
              build: (context, controller) => BoxFileWidget(
                controller: controller,
                // height: context.sizeSide.largeSide * .13,
                title: context.localText.front,
                onClick: isClickable,
              ),
            ),
            (context.sizeSide.smallSide * .03).pw,
            SingleFileFormField(
              name: 'civil_id_back',
              initValue: UserService.currentUser?.civilIdBack,
              width: context.sizeSide.largeSide * .13,
              height: context.sizeSide.largeSide * .13,
              imageSource: FileSource.both,
              validator: FormBuilderValidators.required(errorText: ''),
              decorationField: DecorationField(isBorder: false, radiusBorder: kRadiusSmall),
              build: (context, controller) => BoxFileWidget(
                controller: controller,
                // height: context.sizeSide.largeSide * .13,
                title: context.localText.back,
                onClick: isClickable,
              ),
            ),
          ],
        ),
        (context.sizeSide.smallSide * .03).ph,
        SingleFileFormField(
          name: 'license_id',
          initValue: UserService.currentUser?.licenseId,
          width: context.sizeSide.largeSide * .13,
          height: context.sizeSide.largeSide * .13,
          validator: FormBuilderValidators.required(errorText: ''),
          imageSource: FileSource.both,
          decorationField: DecorationField(
            labelText: context.localText.licensesId,
            labelStyle: context.bodyL?.copyWith(fontWeight: FontWeight.w500),
            isBorder: false,
            radiusBorder: kRadiusSmall,
          ),
          build: (context, controller) => BoxFileWidget(
            controller: controller,
            // height: 20,
            onClick: isClickable,
          ),
        ),
      ],
    );
  }
}
 */
