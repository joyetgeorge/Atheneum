import 'package:Atheneum/Screens/reqestBook.dart';
import 'package:Atheneum/Widgets/404.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              // Container(height: 300,),
              Container(
                height: 350,
                child: Lottie.asset('assets/lottie/notification.json'),
              ),
              // Container(
              //   color: Color.fromARGB(255, 243, 243, 243),
              //   height: 60,
              //   width: double.infinity,
              //   child: Text(
              //     'Request Books',
              //     style: GoogleFonts.poppins(fontSize: 17),
              //   ),
              // ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: Color.fromARGB(255, 243, 243, 243),
                            elevation: 0,
                            iconTheme: IconThemeData(color: Colors.black),
                          ),
                          body: ReqestBook(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 243, 243, 243),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    children: [
                      Text(
                        'Request a Book',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        FeatherIcons.arrowRight,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: Color.fromARGB(255, 243, 243, 243),
                            elevation: 0,
                            iconTheme: IconThemeData(color: Colors.black),
                          ),
                          body: errorPage(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 243, 243, 243),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    children: [
                      Text(
                        'Schedule an appoinment',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        FeatherIcons.arrowRight,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: Color.fromARGB(255, 243, 243, 243),
                            elevation: 0,
                            iconTheme: IconThemeData(color: Colors.black),
                          ),
                          body: errorPage(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 243, 243, 243),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    children: [
                      Text(
                        'Request a Call back',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        FeatherIcons.arrowRight,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: Color.fromARGB(255, 243, 243, 243),
                            elevation: 0,
                            iconTheme: IconThemeData(color: Colors.black),
                          ),
                          body: errorPage(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 243, 243, 243),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    children: [
                      Text(
                        'Library rules',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        FeatherIcons.arrowRight,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: Color.fromARGB(255, 243, 243, 243),
                            elevation: 0,
                            iconTheme: IconThemeData(color: Colors.black),
                          ),
                          body: errorPage(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 243, 243, 243),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    children: [
                      Text(
                        'Fine Payment',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        FeatherIcons.arrowRight,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: Color.fromARGB(255, 243, 243, 243),
                            elevation: 0,
                            iconTheme: IconThemeData(color: Colors.black),
                          ),
                          body: errorPage(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 243, 243, 243),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Row(
                    children: [
                      Text(
                        'About ',
                        style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        FeatherIcons.arrowRight,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              Text(
                'v 1.1',
                style: GoogleFonts.poppins(color: Colors.black26),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
