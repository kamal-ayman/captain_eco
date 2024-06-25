import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/light_colors.dart';
import 'show_toast.dart';

customShowSnackBar(String message, {States state = States.success, String? title}) {
  Map<States, Color> selectColor = {
    States.success: LightColorsManager.primary,
    States.warning: Colors.amber.shade900,
    States.error: LightColorsManager.red,
  };
  Map<States, String> selectMessage = {
    States.success: 'success'.tr,
    States.warning: 'warning'.tr,
    States.error: 'error'.tr,
  };
  title ??= selectMessage[state];
  return Get.snackbar(
    title!,
    message,
    backgroundColor: selectColor[state],
    colorText: Colors.white,
  );
}