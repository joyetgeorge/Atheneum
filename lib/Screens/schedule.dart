import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime selectedDate = DateTime.now();
  List<String>? scheduleList;
  bool isEmpty = false;

  void initState() {
    getBorrowed();
  }

  getBorrowed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      scheduleList = prefs.getStringList('schedulelist');
      if (scheduleList?.isEmpty == false) {
        setState(() {
          isEmpty = true;
        });
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uid = prefs.getString('UID');
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        scheduleList!.clear();
        prefs.setStringList('schedulelist', []);
        scheduleList?.add(DateFormat('yyyy-MM-dd').format(picked));
        prefs.setStringList('schedulelist', scheduleList!.toSet().toList());
        print(uid);
        FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('schedule')
            .add({
          'date': picked.toString(),
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_mqzp4dzs.json'),
        ),
        Container(
          child: ElevatedButton(
            child: Text(
              'Schedule',
              style: GoogleFonts.poppins(color: Colors.black),
            ),
            onPressed: () {
              _selectDate(context);
            },
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 125, 221, 154),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        isEmpty
            ? Column(
                children: scheduleList!.map((item) {
                  return Container(
                    // color: Color.fromARGB(255, 243, 243, 243),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 243, 243, 243)),
                    width: 380,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Icon(FeatherIcons.clock),
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
                              color: Color.fromARGB(255, 235, 173, 155),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            : Container(),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FeatherIcons.info,
              size: 15,
              color: Colors.black26,
            ),
            SizedBox(
              width: 7,
            ),
            Text("You can only schedule one appoinment at a time",
                style: GoogleFonts.poppins(color: Colors.black26, fontSize: 12))
          ],
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
