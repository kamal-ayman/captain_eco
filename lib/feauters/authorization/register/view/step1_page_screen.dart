import 'package:captain_eco/core/theme/light_colors.dart';
import 'package:captain_eco/core/widgets/custom_drop_down_button.dart';
import 'package:captain_eco/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Step1PageScreen extends StatefulWidget {
  const Step1PageScreen({super.key});

  @override
  State<Step1PageScreen> createState() => _Step1PageScreenState();
}

class _Step1PageScreenState extends State<Step1PageScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phome = TextEditingController();
  String _selectedCar = 'Select your car'.tr;
  String _selectedCity = 'Select your city'.tr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 255, 255, 255),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(right: 10.h),
                alignment: Alignment.centerRight,
                child: Text('name'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ))),
            Gap(5.h),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 55.h,
              decoration: BoxDecoration(
                color: LightColorsManager.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: LightColorsManager.greyShade300,
                    offset: const Offset(0, 1.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: CustomTextFormField(
                controller: _name,
                hintText: 'Enter your name'.tr,
              ),
            ),
            Gap(15.h),
            Container(
                padding: EdgeInsets.only(right: 10.h),
                alignment: Alignment.centerRight,
                child: Text('email'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ))),
            Gap(5.h),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 55.h,
              decoration: BoxDecoration(
                color: LightColorsManager.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: LightColorsManager.greyShade300,
                    offset: const Offset(0, 1.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: CustomTextFormField(
                controller: _email,
                hintText: 'Enter your email'.tr,
              ),
            ),
            Gap(15.h),
            Container(
                padding: EdgeInsets.only(right: 10.h),
                alignment: Alignment.centerRight,
                child: Text('phone number'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ))),
            Gap(5.h),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 55.h,
              decoration: BoxDecoration(
                color: LightColorsManager.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: LightColorsManager.greyShade300,
                    offset: const Offset(0, 1.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: CustomTextFormField(
                controller: _phome,
                hintText: 'Enter your phone'.tr,
              ),
            ),
            Gap(15.h),
            Container(
                padding: EdgeInsets.only(right: 10.h),
                alignment: Alignment.centerRight,
                child: Text('car model'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ))),
            Gap(5.h),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 55.h,
              decoration: BoxDecoration(
                color: LightColorsManager.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: LightColorsManager.greyShade300,
                    offset: const Offset(0, 1.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: CustomDropdownButton(
                width: double.infinity,
                text: 'Choose your car'.tr,
                value: _selectedCar,
                onChanged: (value) {
                  setState(() {
                    _selectedCar = value!;
                  });
                },
                items: [
                  CustomDropdownMenuItem(
                    text: 'Select your car'.tr,
                    value: 'Select your car'.tr,
                  ),
                  CustomDropdownMenuItem(
                    text: 'BMW',
                    value: 'BMW',
                  ),
                  CustomDropdownMenuItem(
                    text: 'BYD',
                    value: 'BYD',
                  ),
                  CustomDropdownMenuItem(
                    text: 'KIA',
                    value: 'KIA',
                  )
                ],
              ),
            ),
            Gap(15.h),
            Container(
                padding: EdgeInsets.only(right: 10.h),
                alignment: Alignment.centerRight,
                child: Text('city'.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ))),
            Gap(5.h),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 55.h,
              decoration: BoxDecoration(
                color: LightColorsManager.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: LightColorsManager.greyShade300,
                    offset: const Offset(0, 1.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: CustomDropdownButton(
                width: double.infinity,
                text: 'Choose your car'.tr,
                value: _selectedCity,
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value!;
                  });
                },
                items: [
                  CustomDropdownMenuItem(
                    text: 'Select your city'.tr,
                    value: 'Select your city'.tr,
                  ),
                  CustomDropdownMenuItem(
                    text: 'Baghdad',
                    value: 'Baghdad',
                  ),
                  CustomDropdownMenuItem(
                    text: 'Babel',
                    value: 'Babel',
                  ),
                  CustomDropdownMenuItem(
                    text: 'Erbil',
                    value: 'Erbil',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
