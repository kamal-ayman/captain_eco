import 'package:captain_eco/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          Container(
            width: double.infinity,
            height: 150.h,
            child: Image.asset(
              'assets/images/pexels-ingo-13781.jpg',
              fit: BoxFit.cover,
              opacity: AlwaysStoppedAnimation(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90, top: 60),
            child: Text(
              'Create New Account'.tr,
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
        Gap(20.h),
        CustomTextFormField(controller: _name)
      ],
    ));
  }
}
