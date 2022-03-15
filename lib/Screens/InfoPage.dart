import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Center(
            child: Hero(
              tag: data,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network("https://covers.openlibrary.org/b/isbn/" +
                    data['isbn'] +
                    "-M.jpg"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              data['name'],
              style: GoogleFonts.roboto(fontSize: 20),
            ),
          )
        ],
      )),
    );
  }
}
