import 'package:Atheneum/Widgets/Latest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

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

                return Wrap(
                  spacing: 10,
                  children: [
                    Container(
                      child: Text(
                        'New arrivals',
                        style: GoogleFonts.roboto(fontSize: 17),
                      ),
                      margin: EdgeInsets.only(left: 12, top: 50),
                    ),
                    Latest(docs: docs),
                  ],
                );
              }
              return Text('');
            },
          )),
    );
  }
}

// ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: docs.length,
//                   itemBuilder: (_, i) {
// final daa = docs[i].data();
// final data = daa as Map;
//                     return ListTile(
//                       title: Container(width: 100,child: Text(data['name'])),
//                     );
//                   },
//                 );