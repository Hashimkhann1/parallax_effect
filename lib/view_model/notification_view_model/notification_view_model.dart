

import 'dart:io';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:parallax_scroll/view/message_screen_view/message_screen_view.dart';

class NotificationViewModel {

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // FirebaseMessaging messaging = Fire
  FirebaseMessaging messaging = FirebaseMessaging.instance;


  /// show notification pop up
  Future<void> showNotification(RemoteMessage message) async {

    AndroidNotificationChannel channel = AndroidNotificationChannel(
        message.notification!.android!.channelId.toString(),
        message.notification!.android!.channelId.toString(),
      importance: Importance.high,
      showBadge: true,
      playSound: true
    );

    /// android setting

    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString(),
      channelDescription: "channel Description",
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
      sound: channel.sound,
      ticker: 'ticker',
      icon: '@mipmap/ic_launcher'
    );

    /// IOS setting

    const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true
    );

    /// marge setting
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails
    );

    /// show notification
    Future.delayed(Duration.zero , () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails,
        payload: "my_data"
      );
    });
  }



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
      if (kDebugMode) {
        print("User granted permission");
      }
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional) {
      if (kDebugMode) {
        print("User granted provisional permission");
      }
    }else{
      if (kDebugMode) {
        print("User denied permission");
        Future.delayed(Duration(seconds: 2) , () {
          AppSettings.openAppSettings(type: AppSettingsType.notification);
        });
      }
    }

  }


  /// get device token
  Future<String> getDeviceToken() async {

    String? token = await messaging.getToken();
    print("=> deviece token >>> " + token.toString());
    return token!;

  }

  /// initilaze notification
  void initLocalNotification(BuildContext context , RemoteMessage message) async {

    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
        initializationSetting,
        onDidReceiveNotificationResponse: (payload) {
          handleMessage(context, message);
        }
    );

  }

  /// firebase init
  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {

      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data['type']);
        print(message.data['id']);
      }

      /// ios
      if(Platform.isIOS){
        isForGroundMessage();
      }

      /// android
      if(Platform.isAndroid){
        initLocalNotification(context, message);
        // handleMessage(context, message);
        showNotification(message);
      }else{
        showNotification(message);
      }

    });
  }

  /// forground
  Future isForGroundMessage() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );
  }

  /// backgrounf and terminated
  Future<void> setupInteractMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();


    /// this for when app is terminated
    if(initialMessage != null){
      handleMessage(context, initialMessage);
    }

    /// when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });

  }

  /// below method is for when app is forground and recive notification to reqirect the user to the defing scrren
  void handleMessage(BuildContext context , RemoteMessage message) {
    if(message.data['type'] == 'message'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreenView()));
    }
  }


  /// is token refresh
  void isTokenRefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }


}