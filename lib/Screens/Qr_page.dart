import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrPage extends StatefulWidget {
  const QrPage({Key? key}) : super(key: key);

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  List<String>? borrowedList;
  List<String>? borrowedNameList;

  int i = 0;

  bool isEmpyBorrowed = true;

  void initState() {
    getBorrowed();
  }

  getBorrowed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      borrowedList = prefs.getStringList('borrowlist');
      borrowedNameList = prefs.getStringList('borrowNamelist');
      if (borrowedList?.isEmpty == false) {
        setState(() {
          isEmpyBorrowed = false;
        });
      }
      print(borrowedList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                !isEmpyBorrowed
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black26)),
                            child: QrImage(
                              data: borrowedList.toString(),
                              // backgroundColor: Color.fromARGB(255, 219, 219, 218),
                              size: 200,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Scan this QR code',
                              style: GoogleFonts.poppins(),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Lottie.asset('assets/lottie/qrcode.json'),
                          ),
                          Text(
                            "Borrowed books",
                            style: GoogleFonts.poppins(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: borrowedNameList!.map((item) {
                              return Container(
                                // color: Color.fromARGB(255, 243, 243, 243),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 243, 243, 243)),
                                width: 380,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                margin: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Icon(FeatherIcons.file),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      item,
                                      style: GoogleFonts.poppins(fontSize: 15),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      // onTap: (() async {
                                      //   SharedPreferences prefs = await SharedPreferences.getInstance();
                                      //   setState(() {
                                      //     borrowedNameList?.remove(item);
                                      //   });
                                      //   prefs.setStringList('borrowNamelist', borrowedNameList!);
                                      //   print("click");
                                      // }),
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 235, 173, 155),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Center(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Icon(
                          //         FeatherIcons.info,
                          //         size: 17,
                          //       ),
                          //       SizedBox(
                          //         width: 10,
                          //       ),
                          //       Text(
                          //         'You must collect the books within 5 days',
                          //         style: GoogleFonts.poppins(),
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            width: 350,
                            height: 400,
                            child: Lottie.asset('assets/lottie/book.json'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "You haven't borrowed any books yet!",
                            style: GoogleFonts.poppins(fontSize: 15),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
