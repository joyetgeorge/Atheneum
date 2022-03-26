import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';


import '../Widgets/adventure.dart';
import 'package:Atheneum/Screens/InfoPage.dart';
import 'package:Atheneum/Widgets/Authors.dart';
import 'package:Atheneum/Widgets/ForMe.dart';
import 'package:Atheneum/Widgets/Latest.dart';
import 'package:Atheneum/Widgets/Heading.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: Department(),
    );
  }
}

class Department extends StatelessWidget {
  const Department({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: CircularProgressIndicator(color: Colors.amber),
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
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                      // new Spacer(),
                      SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            width: 160,
                            height: 30,
                            color: Color.fromARGB(255, 219, 219, 218),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    FeatherIcons.search,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        FeatherIcons.moon,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                          width: 30,
                          height: 30,
                          child: FancyShimmerImage(
                              imageUrl:
                                  'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
                        ),
                      ),
                    ],
                  ),
                  elevation: 0,
                  backgroundColor: Color.fromARGB(255, 236, 236, 236),
                ),
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      Column(
                        children: [
                          Heading(title: 'New arrivals'),
                          Latest(),
                          Heading(
                            title: 'For you',
                          ),
                          ForMe(docs: docs),
                          SizedBox(
                            height: 5,
                          ),
                          Heading(
                            title: 'Top authors',
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Authors(),
                          Heading(title: 'Adventure'),
                          Adventure(),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            return Text('');
          },
        ));
  }
}

