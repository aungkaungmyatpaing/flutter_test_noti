import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_noti/main.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  //create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  // function to initialize notification
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final FCMToken = await _firebaseMessaging.getToken();

    debugPrint('FCM TOKEN : $FCMToken');
  }

  //function to handl received message
  void handleMessages(RemoteMessage? message) {
    debugPrint(message.toString());
    if (message == null) return;
    navigationKey.currentState!.pushNamed('/notification_screen');
  }

  //function to initi forground and background message
  void initPushNotification() {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessages);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }
}
