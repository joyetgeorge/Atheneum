import 'dart:ffi';

import 'package:Atheneum/Screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isIntro = false;

  void readData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bool isIntro = prefs.getBool('intro')!;
    });
  }

  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return isIntro
        ? SignUpPage()
        : Scaffold(
            body: Container(
              margin: EdgeInsets.only(bottom: 70),
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    isLastPage = index == 4;
                  });
                },
                children: [
                  SafeArea(
                    child: Container(
                        child: Column(
                      children: [
                        Container(height: 70,),
                        Container(
                          width: 500,
                          child: Lottie.asset('assets/lottie/atheneum.json'),
                        ),
                        Spacer(),
                        Text(
                          'Atheneum',
                          style: GoogleFonts.poppins(fontSize: 40),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '"The ultimate solution for library access, at your finger tip"',
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    )),
                  ),
                  SafeArea(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 400,
                          child: Lottie.asset('assets/lottie/notifications.json'),
                        ),
                        Text(
                          'Notification service',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '" Notification about whats happening in your library "',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                        )
                      ],
                    )),
                  ),
                  SafeArea(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 400,
                          child: Lottie.asset('assets/lottie/request.json'),
                        ),
                        Text(
                          'Request Books',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '" Request your favourite books, and we will add those books to the library "',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                        )
                      ],
                    )),
                  ),
                  SafeArea(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 400,
                          child: Lottie.asset('assets/lottie/questionbank.json'),
                        ),
                        Text(
                          'Qestion Bank',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '" Access previous year question papers through Atheneum "',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                        )
                      ],
                    )),
                  ),
                  SafeArea(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 400,
                          child: Lottie.asset('assets/lottie/ebook.json'),
                        ),
                        Text(
                          'Access E-books',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '" Access 100+ E-books in different categories through Atheneum "',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(fontSize: 15),
                          ),
                        )
                      ],
                    )),
                  ),
                ],
              ),
            ),
            bottomSheet: isLastPage
                ? Container(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setBool('intro', true);

                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: SignUpPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Take Me In',
                                  style: GoogleFonts.poppins(fontSize: 15),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFE8505B),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.white10,
                    height: 70,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: SignUpPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Skip',
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 75, 75, 75)),
                            ),
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: SmoothPageIndicator(
                            controller: controller,
                            count: 4,
                            effect: WormEffect(dotHeight: 10),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: TextButton(
                            onPressed: () => controller.nextPage(
                                duration: Duration(microseconds: 500),
                                curve: Curves.easeIn),
                            child: Icon(
                              FeatherIcons.chevronRight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
  }
}
