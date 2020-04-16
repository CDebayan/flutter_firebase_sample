import 'package:flutter/material.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_service.dart';

class PushNotificationScreenOne extends StatelessWidget {
  static const String routeName = "PushNotificationScreenOne";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("One"),
        ),
      ),
    );
  }
}
