import 'package:captain_eco/core/helpers/extensions.dart';
import 'package:captain_eco/core/theme/light_colors.dart';
import 'package:flutter/material.dart';

import '../translations/appLanguage.dart';


class CustomBackButton extends StatelessWidget {
  final void Function()? onTap;

  const CustomBackButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap ?? () => context.pop(),
      icon: Icon(
        !AppLanguage.isArabic ? Icons.arrow_forward : Icons.arrow_back,
        size: 20,
        color: LightColorsManager.black,
      ),
    );
  }
}
