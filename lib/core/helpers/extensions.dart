import 'package:captain_eco/core/functions/show_snackbar.dart';
import 'package:flutter/material.dart';

import '../functions/show_toast.dart';

extension AddStringExt on String {
  int get toInt => int.parse(this);
}

// extension Spacing on int {
//   SizedBox get verticalSpace => SizedBox(height: this.h);
//   SizedBox get horizontalSpace => SizedBox(width: this.w);
// }

extension Context on BuildContext {
  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }

  double get getHeight => MediaQuery.of(this).size.height;

  double get getWidth => MediaQuery.of(this).size.width;

  double get getTop => MediaQuery.of(this).padding.top;

  double get getBottom => MediaQuery.of(this).padding.bottom;

  TextTheme get textTheme => Theme.of(this).textTheme;

  // showSnackBar
  dynamic showSnackBar(String message, {States state = States.success, String? title}) async => customShowSnackBar(message, state: state, title: title);
}

extension Validator on String {
  bool get isValidEmail {
    return RegExp(r'\S+@\S+\.\S+').hasMatch(this);
  }
  
  bool get isValidPassword {
    if (length == 11) {
      return RegExp(r'(010|011|012|015)[0-9]{8}').hasMatch(this);
    }
    return true;
  }

  bool get isValidPhoneNumber {
    if (length == 11) {
      return RegExp(r'(010|011|012|015)[0-9]{8}').hasMatch(this);
    }
    return false;
  }

  bool get isValidArName => RegExp(r'^[ا-ي]+\s[ا-ي]+\s[ا-ي]+').hasMatch(this);


}
