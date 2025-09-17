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
import '../../../../common/image_widget.dart';

class IdMailAddress extends StatelessWidget {
  const IdMailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // GenericTextField(
        //   name: 'identity_number',
        //   initialValue: UserService.currentUser?.identityNumber,
        //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        //   textType: TextInputType.number,
        //   validator: FormBuilderValidators.compose([
        //     FormBuilderValidators.required(errorText: context.localText.validator_field_required_title),
        //     // FormBuilderValidators.equalLength(10),
        //   ]),
        //   decorationField: DecorationField(
        //     labelText: context.localText.idNumber,
        //     hintText: context.localText.idNumber,
        //     hintStyle: context.bodyM,
        //     prefixIcon: IconButton(icon: ImageWidget(image: Assets.icons.identity), onPressed: null),
        //     fillBackgroundColor: true,
        //     isBorder: false,
        //     contentPadding: const EdgeInsets.symmetric(vertical: 12),
        //     radiusBorder: kRadiusSmall,
        //   ),
        // ),
        // (context.sizeSide.smallSide * .03).ph,
        GenericTextField(
          name: 'email',
          initialValue: UserService.currentUser?.email,
          textType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(errorText: context.localText.validator_field_required_title),
            FormBuilderValidators.email(),
          ]),
          decorationField: DecorationField(
            labelText: context.localText.email,
            hintText: context.localText.hintEmail,
            hintStyle: context.bodyM,
            prefixIcon: IconButton(icon: ImageWidget(image: Assets.icons.sms), onPressed: null),
            fillBackgroundColor: true,
            isBorder: false,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            radiusBorder: kRadiusSmall,
          ),
        ),
        (context.sizeSide.smallSide * .03).ph,
        GenericTextField(
          name: 'address',
          // initialValue: UserService.currentUser?.address,
          textType: TextInputType.text,
          autofillHints: const [
            AutofillHints.addressCity,
            AutofillHints.addressCityAndState,
            AutofillHints.addressState,
          ],
          validator: FormBuilderValidators.required(errorText: context.localText.validator_field_required_title),
          decorationField: DecorationField(
            labelText: context.localText.address,
            hintText: context.localText.hintAddress,
            hintStyle: context.bodyM,
            fillBackgroundColor: true,
            isBorder: false,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            radiusBorder: kRadiusSmall,
            prefixIcon: const Icon(
              IconlyLight.location,
              color: AppColors.baseColor,
            ),
          ),
        ),
        (context.sizeSide.smallSide * .03).ph,
      ],
    );
  }
}
