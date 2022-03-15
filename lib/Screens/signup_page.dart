import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:Atheneum/Screens/home.dart';
import 'package:Atheneum/Screens/login_page.dart';
import 'package:Atheneum/models/user_model.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;

  final _fromkey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //NameField
    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        nameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person_outline),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    //EmailField
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.mail_outline_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    //PasswordField
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.lock_outline_rounded),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFEFEEEE),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            // color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(fontSize: 30),
                  ),
                ),
                Form(
                  key: _fromkey,
                  child: Column(
                    children: [
                      Neumorphic(
                        child: nameField,
                        style: const NeumorphicStyle(
                          color: Color(0xFFEFEEEE),
                        ),
                      ),
                      Neumorphic(
                        child: emailField,
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        style: const NeumorphicStyle(
                          color: Color(0xFFEFEEEE),
                        ),
                      ),
                      Neumorphic(
                        child: passwordField,
                        margin: const EdgeInsets.only(
                          top: 30,
                        ),
                        style: const NeumorphicStyle(
                          color: Color(0xFFEFEEEE),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(
                            top: 30,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: NeumorphicButton(
                              onPressed: () => signUp(emailController.text,
                                  passwordController.text),
                              child: Center(
                                child: Text(
                                  "Create Account",
                                  style: GoogleFonts.roboto(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              style: const NeumorphicStyle(
                                color: Color(0xFFEFEEEE),
                              ),
                            ),
                          )),
                      Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Have an account?"),
                              GestureDetector(
                                child: Text(
                                  " Log In",
                                  style: GoogleFonts.poppins(
                                    color: Colors.green.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogInPage())),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    userModel.email = user!.email;
    userModel.name = nameController.text;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());

    Fluttertoast.showToast(msg: "Account created");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }
}
