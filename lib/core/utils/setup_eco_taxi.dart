import 'dart:io';
import 'package:captain_eco/core/routing/app_router.dart';
import 'package:captain_eco/core/utils/dependency_injection.dart';
import 'package:captain_eco/core/routing/init_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../firebase_options.dart';
import 'shared_preferences.dart';

class SetupEcoTaxi {
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await MySharedPreferences.init();
    await InitRoute().init();
    ServicesLocator().init();
    await ScreenUtil.ensureScreenSize();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }
}
