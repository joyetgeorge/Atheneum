import 'package:flutter/material.dart';
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

  bool isEmpyBorrowed = true;

  void initState() {
    getBorrowed();
  }

  getBorrowed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      borrowedList = prefs.getStringList('borrowlist');
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
        child: Container(
          width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
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
                          width: 220,
                          child: Lottie.asset('assets/lottie/qrcode.json'),
                        ),
                      ],
                    )
                  : Column(
                    children: [
                      Container(
                              width: 350,
                              height: 400,
                              child: Lottie.asset('assets/lottie/book.json'),
                            ),
                            SizedBox(height: 20,),
                            Text("You haven't borrowed any books yet!", style: GoogleFonts.poppins(fontSize: 15),)
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
