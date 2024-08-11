

import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationViewModel {

  // FirebaseMessaging messaging = Fire
  FirebaseMessaging messaging = FirebaseMessaging.instance;


  /// request notification permission
  void requestNotificationPermission() async {

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("User granyted permission");
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional) {
      print("User granyted provisional permission");
    }else{
      print("User denied permission");
    }

  }


  /// get device token
  Future<String> getDeviceToken() async {

    String? token = await messaging.getToken();
    return token!;

  }


  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }


}