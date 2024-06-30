import 'package:captain_eco/core/translations/appLanguage.dart';
import 'package:captain_eco/core/widgets/custom_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class SelectLanguageWidget extends StatefulWidget {
  const SelectLanguageWidget({super.key});

  @override
  State<SelectLanguageWidget> createState() => _SelectLanguageWidgetState();
}

class _SelectLanguageWidgetState extends State<SelectLanguageWidget> {
  String _selectedValue = 'ar';

  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton(
      icon: Row(
        children: [
          Icon(Icons.arrow_drop_down),
          Icon(
            Icons.language_outlined,
            color: Colors.green,
            size: 23.sp,
          ),
        ],
      ),
      value: _selectedValue,
      onChanged: (value) {
        setState(() {
          _selectedValue = value!;
          AppLanguage().changeLanguage(value);
        });
      },
      text: '',
      items: [
        CustomDropdownMenuItem(
          text: 'عربي',
          value: 'ar',
        ),
        CustomDropdownMenuItem(
          text: 'English',
          value: 'en',
        ),
        CustomDropdownMenuItem(
          text: 'Kurdish',
          value: 'ku',
        )
      ],
    );
  }
}
