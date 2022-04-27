import 'package:Atheneum/Screens/IntroPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 20),
                Lottie.network(
                    'https://assets7.lottiefiles.com/packages/lf20_kq5rGs.json'),
                SizedBox(
                  height: 60,
                ),
                Text('Atheneum.', style: GoogleFonts.poppins(fontSize: 30)),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 300,
                  child: Text(
                      '" The complete library solution on your finger tip "',
                      style: GoogleFonts.poppins(fontSize: 15),
                      textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('clicked', true);

                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: IntroPage(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          'Get Started',
                          style: GoogleFonts.poppins(fontSize: 15),
                        ),
                        SizedBox(width: 8),
                        Icon(FeatherIcons.chevronRight)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFE8505B),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
