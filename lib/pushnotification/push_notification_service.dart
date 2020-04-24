import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_screen_one.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_screen_two.dart';
import 'package:flutterfirebasesample/widgets/widgets.dart';
import '../main.dart';


class PushNotificationService {
  static FirebaseMessaging _fcm = FirebaseMessaging();
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
    showNotification(message);
  }

  static Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    _fcm.configure(
      // When the app is open and it receives a push notification
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showNotification(message);
        _handleRemoteMessage("onMessage", message);
      },
      // When the app is completely closed (not in the background) and opened directly from the push notification
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        _handleRemoteMessage("onLaunch", message);
      },
      // When the app is in the background and opened directly from the push notification
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        _handleRemoteMessage("onResume", message);
      },
      onBackgroundMessage: myBackgroundMessageHandler,
    );
  }

  static void _handleRemoteMessage(
      String message, Map<String, dynamic> remoteMessage) {
    showToast(message);
    if (remoteMessage['data'] != null) {
      if (remoteMessage['data']['view'] != null) {
        if (remoteMessage['data']['view'] == "one") {
          MyApp.navKey.currentState
              .pushNamed(PushNotificationScreenOne.routeName);
        } else if (remoteMessage['data']['view'] == "two") {
          MyApp.navKey.currentState
              .pushNamed(PushNotificationScreenTwo.routeName);
        }
      }
    }
  }

  static void showNotification(Map<String, dynamic> message) async {

    flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        AndroidInitializationSettings('mipmap/ic_launcher'),
        IOSInitializationSettings(),
      ),
    );

    var android = new AndroidNotificationDetails(
      'CHANNEL ID',
      "CHANNLE NAME",
      "channelDescription",
      priority: Priority.High
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);

    var title = message['data']['title'];
    var body = message['data']['body'];

    await flutterLocalNotificationsPlugin.show(0, title, body, platform);
  }
}
