import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parallax_scroll/firebase_options.dart';
import 'package:parallax_scroll/view/home_view.dart';
import 'package:parallax_scroll/view/notification_home_view/notification_home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomeView()
      home: NotificationHomeView()
    );
  }
}