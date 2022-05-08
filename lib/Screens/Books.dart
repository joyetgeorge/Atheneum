import 'package:Atheneum/Screens/fireBaseFile_display.dart';
import 'package:Atheneum/Widgets/Latest.dart';
import 'package:Atheneum/Widgets/navbar.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Center(
                child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        color: Color.fromARGB(255, 219, 219, 218),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(FeatherIcons.search),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Search',
                              style: GoogleFonts.poppins(color: Colors.black26),
                            ),
                            Spacer()
                          ],
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'EBOOKS/Novels'),
                          ),
                        );
                        print('tap');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color.fromARGB(255, 223, 223, 223),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/novels.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'EBOOKS/Romance'),
                          ),
                        );
                        print('tap');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color.fromARGB(255, 223, 223, 223),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/romance.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'EBOOKS/Science'),
                          ),
                        );
                        print('tap');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color.fromARGB(255, 223, 223, 223),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/science.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'EBOOKS/SciFi'),
                          ),
                        );
                        print('tap');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color.fromARGB(255, 223, 223, 223),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/scifi.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'EBOOKS/Adventure'),
                          ),
                        );
                        print('tap');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color.fromARGB(255, 223, 223, 223),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/adventure.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'EBOOKS/History'),
                          ),
                        );
                        print('tap');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color.fromARGB(255, 223, 223, 223),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/history.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'EBOOKS/Tech'),
                          ),
                        );
                        print('tap');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color.fromARGB(255, 223, 223, 223),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/tech.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'EBOOKS/Art'),
                          ),
                        );
                        print('tap');
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          color: Color.fromARGB(255, 223, 223, 223),
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            'assets/art.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Departments',
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'Department/Computer'),
                          ),
                        );
                        print('tap');
                      },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 170,
                            height: 100,
                            // color: HexColor('#AC82E1'),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                  Color.fromARGB(255, 230, 154, 243),
                                  Color.fromARGB(255, 141, 193, 236)
                                ])),
                            child: Center(
                                child: Text('Computer',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'Department/Commerce'),
                          ),
                        );
                        print('tap');
                      },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 170,
                            height: 100,
                            // color: HexColor('#00ADB5'),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                  Color.fromARGB(255, 166, 231, 136),
                                  Color.fromARGB(255, 92, 218, 180)
                                ])),
                            child: Center(
                                child: Text('Commerce',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'Department/Business'),
                          ),
                        );
                        print('tap');
                      },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 170,
                            height: 100,
                            // color: HexColor('#E1C57C'),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                  Color.fromARGB(255, 253, 160, 131),
                                  Color.fromARGB(255, 240, 206, 144)
                                ])),
                            child: Center(
                                child: Text('Business',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'Department/English'),
                          ),
                        );
                        print('tap');
                      },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 170,
                            height: 100,
                            // color: HexColor('#7CA4E1'),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                  Color.fromARGB(255, 152, 211, 250),
                                  Color.fromARGB(255, 114, 224, 191)
                                ])),
                            child: Center(
                                child: Text('English',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'Department/Maths'),
                          ),
                        );
                        print('tap');
                      },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 170,
                            height: 100,
                            // color: HexColor('#7CE198'),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                  Color.fromARGB(255, 255, 104, 104),
                                  Color.fromARGB(255, 255, 139, 197)
                                ])),
                            child: Center(
                                child: Text('Maths',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'Department/Social'),
                          ),
                        );
                        print('tap');
                      },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 170,
                            height: 100,
                            // color: HexColor('#F38181'),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                  Color.fromARGB(255, 206, 152, 250),
                                  Color.fromARGB(255, 241, 139, 139)
                                ])),
                            child: Center(
                                child: Text('Social',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'Department/Psychology'),
                          ),
                        );
                        print('tap');
                      },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 170,
                            height: 100,
                            // color: HexColor('#8FBDD3'),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                  Color.fromARGB(255, 124, 122, 221),
                                  Color.fromARGB(255, 114, 184, 224)
                                ])),
                            child: Center(
                                child: Text('Psychology',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: displayFirebaseFiles(url: 'Department/Finance'),
                          ),
                        );
                        print('tap');
                      },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 170,
                            height: 100,
                            // color: HexColor('#D186BC'),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                  Color.fromARGB(255, 152, 250, 196),
                                  Color.fromARGB(255, 114, 224, 114)
                                ])),
                            child: Center(
                                child: Text('Finance',
                                    style: GoogleFonts.poppins(
                                        fontSize: 20, color: Colors.white))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 170,
                          height: 100,
                          color: Colors.amberAccent,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 170,
                          height: 100,
                          color: Colors.amberAccent,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          ]),
        ),
      ),
    );
  }
}
