import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebasesample/pushnotification/push_notification_service.dart';

class PushNotificationScreen extends StatefulWidget {
  static const String routeName = "PushNotificationScreen";

  @override
  _PushNotificationScreenState createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(child: Center(child: Column(
          children: <Widget>[
            Text("Base"),
            RaisedButton(onPressed: (){
              _firebaseMessaging.getToken().then((va) {
                print(va);
              });
            })
          ],
        ),),),
      ),
    );
  }
}
