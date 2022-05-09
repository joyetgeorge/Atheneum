import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class aboutPage extends StatelessWidget {
  const aboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              child: Center(child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_dlw10cqe.json')),
            ),
            Text("Developed by", style: GoogleFonts.poppins(),),
          ],
        ),
      ),
    );
  }
}
