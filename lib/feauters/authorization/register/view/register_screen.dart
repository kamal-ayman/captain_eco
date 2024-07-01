import 'package:captain_eco/core/helpers/extensions.dart';
import 'package:captain_eco/core/routing/routes.dart';
import 'package:captain_eco/core/widgets/custom_text_form_field.dart';
import 'package:captain_eco/feauters/authorization/login/view/login_screen.dart';
import 'package:captain_eco/feauters/authorization/register/view/step1_page_screen.dart';
import 'package:captain_eco/feauters/home/view/home_page_screen.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _name = TextEditingController();
  int counter = 0;
  ScrollController scrollController = ScrollController();
  // List<Widget> widgets = [LoginScreen()];
  var boardController = PageController();
  bool isLastPage = false, canPressNextAndBack = true;
  bool canpop = true;
  String currentStep = 'Step 1/2';
  List<Segment> segments = [];
  List<Widget> pages = [LoginScreen(), HomePageScreen()];

  @override
  void initState() {
    currentStep = 'Step 1/2';
    segments = [
      Segment(
        valueLabel: Text(''),
        value: 50,
        color: Colors.blue,
        label: Text(
          currentStep.tr,
          style: TextStyle(fontSize: 15.sp),
        ),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final progressBar = PrimerProgressBar(
      segments: segments,
      maxTotalValue: 100,
    );

    return PopScope(
      canPop: canpop,
      onPopInvoked: (didPop) async {
        if (!canPressNextAndBack) canpop = false;
        if (counter > 0) {
          canPressNextAndBack = false;
          await boardController.previousPage(
            duration: const Duration(milliseconds: 750),
            curve: Curves.fastLinearToSlowEaseIn,
          );
          canPressNextAndBack = true;
          counter--;
          setState(() {});
          canpop = false;
        }
        canpop = true;
      },
      child: Scaffold(
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
                padding: const EdgeInsets.only(right: 100, top: 60),
                child: Text(
                  'create new account'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            progressBar,
            Stack(
              children: [
                Container(
                    width: double.infinity,
                    height: 599.h,
                    child: Step1PageScreen()),
                Padding(
                  padding: const EdgeInsets.only(top: 495, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton.extended(
                        elevation: 1,
                        backgroundColor:
                            canBack ? null : Color.fromARGB(82, 230, 223, 223),
                        heroTag: 'back'.tr,
                        onPressed: !canBack
                            ? null
                            : () {
                                if (currentStep == 'Step 1/2'.tr) {
                                  return;
                                }
                                segments.removeLast();
                                setState(() {
                                  currentStep = 'Step 1/2'.tr;
                                });
                              }, 
                        label: Row(
                          children: [
                            Icon(Icons.arrow_back),
                            Gap(10),
                            Text(
                              "back".tr,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                      FloatingActionButton.extended(
                        backgroundColor: Colors.blue.withOpacity(0.9),
                        heroTag: 'next',
                        onPressed: () {
                          if (canBack) {
                            context.pushNamed(Routes.step2PageScreen);
                            return;
                          } else {
                            context.pushNamed(Routes.homepageScreen);
                          }
                          setState(() {
                            segments.clear();
                            currentStep = 'Step 2/2'.tr;
                          });
                          segments.add(Segment(
                              value: 100,
                              valueLabel: Text(''),
                              color: Colors.blue,
                              label: Text(
                                "Step 2/2".tr,
                                style: TextStyle(fontSize: 15.sp),
                              )));

                          setState(() {});
                        },
                        label: Row(
                          children: [
                            Text(
                              getButtonLabel.tr,
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Gap(10),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool get canBack {
    return currentStep == 'Step 2/2'.tr;
  }

  String get getButtonLabel {
    return !canBack ? "next".tr : "done".tr;
  }
}
