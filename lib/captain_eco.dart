import 'package:captain_eco/core/routing/init_route.dart';
import 'package:captain_eco/core/theme/eco_taxi_locales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/eco_taxi_localization_delegates.dart';
import 'core/theme/light_colors.dart';
import 'core/translations/appLanguage.dart';
import 'core/translations/eco_taxi_translations.dart';

class CaptainEco extends StatelessWidget {
  final AppRouter appRouter;
  const CaptainEco({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: GetMaterialApp(
        localizationsDelegates: EcoTaxiLocalizationDelegates.delegates,
        supportedLocales: CaptianEcoLocales.locales,
        translations: CaptainEcoTranslations(),
        debugShowCheckedModeBanner: false,
        title: 'Captain Eco',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: LightColorsManager.primary),
          primaryColor: LightColorsManager.primary,
          scaffoldBackgroundColor: Color.fromARGB(248, 255, 255, 255),
        ),
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: InitRoute.initialRoute,
        locale: Locale(AppLanguage.languageCode),
      ),
    );
  }
}
