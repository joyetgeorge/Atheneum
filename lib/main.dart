import 'package:Atheneum/Screens/Welcome.dart';
import 'package:Atheneum/Screens/home.dart';
import 'package:Atheneum/Screens/IntroPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:Atheneum/Screens/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Widgets/navbar.dart';
import 'models/notifications.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(Atheneum());
}

class Atheneum extends StatefulWidget {
  const Atheneum({Key? key}) : super(key: key);

  @override
  State<Atheneum> createState() => _AtheneumState();
}

class _AtheneumState extends State<Atheneum> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Welcome(),
        // bottomNavigationBar: Navbar(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
