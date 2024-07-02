import 'package:captain_eco/core/helpers/extensions.dart';
import 'package:captain_eco/core/routing/routes.dart';
import 'package:captain_eco/core/theme/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(height: 5),
          children: [
            TextSpan(
                text: 'by_logging_you_agree_to_our'.tr + ' ',
                style: TextStyle(
                  color: Colors.black,
                )),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pushNamed(Routes.termsAndConditionsScreen);
                  },
                text: 'terms_and_conditions'.tr,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp)),
            TextSpan(
                text: ' ' + 'and'.tr + ' ',
                style: TextStyle(
                  color: Colors.black,
                )),
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.pushNamed(Routes.policyAndPrivacyScreen);
                  },
                text: 'privacy_policy'.tr + ' ',
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp)),
          ],
        ));
  }


}

