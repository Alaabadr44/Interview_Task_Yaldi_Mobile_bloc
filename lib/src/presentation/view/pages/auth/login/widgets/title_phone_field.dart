// Flutter imports:
import 'package:flutter/material.dart';

import '../../../../../../core/utils/extension.dart';

class TitlePhoneField extends StatelessWidget {
  const TitlePhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // (context.sizeSide.smallSide * .15).ph,
        (context.sizeSide.smallSide * .03).ph,
      ],
    );
  }
}
