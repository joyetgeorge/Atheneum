import 'package:Atheneum/Screens/InfoPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:page_transition/page_transition.dart';

class Adventure extends StatelessWidget {
  const Adventure({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('Adventure').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          final data = docs[index].data() as Map;

                          return Container(
                            width: 110,
                            margin: EdgeInsets.only(left: 10, top: 10),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: InfoPage(data: data,),
                                      ),
                                    ),
                                    child: Hero(
                                      tag: data,
                                      child: FancyShimmerImage(
                                        imageUrl:
                                            "https://covers.openlibrary.org/b/isbn/" +
                                                data['isbn'] +
                                                "-M.jpg",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
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
