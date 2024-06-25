import 'dart:convert';
import 'package:captain_eco/core/utils/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/api_constance.dart';

class CacheHelper {
  static const _secureStorage = FlutterSecureStorage();

  // static Future<void> saveUserDataLogin(UserDataLogin user) async {
  //   String encodeJsonData = json.encode(user.toJson());
  //   await setSecureToken(user.token!);
  //   ApiConstance.token = user.token;
  //   user.token = 'encrypted ;)';
  //   await MySharedPreferences.setData('userData', encodeJsonData);
  //   await setPhone(user.phone!);
  // }

  // static Future<void> saveUserDataOTP(UserDataOtp user) async {
  //   await setSecureToken(user.token!);
  //   ApiConstance.token = user.token;
  //   user.token = 'encrypted ;)';
  //   String encodeJsonData = json.encode(user.toJson());
  //   await MySharedPreferences.setData('userData', encodeJsonData);
  //   await saveIsCompleteProfile(false);
  // }

  // static Future<void> saveUserDataProfile(UserDataProfile user) async {
  //   print('user.token: ${ApiConstance.token}');
  //   await setSecureToken(ApiConstance.token!);
  //   user.token = 'encrypted ;)';
  //   String encodeJsonData = json.encode(user.toJson());
  //   await MySharedPreferences.setData('userData', encodeJsonData);
  //   await saveIsCompleteProfile(true);
  // }

  // static Future<UserDataLogin?> getUserData() async {
  //   final cachedUserData = MySharedPreferences.getData('userData');
  //   Map<String, dynamic> decodeJsonData = json.decode(cachedUserData);
  //   UserDataLogin? user = UserDataLogin.fromJson(decodeJsonData);
  //   user.token = await getSecureToken();
  //   return user;
  // }

  // get phone
  static Future<String> getPhone() async => await MySharedPreferences.getData('phone') ?? '';

  static Future<void> setPhone(String phone) async => await MySharedPreferences.setData('phone', phone);

  static Future<void> saveIsCompleteProfile(bool state) async => await MySharedPreferences.setData('isCompleteProfile', state);

  static Future<bool?> getIsCompleteProfile() async => await MySharedPreferences.getData('isCompleteProfile');

  // set secure token
  static Future<void> setSecureToken(String token) async {
    await _secureStorage.write(key: 'token', value: token);
  }

  static Future<void> setSecurePassword(String password) async {
    await _secureStorage.write(key: 'password', value: password);
  }

  // get secure token
  static Future<String?> getSecureToken() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'token');
  }

  static Future<String> getSecurePassword() async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'password') ?? '';
  }

  static Future<bool> saveLanguageApp(String language) async => await MySharedPreferences.setData('lang', language);

  static Future<String?> getLanguageApp() async => await MySharedPreferences.getData('lang');

  static Future<void> clearUserData() async => await Future.wait([
      MySharedPreferences.removeData('userData'),
      MySharedPreferences.removeData('isCompleteProfile'),
      _secureStorage.delete(key: 'token'),
      _secureStorage.delete(key: 'password'),
    ]);

// static Future<List<Rocket>> getCachedRocketsData() async {
//   final cachedRockets = MySharedPreferences.getString('cachedRockets');
//   List<Rocket> rockets = [];
//   if (cachedRockets.isNotEmpty) {
//     List decodeJsonData = json.decode(cachedRockets);
//     rockets = decodeJsonData
//         .map(
//           (jsonRockets) => Rocket.fromJson(jsonRockets),
//         )
//         .toList();
//   }
//   return rockets;
// }
//
// static cacheLaunchPadData(List<LaunchPad> launchPads) async {
//   String encodeJsonData = json.encode(
//     launchPads
//         .map(
//           (launchPads) => launchPads.toJson(),
//         )
//         .toList(),
//   );
//   await MySharedPreferences.setString(
//     'cachedLaunchPads',
//     encodeJsonData,
//   );
// }
//
// static Future<List<LaunchPad>> getCachedLaunchPadData() async {
//   final cachedLaunchPads = MySharedPreferences.getString('cachedLaunchPads');
//   List<LaunchPad> launchPads = [];
//   if (cachedLaunchPads.isNotEmpty) {
//     List decodeJsonData = json.decode(cachedLaunchPads);
//     launchPads = decodeJsonData
//         .map(
//           (jsonLaunchPads) => LaunchPad.fromJson(jsonLaunchPads),
//         )
//         .toList();
//   }
//   return launchPads;
// }
//
// static cacheProfileData(UserModel userModel) async {
//   String encodeJsonData = json.encode(userModel.toMap());
//   await MySharedPreferences.setString(
//     'cachedProfileData',
//     encodeJsonData,
//   );
// }
//
// static Future<UserModel?> getCachedProfileData() async {
//   final cachedPosts = MySharedPreferences.getString('cachedProfileData');
//   UserModel? userModel;
//   if (cachedPosts.isNotEmpty) {
//     Map<String, dynamic> decodeJsonData = json.decode(cachedPosts);
//     userModel = UserModel.fromJson(decodeJsonData);
//   }
//   return userModel;
// }
}
