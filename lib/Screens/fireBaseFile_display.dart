import 'dart:io';

import 'package:Atheneum/Screens/Pdf_view_page.dart';
import 'package:Atheneum/Widgets/404.dart';
import 'package:Atheneum/models/firebase_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../models/firebase_api.dart';
import '../models/pdf_api.dart';

class displayFirebaseFiles extends StatefulWidget {
  displayFirebaseFiles({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<displayFirebaseFiles> createState() => _displayFirebaseFilesState();
}

class _displayFirebaseFilesState extends State<displayFirebaseFiles> {
  bool isLoading = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  // Future<List<FirebaseFile>> futureFiles = FirebaseApi.listAll(widget.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: FutureBuilder<List<FirebaseFile>>(
          future: FirebaseApi.listAll(widget.url),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return errorPage();
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
                                    child:
                                        Center(child: Lottie.asset('assets/lottie/404.json'))),
                              ))
                            : Expanded(
                                child: ListView.builder(
                                    itemCount: files.length,
                                    itemBuilder: ((context, index) {
                                      final file = files[index];
                                      return buildFile(context, file);
                                    }))),
                      ],
                    ),
                  );
                }
            }
          },
        ),
      ),
    );
  }

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
              width: 20,
            ),
            Icon(FeatherIcons.globe),
            SizedBox(
              width: 10,
            ),
            Text('$length E - Books', style: GoogleFonts.poppins(fontSize: 18))
          ],
        ),
      );

  Widget buildFile(BuildContext context, FirebaseFile file) {
    final pdfFile;
    return GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          final snackbar = SnackBar(
            content: Row(
              children: [
                Icon(
                  FeatherIcons.download,
                  color: Colors.white,
                  size: 14,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Downloading',
                  style: GoogleFonts.poppins(),
                ),
              ],
            ),
            backgroundColor: Colors.black,
            duration: Duration(days: 365),
            action: SnackBarAction(
              label: 'Dismiss',
              onPressed: () {},
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackbar);

          final pdfFile = await PDFapi.loadNetwork(file.url);

          openPDF(_scaffoldKey, pdfFile);

          setState(() {
            isLoading = false;
          });
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
              file.name.length > 50
                  ? Text(
                      "${file.name.replaceFirstMapped('.pdf', (match) => '').substring(0, 40)}...")
                  : Text(file.name.replaceFirstMapped('.pdf', (match) => '')),
              Spacer(),
              Icon(
                FeatherIcons.downloadCloud,
                color: Colors.black38,
              )
            ],
          ),
        ));
  }

  void openPDF(GlobalKey, File file) {
    ScaffoldMessenger.of(context).clearSnackBars();
    Navigator.of(context).push(
      MaterialPageRoute(builder: (scaffoldKey) => PDFViewerPage(file: file)),
    );
  }
}
