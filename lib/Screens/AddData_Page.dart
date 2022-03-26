import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class AddData extends StatefulWidget {
  AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  CollectionReference books = FirebaseFirestore.instance.collection('books');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add new Book',
                style: GoogleFonts.poppins(fontSize: 30),
              ),
              SizedBox(
                height: 60,
              ),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Neumorphic(
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        style: const NeumorphicStyle(
                          color: Color(0xFFEFEEEE),
                        ),
                        child: TextFormField(
                          controller: nameController,
                          onSaved: (value) {
                            nameController.text = value!;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(FeatherIcons.bookOpen, size: 20),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: 'Name',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Neumorphic(
                        style: const NeumorphicStyle(
                          color: Color(0xFFEFEEEE),
                        ),
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: TextFormField(
                          controller: isbnController,
                          onSaved: (value) {
                            isbnController.text = value!;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(FeatherIcons.hash, size: 20),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: 'ISBN',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Neumorphic(
                        style: const NeumorphicStyle(
                          color: Color(0xFFEFEEEE),
                        ),
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: TextFormField(
                          controller: descriptionController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onSaved: (value) {
                            descriptionController.text = value!;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(FeatherIcons.edit, size: 20),
                            contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            hintText: 'Description',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                ),
                child: NeumorphicButton(
                  style: const NeumorphicStyle(
                    color: Color(0xFFEFEEEE),
                  ),
                  onPressed: (() async {
                    await books.add({
                      'description': '${descriptionController.text}',
                      'name': '${nameController.text}',
                      'isbn': '${isbnController.text}'
                    });
                    nameController.clear();
                    isbnController.clear();
                    descriptionController.clear();
                    Fluttertoast.showToast(msg: "Book added");
                  }),
                  child: Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FeatherIcons.cloud),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Upload',
                          style: GoogleFonts.poppins(fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
