import 'package:Atheneum/Screens/home.dart';
import 'package:Atheneum/Screens/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _fromkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.mail_outline),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
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
                    "Log In",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                    ),
                  ),
                ),
                Form(
                  key: _fromkey,
                  child: Column(
                    children: [
                      Neumorphic(
                        child: emailField,
                        style: const NeumorphicStyle(
                          color: Color(0xFFEFEEEE),
                        ),
                      ),
                      Neumorphic(
                        child: passwordField,
                        margin: const EdgeInsets.only(
                          top: 20,
                        ),
                        style: const NeumorphicStyle(
                          color: Color(0xFFEFEEEE),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: NeumorphicButton(
                              onPressed: () => signIn(
                                emailController.text,
                                passwordController.text,
                              ),
                              child: Center(
                                child: Text(
                                  "LOG IN",
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
                          margin: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?"),
                              GestureDetector(
                                child: Text(
                                  " Sign Up",
                                  style: GoogleFonts.poppins(
                                    color: Colors.green.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage())),
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

  void signIn(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              Fluttertoast.showToast(msg: "login successful"),
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomeScreen()),(route) => false)
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e.message());
    });
  }
}
