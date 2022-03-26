import 'package:Atheneum/Screens/InfoPage.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Authors extends StatelessWidget {
  const Authors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('top_authors').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          final data = docs[index].data() as Map;

                          return Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 12,
                                ),
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Container(
                                        color:
                                            Color.fromARGB(255, 223, 223, 223),
                                        width: 70,
                                        height: 70,
                                        child: FancyShimmerImage(
                                            imageUrl: data['img_url']),
                                      ),
                                    ),
                                    // Text(data['name'])
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          }
          return Text('');
        });
  }
}
