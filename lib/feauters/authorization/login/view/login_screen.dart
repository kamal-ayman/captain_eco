import 'package:captain_eco/core/helpers/extensions.dart';
import 'package:captain_eco/core/routing/routes.dart';
import 'package:captain_eco/core/theme/eco_taxi_locales.dart';
import 'package:captain_eco/core/translations/appLanguage.dart';
import 'package:captain_eco/core/widgets/custom_material_button.dart';
import 'package:captain_eco/feauters/authorization/login/data/model/login_request_body.dart';
import 'package:captain_eco/feauters/authorization/login/logic/login_state.dart';
import 'package:captain_eco/feauters/authorization/login/view/widgets/phone_password_text_form_widget.dart';
import 'package:captain_eco/feauters/authorization/login/view/widgets/select_language_widget.dart';
import 'package:captain_eco/feauters/authorization/login/view/widgets/terms_and_conditions_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 20.h, left: 10.h, right: 10.h),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectLanguageWidget(),
                  Image.asset(
                    'assets/app_icon/launcher_icon.png',
                    width: 70.w,
                    height: 70.h,
                  ),
                ],
              ),
            ),
            Gap(120.h),
            Column(
              children: [
                PhonePasswordTextFormWidget(),
                Gap(20.h),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                      alignment: AppLanguage.languageCode == 'ar'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        'forget_password'.tr,
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp),
                      )),
                ),
                Gap(30.h),
                CustomMaterialButton(
                  // isLoading: state is Loading,
                  // onTap: () => validateAndLogin(context),
                  text: 'Login'.tr,
                  textColor: Colors.black,
                  buttonColor: Colors.lightBlue, onTap: () {},
                ),
                Gap(20.h),
                RichText(
                  textAlign: TextAlign.center,
                  text:
                      TextSpan(style: const TextStyle(height: 1.5), children: [
                    TextSpan(
                        text: 'You do not have account ?  '.tr,
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                      text: 'Register Now'.tr,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 0, 94, 255),
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushReplacementNamed(Routes.registerScreen);
                        },
                    ),
                  ]),
                ),
                Gap(100.h),
                TermsAndConditionsText(),
              ],
            ),
          ]),
        ),
      ),
    ));
  }

  // void validateAndLogin(BuildContext context) async {
  //   var cubit = context.read<LoginCubit>();
  //   if (cubit.formKey.currentState!.validate()) {
  //     cubit.emitLoginStates(
  //       LoginRequestBody(
  //         phone: cubit.phoneController.text,
  //         password: cubit.passwordController.text,
  //         deviceToken: null,
  //         latitude: null,
  //         longitude: null,
  //       ),
  //     );
  //   }
  // }
}
