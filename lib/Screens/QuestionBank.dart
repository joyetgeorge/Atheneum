import 'dart:io';

import 'package:Atheneum/models/firebase_api.dart';
import 'package:Atheneum/models/firebase_file.dart';
import 'package:flutter/material.dart';
import 'package:Atheneum/models/pdf_api.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Atheneum/Screens/Pdf_view_page.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class QuestionBank extends StatefulWidget {
  // QuestionBank({Key? key}) : super(key: key);

  @override
  State<QuestionBank> createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final departments = [
    'BCA',
    'Bussiness',
    'Maths',
    'Commerce',
  ];
  final semester = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
  ];

  final year = [
    '2015',
    '2016',
    '2017',
    '2018',
    '2019',
    '2020',
  ];

  String? departmentValue;
  String? semesterValue;
  String? yearValue;

  DropdownMenuItem<String> buildDepartmentItem(String depatrment) =>
      DropdownMenuItem(
        value: depatrment,
        child: Text(
          depatrment,
          style: GoogleFonts.poppins(),
        ),
      );
  DropdownMenuItem<String> buildSemesterItem(String semester) =>
      DropdownMenuItem(
        value: semester,
        child: Text(
          semester,
          style: GoogleFonts.poppins(),
        ),
      );
  DropdownMenuItem<String> buildYearItem(String year) => DropdownMenuItem(
        value: year,
        child: Text(
          year,
          style: GoogleFonts.poppins(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 350,
                    height: 350,
                    child: Lottie.asset('assets/lottie/question.json'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Question Bank",
                    style: GoogleFonts.poppins(fontSize: 30),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 39,
                  ),
                  Text(
                    'Department',
                    style: GoogleFonts.poppins(),
                  )
                ],
              ),
              Container(
                width: 350,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: departments.map(buildDepartmentItem).toList(),
                      value: departmentValue,
                      onChanged: (departmentValue) => setState(
                        (() => this.departmentValue = departmentValue),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 39,
                  ),
                  Text(
                    'Semester',
                    style: GoogleFonts.poppins(),
                  )
                ],
              ),
              Container(
                width: 350,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: semester.map(buildSemesterItem).toList(),
                      value: semesterValue,
                      onChanged: (semesterValue) => setState(
                        (() => this.semesterValue = semesterValue),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 39,
                  ),
                  Text(
                    'Year',
                    style: GoogleFonts.poppins(),
                  )
                ],
              ),
              Container(
                width: 350,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: year.map(buildYearItem).toList(),
                      value: yearValue,
                      onChanged: (yearValue) => setState(
                        (() => this.yearValue = yearValue),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 125, 221, 154),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    futureFiles = FirebaseApi.listAll(
                        '${departmentValue}/${semesterValue}/${yearValue}');
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Scaffold(
                            body: Container(
                              // color: Colors.amber,
                              child: FutureBuilder<List<FirebaseFile>>(
                                future: futureFiles,
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return Center(
                                          child: CircularProgressIndicator());
                                    default:
                                      if (snapshot.hasError) {
                                        return Center(
                                          child: Text('Error'),
                                        );
                                      } else {
                                        final files = snapshot.data!;
                                        return SafeArea(
                                          child: Column(
                                            children: [
                                              buildHeader(files.length),
                                              files.length == 0
                                                  ? Center(
                                                      child: Container(
                                                      height: 800,
                                                      width: 300,
                                                      child: Center(
                                                          child: Center(
                                                              child: Lottie.asset(
                                                                  'assets/lottie/404.json'))),
                                                    ))
                                                  : Expanded(
                                                      child: ListView.builder(
                                                          itemCount:
                                                              files.length,
                                                          itemBuilder:
                                                              ((context,
                                                                  index) {
                                                            final file =
                                                                files[index];
                                                            return buildFile(
                                                                context, file);
                                                          })))
                                            ],
                                          ),
                                        );
                                      }
                                  }
                                },
                              ),
                            ),
                          ),
                        ));
                  },
                  child: Container(
                    width: 110,
                    height: 40,
                    child: Row(
                      children: [
                        Icon(
                          FeatherIcons.search,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Search',
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // buildHeader(length) {}
  Widget buildHeader(int length) => Container(
        width: double.infinity,
        height: 52,
        color: Color.fromARGB(255, 243, 243, 243),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              child: Icon(FeatherIcons.arrowLeft),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: 30,
            ),
            Icon(FeatherIcons.search),
            SizedBox(
              width: 10,
            ),
            Text('$length - Question papers', style: GoogleFonts.poppins(fontSize: 18))
          ],
        ),
      );

  Widget buildFile(BuildContext context, FirebaseFile file) {
    return GestureDetector(
      onTap: () async {
        final pdfFile = await PDFapi.loadNetwork(file.url);
        openPDF(context, pdfFile);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.only(top: 10),
        color: Color.fromARGB(255, 243, 243, 243),
        child: Row(
          children: [
            Icon(FeatherIcons.file),
            SizedBox(
              width: 20,
            ),
            Text(file.name.replaceFirstMapped('.pdf', (match) => '')),
            Spacer(),
            Icon(
              FeatherIcons.downloadCloud,
              color: Colors.black38,
            )
          ],
        ),
      ),
    );
  }

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );

  // Widget buildFile(BuildContext context, FirebaseFile file) {}
}
