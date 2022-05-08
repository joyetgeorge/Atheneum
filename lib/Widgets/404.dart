import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class errorPage extends StatelessWidget {
  const errorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 400,
          child: Center(child: Lottie.asset('assets/lottie/404.json')),
        ),
      ),
    );
  }
}
