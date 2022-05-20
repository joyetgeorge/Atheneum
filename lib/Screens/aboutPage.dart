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
              child: Center(child: Lottie.asset('assets/lottie/code.json')),
            ),
            Text("Developed by", style: GoogleFonts.poppins(fontSize: 10),),
            SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Joyet", style: GoogleFonts.poppins(),),
                Text("  |  ", style: GoogleFonts.poppins(fontSize: 9)),
                Text("Neha", style: GoogleFonts.poppins(),),
                Text("  |  ", style: GoogleFonts.poppins(fontSize: 9)),
                Text("Arshad", style: GoogleFonts.poppins(),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
