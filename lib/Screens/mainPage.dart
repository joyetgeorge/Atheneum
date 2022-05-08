import 'package:Atheneum/Screens/Books.dart';
import 'package:Atheneum/Screens/MoreOptions.dart';
import 'package:Atheneum/Screens/Qr_page.dart';
import 'package:Atheneum/Screens/QuestionBank.dart';
import 'package:Atheneum/Screens/fireBaseFile_display.dart';
import 'package:Atheneum/Screens/home.dart';
import 'package:Atheneum/Screens/login_page.dart';
import 'package:Atheneum/Screens/reqestBook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget CurrentPage = LogInPage();

  List Pages = [
    HomeScreen(),
    Books(),
    QrPage(),
    QuestionBank(),
    MoreOptions()
    // ReqestBook()
    // displayFirebaseFiles()
  ];

  @override
  Widget build(BuildContext context) {
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
                  FeatherIcons.globe,
                  color: Colors.black54,
                ),
                activeIcon: Icon(
                  FeatherIcons.globe,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code_rounded,
                  color: Colors.black54,
                  size: 27,
                ),
                activeIcon: Icon(
                  Icons.qr_code_rounded,
                  color: Colors.black,
                  size: 27,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.file,
                  color: Colors.black54,
                ),
                activeIcon: Icon(
                  FeatherIcons.fileText,
                  color: Colors.black,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  FeatherIcons.menu,
                  color: Colors.black54,
                ),
                activeIcon: Icon(
                  FeatherIcons.list,
                  color: Colors.black,
                ),
                label: ""),
          ]),
    );
  }
}
