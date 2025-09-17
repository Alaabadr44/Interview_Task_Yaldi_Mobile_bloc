// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:iconly/iconly.dart';

// Project imports:
import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/config/assets/assets.gen.dart';
import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../common/fields/_field_helper/decoration_field.dart';
import '../../../../common/fields/generic_text_field.dart';
import '../../../../common/fields/international_phone_field.dart';
import '../../../../common/image_widget.dart';
import '../../../../common/text_widget.dart';

class NamePhoneFields extends StatelessWidget {
  const NamePhoneFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (UserService.currentUser == null) ...[
          Center(
            child: TextWidget(
              text: context.localText.signUp,
              style: context.headlineL,
            ),
          ),
          (context.sizeSide.smallSide * .05).ph,
        ],
        GenericTextField(
          name: 'name',
          initialValue: UserService.currentUser?.firstName,
          autofillHints: const [
            AutofillHints.name,
            AutofillHints.givenName,
            AutofillHints.familyName,
          ],
          textType: TextInputType.name,
          validator: FormBuilderValidators.required(errorText: context.localText.validator_field_required_title),
          decorationField: DecorationField(
            fillBackgroundColor: true,
            isBorder: false,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            radiusBorder: kRadiusSmall,
            labelText: context.localText.name,
            hintText: context.localText.hintName,
            hintStyle: context.bodyM,
            prefixIcon: IconButton(icon: ImageWidget(image: Assets.icons.user), onPressed: null),
          ),
        ),
        if (!UserService.isExistUser) ...[
          (context.sizeSide.smallSide * .03).ph,
          InternationalPhoneField(
            name: 'phone',
            // margin: EdgeInsets.all(4),
            decorationField: DecorationField(
              labelText: context.localText.phoneNumber,
              hintText: context.localText.hintLoginPhoneNumber,
              hintStyle: context.bodyM,
              fillBackgroundColor: true,
              backgroundColor: AppColors.baseColor.withOpacity(.4),
              contentPadding: EdgeInsets.zero,
              isBorder: false,
              radiusBorder: kRadiusSmall,
              prefixIcon: const Icon(
                IconlyLight.call,
                color: AppColors.baseColor,
              ),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.notZeroNumber(errorText: context.localText.validator_field_phone_length_title),
            ]),
          ),
        ],
        (context.sizeSide.smallSide * .03).ph,
      ],
    );
  }
}
