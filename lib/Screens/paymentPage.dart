import 'package:Atheneum/Widgets/404.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class paymentPage extends StatelessWidget {
  paymentPage({Key? key}) : super(key: key);

  final TextEditingController cardNumController = TextEditingController();
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController mmController = TextEditingController();
  final TextEditingController yyController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cardNumField = TextFormField(
      autofocus: false,
      // obscureText: true,
      controller: cardNumController,
      onSaved: (value) {
        cardNumController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.numbers),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "CARD NUMBER",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    final holderNameField = TextFormField(
      autofocus: false,
      // obscureText: true,
      controller: holderNameController,
      onSaved: (value) {
        holderNameController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        prefixIcon: Icon(FeatherIcons.creditCard),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "CARD HOLDER NAME",
        hintStyle: TextStyle(
          fontSize: 15,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    final mmField = TextFormField(
      autofocus: false,
      // obscureText: true,
      controller: mmController,
      onSaved: (value) {
        mmController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.date_range),
        contentPadding: EdgeInsets.fromLTRB(10, 15, 20, 15),
        hintText: "MM",
        hintStyle: TextStyle(
          fontSize: 15,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    final yyField = TextFormField(
      autofocus: false,
      // obscureText: true,
      controller: yyController,
      onSaved: (value) {
        yyController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.date_range),
        contentPadding: EdgeInsets.fromLTRB(10, 15, 20, 15),
        hintText: "YY",
        hintStyle: TextStyle(
          fontSize: 15,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    final cvvField = TextFormField(
      autofocus: false,
      // obscureText: true,
      controller: cvvController,
      onSaved: (value) {
        cvvController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.numbers),
        contentPadding: EdgeInsets.fromLTRB(10, 15, 20, 15),
        hintText: "CVV",
        hintStyle: TextStyle(
          fontSize: 15,
        ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  child: Lottie.asset('assets/lottie/card.json'),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12)),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: cardNumField,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black12)),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: holderNameField,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12)),
                      margin: EdgeInsets.only(left: 20),
                      child: mmField,
                    ),
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12)),
                      margin: EdgeInsets.only(left: 20),
                      child: yyField,
                    ),
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black12)),
                      margin: EdgeInsets.only(left: 20),
                      child: cvvField,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 125, 221, 154),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: Color.fromARGB(255, 243, 243, 243),
                            elevation: 0,
                            iconTheme: IconThemeData(color: Colors.black),
                          ),
                          body: errorPage(),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "PAY NOW",
                    style: GoogleFonts.poppins(),
                  ),
                ),
                SizedBox(height: 200,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FeatherIcons.info,
                      size: 15,
                      color: Colors.black26,
                    ),
                    SizedBox(width: 7,),
                    Text("Payment system is not active at the moment",
                        style: GoogleFonts.poppins(color: Colors.black26, fontSize: 12))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
