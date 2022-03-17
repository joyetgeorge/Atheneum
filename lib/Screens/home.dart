import 'package:Atheneum/Widgets/Latest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> getBooks() async {
    var firestore = FirebaseFirestore.instance;
    CollectionReference cr = firestore.collection('books');
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: Container(
          color: Color(0xE3E6EC),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('books').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Something went wrong!'),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text('Loading'),
                );
              }

              if (snapshot.hasData) {
                final docs = snapshot.data!.docs;
                return Scaffold(
                  appBar: AppBar(
                    title: Row(
                      children: [
                        Text("Atheneum",
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            )),
                        new Spacer(),
                        Icon(
                          FeatherIcons.search,
                          color: Colors.black,
                        )
                      ],
                    ),
                    elevation: 0,
                    backgroundColor: Color.fromARGB(255, 236, 236, 236),
                  ),
                  body: SingleChildScrollView(
                    child: Wrap(
                      spacing: 10,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(top: 0),
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            BookList(),
                            Latest(docs: docs),
                            BookList(),
                            Latest(docs: docs),
                            BookList(),
                            Latest(docs: docs),
                            BookList(),
                            Latest(docs: docs),
                            BookList(),
                            Latest(docs: docs),
                            BookList(),
                            Latest(docs: docs)
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
              return Text('');
            },
          )),
    );
  }
}

class BookList extends StatelessWidget {
  const BookList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        children: [
          Text(
            'New arrivals',
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          new Spacer(),
          Icon(FeatherIcons.arrowRight)
        ],
      ),
    );
  }
}
