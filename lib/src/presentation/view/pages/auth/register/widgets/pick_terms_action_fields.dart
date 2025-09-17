/* // Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

// Project imports:
import '../../../../../../core/config/app_colors.dart';
import '../../../../../../core/services/setting_service.dart';
import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/utils/api_info.dart';
import '../../../../../../core/utils/constant.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../core/utils/extension.dart';
import '../../../../../../domain/entities/policy_model.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_event.dart';
import '../../../../../view_model/blocs/data_bloc/api_data_state.dart';
import '../../../../common/fields/_field_helper/decoration_field.dart';
import '../../../../common/fields/checkbox_form_field.dart';
import '../../../../common/fields/generic_text_field.dart';
import '../../../../common/popup/bottom_sheet.dart';
import '../../../../common/text_widget.dart';

class PickTermsActionFields extends StatelessWidget {
  const PickTermsActionFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const PicksFiles(),
        // (context.sizeSide.smallSide * .02).ph,
        if (UserService.currentUser == null)
          CheckboxFormField(
            name: 'terms_and_condition',
            decorationField: DecorationField(isBorder: false, radiusBorder: kRadiusSmall),
            title: TextWidget(
              text: context.localText.termsAndConditions,
              style: context.bodyM?.copyWith(decoration: TextDecoration.underline, decorationColor: AppColors.baseColor),
              onClick: () {
                customBottomSheet(
                  context: context,
                  padding: EdgeInsets.zero,
                  height: context.sizeSide.largeSide * .7,
                  portraitOnly: true,
                  canClose: false,
                  systemUiOverlayStyle: SettingService().theme.copySystemUiOverlayStyle(
                        systemNavigationBarColor: AppColors.cardPrimaryColor,
                      ),
                  builder: (context, constraints) {
                    return BodyTermsBottomSheet(constraints: constraints);
                  },
                );
              },
            ),
            activeColor: AppColors.secondaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadiusSmall * .4)),
            side: const BorderSide(
              color: AppColors.baseColor,
              width: 2,
            ),
            validator: FormBuilderValidators.equal(true, errorText: context.localText.validator_field_terms_title),
          ),
        if (UserService.currentUser == null) ...[
          Offstage(
            child: GenericTextField(name: 'device_type', initialValue: context.deviceName),
          ),
          // Offstage(
          //   child: GenericTextField(name: 'device_token', initialValue: injector<FcmService>().fcmToken ?? 'null'),
          // ),
        ],
        // (context.sizeSide.smallSide * .06).ph,
      ],
    );
  }
}

 */