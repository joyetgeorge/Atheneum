import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';

class ReqestBook extends StatefulWidget {
  const ReqestBook({Key? key}) : super(key: key);

  @override
  State<ReqestBook> createState() => _ReqestBookState();
}

class _ReqestBookState extends State<ReqestBook> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController isbinController = TextEditingController();

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
    // duration: Duration(days: 365),
    action: SnackBarAction(
      label: 'Dismiss',
      onPressed: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      // obscureText: true,
      controller: nameController,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        prefixIcon: Icon(FeatherIcons.bookOpen),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Book name",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    final isbinField = TextFormField(
      autofocus: false,
      // obscureText: true,
      controller: isbinController,
      onSaved: (value) {
        isbinController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        prefixIcon: Icon(FeatherIcons.hash),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "ISBIN",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 250,
                child: Lottie.asset('assets/lottie/plane.json'),
              ),
              Text(
                'Request a Book',
                style: GoogleFonts.poppins(fontSize: 25),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12)),
                margin: EdgeInsets.only(left: 20, right: 20),
                child: nameField,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12)),
                margin: EdgeInsets.only(left: 20, right: 20),
                child: isbinField,
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
                  onPressed: () {
                    if (nameController.text != "") {
                      FirebaseFirestore.instance.collection('Requests').add({
                        'name': nameController.text,
                        'isbin': isbinController.text
                      });
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      nameController.clear();
                      isbinController.clear();
                    } else {
                      Fluttertoast.showToast(msg: "Enter values");
                    }
                    // print(nameController.text);
                  },
                  child: Container(
                    width: 100,
                    height: 45,
                    child: Row(
                      children: [
                        Text(
                          'Submit',
                          style: GoogleFonts.poppins(
                              fontSize: 18, color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          FeatherIcons.send,
                          size: 18,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
