import 'package:captain_eco/core/network/api_constance.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FCMSetup {
  FCMSetup._();
  static Future<void> setupFCM() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print('Message data: ${message.data}');
    });

    FirebaseMessaging.instance.getToken().then((value) {
      ApiConstance.deviceToken = value;
      print('FCM Token: ${ApiConstance.deviceToken}');
    });
  }
 // _firebaseMessagingBackgroundHandler
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }
}