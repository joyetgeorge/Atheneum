import 'package:Atheneum/Widgets/Heading.dart';
import 'package:Atheneum/Widgets/Latest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              data['name'],
              style: GoogleFonts.poppins(fontSize: 15),
            ),
            Spacer(),
            Icon(
              FeatherIcons.bookmark,
              color: Colors.black,
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
                  Hero(
                    tag: data,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 120,
                        height: 190,
                        child: FancyShimmerImage(
                          imageUrl: "https://covers.openlibrary.org/b/isbn/" +
                              data['isbn'] +
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
                            data['name'],
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 8),
                            width: 100,
                            child: Text(
                              'Author name',
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
                          height: 54,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
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
                                  Text(
                                    'Borrow',
                                    style: GoogleFonts.poppins(
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF7CE198)),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              FeatherIcons.heart,
                            )
                          ],
                        )
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
                    data['description'],
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
