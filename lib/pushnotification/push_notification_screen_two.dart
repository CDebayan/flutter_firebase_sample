import 'package:flutter/material.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_service.dart';

class PushNotificationScreenTwo extends StatelessWidget {
  static const String routeName = "PushNotificationScreenTwo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Two"),
        ),
      ),
    );
  }
}
