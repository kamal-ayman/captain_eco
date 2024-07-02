import 'package:captain_eco/core/theme/light_colors.dart';
import 'package:captain_eco/core/widgets/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          top: 30.h,
                          bottom: 10.h,
                          left: 10.h,
                          right: 10.h,
                        ),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/closeup-shot-taxi-sign-placed.jpg",
                              ),
                              fit: BoxFit.cover),
                        ),
                        constraints: BoxConstraints.expand(height: 220.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomAppBar(pageTitle: ''),
                                Text(
                                  'الشروط والاحكام'.tr,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  child: Image.asset(
                                    'assets/app_icon/launcher_icon.png',
                                    height: 70.h,
                                    width: 70.w,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 15.h,
                          right: 10.h,
                          bottom: 10.h,
                        ),
                        margin: EdgeInsets.only(top: 150.h),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 600.h,
                              width: size.width,
                              child: getCardContainer(),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getCardContainer() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: 20.h,
        bottom: 20.h,
        right: 15.h,
        left: 15.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(0, 1.5),
            blurRadius: 7.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Column(
              children: [
                Text(
                  'بموافقتك على الشروط والاحكام فانت تقبل شروط و احكام البرنامج.'
                      .tr,
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  'بموافقتك على الشروط والاحكام فانت تقبل شروط و احكام البرنامج.'
                      .tr,
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  'بموافقتك على الشروط والاحكام فانت تقبل شروط و احكام البرنامج.'
                      .tr,
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  'بموافقتك على الشروط والاحكام فانت تقبل شروط و احكام البرنامج.'
                      .tr,
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  'بموافقتك على الشروط والاحكام فانت تقبل شروط و احكام البرنامج.'
                      .tr,
                  style: TextStyle(fontSize: 15.sp),
                ),
                Text(
                  'بموافقتك على الشروط والاحكام فانت تقبل شروط و احكام البرنامج.'
                      .tr,
                  style: TextStyle(fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
