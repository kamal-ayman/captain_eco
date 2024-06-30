import 'package:captain_eco/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(height: 1.5),
          children: [
            TextSpan(
                text: 'by_logging_you_agree_to_our'.tr + ' ',
                style: TextStyles.black13regular),
            TextSpan(
                text: 'terms_and_conditions'.tr, style: TextStyles.primary13semiBold),
            TextSpan(text: ' ' + 'and'.tr + ' ', style: TextStyles.black13regular),
            TextSpan(
                text: 'privacy_policy'.tr + ' ', style: TextStyles.primary13semiBold),
          ],
        ));
  }
}
