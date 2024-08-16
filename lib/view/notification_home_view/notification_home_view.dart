

import 'package:flutter/material.dart';
import 'package:parallax_scroll/utils/widgets/my_text.dart';
import 'package:parallax_scroll/view_model/notification_view_model/notification_view_model.dart';

class NotificationHomeView extends StatefulWidget {
  const NotificationHomeView({super.key});

  @override
  State<NotificationHomeView> createState() => _NotificationHomeViewState();
}

class _NotificationHomeViewState extends State<NotificationHomeView> {

  NotificationViewModel notificationViewModel = NotificationViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationViewModel.requestNotificationPermission();
    notificationViewModel.firebaseInit(context);
    notificationViewModel.setupInteractMessage(context);

    // notificationViewModel.isTokenRefresh();
    notificationViewModel.getDeviceToken().then((value) {
      print("token ");
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: MyText(title: "This is notification home screen",fontSize: 20,),
      ),
    );
  }
}
