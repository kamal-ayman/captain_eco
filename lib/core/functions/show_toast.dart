import 'package:captain_eco/core/theme/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> toastShow(
  String text, {
  bool translate = false,
  States state = States.success,
}) async {
  // Translation? translation;
  // if (translate) {
  //   translation = await GoogleTranslator().translate(text, to: 'ar');
  // }
  return Fluttertoast.showToast(
      msg: translate ? 'translation!.text' : text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum States { success, error, warning }

chooseToastColor(States state) {
  if (state == States.success) {
    return Colors.green;
  } else if (state == States.error) {
    return Colors.red;
  } else if (state == States.warning) {
    return Colors.amber;
  }
  const Map<States, Color> toastColors = {
    States.success: LightColorsManager.primary,
    States.warning: Colors.amber,
    States.error: Colors.red,
  };
  return toastColors[state];
}
