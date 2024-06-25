import 'package:captain_eco/core/network/api_constance.dart';
import 'package:captain_eco/core/routing/routes.dart';
import 'package:captain_eco/core/utils/cache_helper.dart';

class InitRoute {
  static late final String initialRoute;

  Future<void> init() async {
    /// TODO: ---- start from here ----
    // initialRoute = Routes.loginScreen;
    return;
    final bool? isCompleteProfile = await CacheHelper.getIsCompleteProfile();
    if (isCompleteProfile == null) {
      initialRoute = Routes.loginScreen;
      return;
    }
    ApiConstance.token = await CacheHelper.getSecureToken();
    if (!isCompleteProfile) {
      initialRoute = Routes.profileScreen;
      return;
    }
    if (isCompleteProfile) {
      initialRoute = Routes.homeScreen;
      return;
    }
  }
}
