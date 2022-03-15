import 'package:Atheneum/Screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:Atheneum/Screens/signup_page.dart';
import 'Widgets/navbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        body: HomeScreen(),
        bottomNavigationBar: Navbar(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
