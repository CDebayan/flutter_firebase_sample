import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_screen_one.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_screen_two.dart';
import 'package:flutterfirebasesample/widgets/widgets.dart';
import '../main.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }
    _fcm.configure(
      // When the app is open and it receives a push notification
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showNotification();
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
    );
  }

  void _handleRemoteMessage(
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

  void showNotification() async{
    flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        AndroidInitializationSettings('mipmap/ic_launcher'),
        IOSInitializationSettings(),
      ),
    );

    var android = new AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
      "channelDescription",
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, "This is title", "this is demo", platform);
  }
}
