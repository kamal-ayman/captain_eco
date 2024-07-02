import 'package:captain_eco/core/theme/light_colors.dart';
import 'package:captain_eco/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Step2PageScreen extends StatefulWidget {
  const Step2PageScreen({super.key});

  @override
  State<Step2PageScreen> createState() => _Step2PageScreenState();
}

class _Step2PageScreenState extends State<Step2PageScreen> {
  TextEditingController _licence = TextEditingController();
  TextEditingController _carlicence = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 60.h,
        ),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(right: 20.h),
                alignment: Alignment.centerRight,
                child: Text('رخصة السائق'.tr,
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
                controller: _licence,
                hintText: 'enter your licence'.tr,
              ),
            ),
            Gap(20.h),
            Container(
              width: double.infinity,
              height: 135.h,
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5.h,
                  color: Colors.blueAccent,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      ImagePicker().pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: Image.asset(
                      'assets/images/picture.png',
                      width: 60.w,
                      height: 60.h,
                    ),
                  ),
                  Gap(15.h),
                  Text('select your lincence picture'.tr)
                ],
              ),
            ),
            Gap(20.h),
            Container(
                padding: EdgeInsets.only(right: 20.h),
                alignment: Alignment.centerRight,
                child: Text('رخصة السيارة'.tr,
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
                controller: _carlicence,
                hintText: 'enter your car licence'.tr,
              ),
            ),
            Gap(20.h),
            Container(
              width: double.infinity,
              height: 135.h,
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5.h,
                  color: Colors.blueAccent,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      ImagePicker().pickImage(source: ImageSource.gallery);
                      setState(() {});
                    },
                    child: Image.asset(
                      'assets/images/picture.png',
                      width: 60.w,
                      height: 60.h,
                    ),
                  ),
                  Gap(15.h),
                  Text('select car lincence picture'.tr)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
