import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_screen.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_screen_one.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_screen_two.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_service.dart';
import 'package:flutterfirebasesample/upload_file/upload_image_screen.dart';
import 'package:flutterfirebasesample/widgets/widgets.dart';
import 'crud/note_list_screen.dart';
import 'home_page_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePageScreen.routeName,
      routes: {
        HomePageScreen.routeName: (context) => HomePageScreen(),
        NoteListScreen.routeName : (context)=> NoteListScreen(),
        UploadImageScreen.routeName : (context)=> UploadImageScreen(),
        PushNotificationScreen.routeName: (context) => PushNotificationScreen(),
        PushNotificationScreenOne.routeName: (context) => PushNotificationScreenOne(),
        PushNotificationScreenTwo.routeName: (context) => PushNotificationScreenTwo(),
      },
    );
  }



}
