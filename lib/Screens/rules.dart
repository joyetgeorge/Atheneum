import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class rulesPage extends StatelessWidget {
  const rulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Center(
                  child: Text(
                "Guidelines",
                style: GoogleFonts.poppins(fontSize: 20),
              )),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Students should maintain absolute silence and seriousness in the library.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Library is open from 8.30 a.m. to 6.30 p.m. on all working days and from 8.30 a.m. to 12.30 p.m. on all Saturdays except second Saturday.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Identity card is a must for all library transactions. ID cards are non-transferable.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Users should login in ‘library user log entry in the computer at the entrance before entering the library and logout while leaving the library.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Students should maintain absolute silence and seriousness in the library.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Users should keep their belongings in the property counter before entering the library.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Personal books /printed reading materials, issued books (except return/re-issue purpose) are not allowed inside the library.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Time of book circulation will be from 9.00 am to 5.00 pm.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Four books are issued at a time to postgraduate students, three books to the third year UG students and two books each to the second and the first year UG students.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Students should maintain absolute silence and seriousness in the library.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Books are issued to the members for 14 days and can be renewed only once.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "A fine of one rupee per day per volume will be charged, if books are not returned or renewed on time.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "A particular title once issued cannot be issued for a second consecutive borrowing period, unless sufficient numbers of copies of the same title are available.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "If the due date of a book falls on a holiday for the library, the next working day will be taken as the due date.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "No member will be allowed to borrow books until the dues, if any, are cleared.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Absence from the college will not be deemed as an excuse for delay in the return of books.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Reference books, journals and periodicals are not issued on loan.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Any sort of marking or underlying on pages and removing pages of books are absolutely forbidden.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Under special circumstances, librarian may not issue books or retrieve the books already issued from any member without assigning any reason thereof.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "The entry to the library will be restricted to Don Bosco college students and staff only.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Any violation of the library rules and regulations will result in disciplinary process including cancellation of library membership.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Users are not permitted to chew or consume food items in the library.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Every user must return the books/journals in its original place after its use has been served.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Library furniture, fittings or equipment should not be tampered with, or their arrangements altered.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Rudeness to library staff and other library users will be subjected to disciplinary action.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(167, 255, 60, 0),
                      style: BorderStyle.solid,
                      width: 4
                      ),
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      child: Text(
                          "Any damage or defacement of library materials is strictly prohibited and users found damaging material will have to follow disciplinary procedures. Library users are to report any instances of such defacement to library staff.", style: GoogleFonts.poppins(fontSize: 15),))
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
