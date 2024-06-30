import 'package:captain_eco/core/helpers/app_regex.dart';
import 'package:captain_eco/core/theme/styles.dart';
import 'package:captain_eco/core/widgets/custom_text_form_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class PhonePasswordTextFormWidget extends StatefulWidget {
  const PhonePasswordTextFormWidget({super.key});

  @override
  State<PhonePasswordTextFormWidget> createState() => _PhonePasswordTextFormWidgetState();
}

class _PhonePasswordTextFormWidgetState extends State<PhonePasswordTextFormWidget> {
   final TextEditingController passwordController = TextEditingController();
   final TextEditingController phoneController = TextEditingController();


  bool obscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    // passwordController = context.read<LoginCubit>().passwordController;
    // setupPasswordControllerListener();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = context.read<LoginCubit>();
    return Column(
      children: [
        Form(
          // key: cubit.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                elevation: 1.h,
                prefixWidget: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 1.h, 18.h, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'phone'.tr + ' ',
                        style: TextStyles.grey14regular,
                      ),
                      Text(
                        '+964',
                        style: TextStyles.primary14regular,
                      ),
                    ],
                  ),
                ),
                hintText: 'xxxxxx',
                controller: phoneController,
                validator: (value) {
                  // ignore: dead_code
                  if ((value == null || value.isEmpty || value.length != 10) && false) {
                    return 'incorrect phone number'.tr;
                  }
                  return null;
                },
              ),
              Gap(20.h),
              CustomTextFormField(
                elevation: 1.h,

                controller: passwordController,
                // hintText: 'كلمة السر',
                prefixWidget: Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 10.h, 18.h, 0.0),
                  child: Text(
                    'password'.tr,
                    style: TextStyles.grey14regular,
                  ),
                ),
                obscureText: obscureText,
                suffixIcon: obscureText ? Icons.visibility_off : Icons.visibility,
                suffixIconOnPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (val) {
                  print(val);
                },
                validator: (val) {
                  //  !AppRegex.isPasswordValid(val)
                  if (val == null || val.isEmpty && false) {
                    return 'incorrect password'.tr;
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        // Gap(20),
        // PasswordValidationWidget(
        //   hasLowerCase: hasLowerCase,
        //   hasUpperCase: hasUpperCase,
        //   hasSpecialCharacters: hasSpecialCharacters,
        //   hasNumber: hasNumber,
        //   hasMinLength: hasMinLength,
        // ),
      ],
    );
  }
}
