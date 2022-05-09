import 'dart:io';

import 'package:Atheneum/Screens/Books.dart';
import 'package:Atheneum/Screens/Cart.dart';
import 'package:Atheneum/Screens/Pdf_view_page.dart';
import 'package:Atheneum/Screens/Qr_page.dart';
import 'package:Atheneum/Screens/QuestionBank.dart';
import 'package:Atheneum/Screens/Welcome.dart';
import 'package:Atheneum/Screens/home.dart';
import 'package:Atheneum/Screens/IntroPage.dart';
import 'package:Atheneum/Screens/login_page.dart';
import 'package:Atheneum/Screens/mainPage.dart';
import 'package:Atheneum/models/pdf_api.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:Atheneum/Screens/signup_page.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'Widgets/navbar.dart';
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
  // await UserSimplePreferences.init();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.getBool('firstLaunch') != false) {
    prefs.setStringList('wishlist', []);
    prefs.setStringList('borrowlist', []);
    prefs.setStringList('borrowNamelist', []);
  }

  print("borrowNamelist : ${prefs.getStringList('borrowNamelist')}");

  print('refresh');

  runApp(Atheneum());
}

class Atheneum extends StatefulWidget {
  Atheneum({Key? key}) : super(key: key);

  @override
  State<Atheneum> createState() => _AtheneumState();
}

class _AtheneumState extends State<Atheneum> {
  int currentIndex = 0;

  String uid = '';

  Widget CurrentPage = IntroPage();

  List Pages = [
    HomeScreen(),
    Books(),
    QrPage(),
    QuestionBank(),
    Container(
      color: Colors.amber,
    )
  ];

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setStringList('wishlist', []);
    // prefs.setStringList('borrowlist', []);
    String? uid = prefs.getString('UID');
    setState(() {
      uid = prefs.getString('UID');
    });
    if (uid != null) {
      CurrentPage = MainPage();
    }
    // print(prefs.getString('wishlist'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrentPage,
      debugShowCheckedModeBanner: false,
    );
  }

  Scaffold MainScreen() {
    return Scaffold(
      // body: IntroPage(),
      body: Pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
                print(currentIndex);
              }),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.home,
                  color: Colors.black54,
                ),
                activeIcon: Icon(
                  FeatherIcons.home,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.book,
                  color: Colors.black54,
                ),
                activeIcon: Icon(
                  FeatherIcons.book,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code,
                  color: Colors.black54,
                ),
                activeIcon: Icon(
                  Icons.qr_code,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.mail,
                  color: Colors.black54,
                ),
                activeIcon: Icon(
                  FeatherIcons.downloadCloud,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.user,
                  color: Colors.black54,
                ),
                activeIcon: Icon(
                  FeatherIcons.user,
                  color: Colors.black,
                ),
                label: ""),
          ]),
    );
  }
}
