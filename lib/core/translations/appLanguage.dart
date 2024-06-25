import 'dart:ui';
import 'package:captain_eco/core/utils/cache_helper.dart';
import 'package:get/get.dart';

class AppLanguage extends GetxController {
  static String languageCode = 'ar';
  static TextDirection currentTextDirection = TextDirection.rtl;
  static bool isArabic = true;


  @override
  Future<void> onInit() async {
    super.onInit();
    languageCode = (await CacheHelper.getLanguageApp()) ?? 'ar';
    if (languageCode == 'ar' || languageCode == 'ku') {
      currentTextDirection = TextDirection.rtl;
      isArabic = true;
    } else {
      currentTextDirection = TextDirection.ltr;
      isArabic = false;
    }
    Get.updateLocale(Locale(languageCode));
    update();
  }

  Future<void> changeLanguage(String value) async {
    languageCode = value;
    await CacheHelper.saveLanguageApp(languageCode);
    if (languageCode == 'ar' || languageCode == 'ku') {
      currentTextDirection = TextDirection.rtl;
      isArabic = true;
    } else {
      currentTextDirection = TextDirection.ltr;
      isArabic = false;
    }
    Get.updateLocale(Locale(languageCode));
    update();
  }
}
