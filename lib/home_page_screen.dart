import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasesample/crud/note_list_screen.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_screen.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_service.dart';
import 'package:flutterfirebasesample/upload_file/upload_image_screen.dart';
import 'package:flutterfirebasesample/widgets/widgets.dart';

class HomePageScreen extends StatelessWidget {
  static const String routeName = "HomePageScreen";
  @override
  Widget build(BuildContext context) {
    PushNotificationService().initialise();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 16, right: 16),
          children: <Widget>[
            button('CRUD', () {
              Navigator.pushNamed(context, NoteListScreen.routeName);
            }),
            button('UPLOAD IMAGE', () {
              Navigator.pushNamed(context, UploadImageScreen.routeName);
            }),
            button('PUSH NOTIFICATION', () {
              Navigator.pushNamed(context, PushNotificationScreen.routeName);
            })
          ],
        ),
      ),
    );
  }
}
