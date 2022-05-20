import 'dart:ffi';

import 'package:Atheneum/Widgets/Heading.dart';
import 'package:Atheneum/Widgets/Latest.dart';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String? uid = '';

  bool borrowed = false;

  List<String>? wishList;
  List<String>? borrowList;
  List<String>? borrowNameList;

  // late DateTime borrowDate;

  @override
  void initState() {
    getWishlist();
  }

  getWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      wishList = prefs.getStringList('wishlist');
      borrowList = prefs.getStringList('borrowlist');
      borrowNameList = prefs.getStringList('borrowNamelist');
      // borrowDate = prefs.getString('borrowDate') as DateTime;
      // print(borrowDate);
    });

    if (borrowList!.contains(widget.data['isbn'])) {
      setState(() {
        borrowed = true;
      });
    }

    print(wishList);
    print(borrowList);
  }

  bool heartState = false;
  bool borrowedState = false;
  bool dateState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                Share.share(widget.data['name']+" "+widget.data['isbn']);
              },
              child: Icon(
                FeatherIcons.share2,
                color: Colors.black,
              ),
            )
          ],
        ),
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 236, 236, 236),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: widget.data,
                      child: Container(
                        width: 120,
                        height: 190,
                        child: FancyShimmerImage(
                          imageUrl: "https://covers.openlibrary.org/b/isbn/" +
                              widget.data['isbn'] +
                              "-M.jpg",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            widget.data['name'],
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 8),
                            width: 100,
                            child: Text(
                              // widget.data['author'],
                              "name",
                              style: GoogleFonts.poppins(
                                  color: Color.fromARGB(255, 151, 151, 151)),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 8),
                            width: 100,
                            child: Row(
                              children: [
                                Text(
                                  '4.9',
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color:
                                          Color.fromARGB(255, 151, 151, 151)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  FeatherIcons.star,
                                  size: 14,
                                  color: Color.fromARGB(255, 255, 127, 7),
                                )
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                setState(() {
                                  borrowList?.add(widget.data['isbn']);
                                  borrowNameList?.add(widget.data['name']);
                                  borrowed = true;
                                  dateState = true;
                                });
                                prefs.setStringList(
                                    'borrowlist', borrowList!.toSet().toList());
                                prefs.setStringList('borrowNamelist',
                                    borrowNameList!.toSet().toList());
                                // prefs.setString(
                                //     'borrowDate', DateTime.now().toString());
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    FeatherIcons.shoppingCart,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  borrowed == true
                                      ? Text(
                                          'Borrowed',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black),
                                        )
                                      : Text(
                                          'Borrow',
                                          style: GoogleFonts.poppins(
                                              color: Colors.black),
                                        ),
                                ],
                              ),
                              style: borrowed == true
                                  ? ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 223, 64, 37),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))
                                  : ElevatedButton.styleFrom(
                                      primary: Color(0xFF7CE198),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: (() async {
                                setState(() {
                                  wishList?.add(widget.data['isbn']);
                                  heartState = true;
                                });
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setStringList(
                                    'wishlist', wishList!.toSet().toList());
                              }),
                              child: heartState == true
                                  ? Icon(
                                      FeatherIcons.heart,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      FeatherIcons.heart,
                                    ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        dateState == true
                            ? Row(
                                children: [
                                  Icon(FeatherIcons.clock),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(DateTime.now()
                                            .add(Duration(days: 20)))
                                        .toString(),
                                    style: GoogleFonts.poppins(fontSize: 15),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    widget.data['description'],
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                ],
              ),
              margin: EdgeInsets.only(
                top: 20,
              ),
            ),
            Heading(title: 'Similar'),
            Latest()
          ],
        )),
      ),
    );
  }
}
