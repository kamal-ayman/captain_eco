// ignore_for_file: must_be_immutable, file_names

import 'package:captain_eco/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final bool canBack;
  final String pageTitle;
  Color? titleColor;

  CustomAppBar({Key? key, required this.pageTitle, this.titleColor, this.canBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (canBack)
        InkWell(
          borderRadius: BorderRadius.circular(2.w),
          onTap: () => Navigator.pop(context),
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.w),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(0, 1.0),
                  blurRadius: 3.0,
                ),
              ],
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.grey,
              size: 25.w,
            ),
          ),
        ),
        CustomText(
          textAlign: TextAlign.center,
          text: pageTitle,
          fontSize: 18.h,
          fontweight: FontWeight.bold,
          color: titleColor ?? Colors.black,
          fontFamily: 'Tajawal',
        ),
        SizedBox(
          width: 30.w,
        ),
      ],
    );
  }
}
