import 'package:Atheneum/Screens/InfoPage.dart';
import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ForMe extends StatelessWidget {
  const ForMe({
    Key? key,
    required this.docs,
  }) : super(key: key);

  final List docs;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final data = docs[index].data() as Map;

                  return GestureDetector(
                    onTap: () =>
                                Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: InfoPage(data: data,),
                                      ),
                                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Color.fromARGB(255, 223, 223, 223),
                              width: 350,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5, top: 5, bottom: 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Hero(
                                        tag: data,
                                        child: FancyShimmerImage(
                                          imageUrl:
                                              "https://covers.openlibrary.org/b/isbn/" +
                                                  data['isbn'] +
                                                  "-M.jpg",
                                          width: 110,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 170,
                                          child: Text(
                                            data['name'],
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          width: 210,
                                          child: Text(
                                            data['description'].substring(0, 60),
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Read more',
                                              style:
                                                  GoogleFonts.poppins(fontSize: 13, color: Color.fromARGB(255, 2, 95, 170)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '4.6',
                                              style: GoogleFonts.poppins(),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              FeatherIcons.star,
                                              size: 10,
                                              color: Color.fromARGB(
                                                  255, 255, 127, 7),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
