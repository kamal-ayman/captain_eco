import 'dart:io';
import 'package:captain_eco/core/routing/app_router.dart';
import 'package:captain_eco/core/utils/dependency_injection.dart';
import 'package:captain_eco/core/routing/init_route.dart';
import 'package:captain_eco/core/utils/setup_fcm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../firebase_options.dart';
import 'shared_preferences.dart';

class SetupCaptainEco {
  static Future<void> setup() async {
    WidgetsFlutterBinding.ensureInitialized();
    await MySharedPreferences.init();
    await InitRoute.init();
    ServicesLocator.init();
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => FCMSetup.setupFCM());
    await ScreenUtil.ensureScreenSize();
  }
}
