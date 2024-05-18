import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/choose_game_screen/game_catalog_screen.dart';
import 'package:test_1/main_screen/custom_backButton.dart';
import 'package:test_1/main_screen/main_app.dart';
import '../game1/The_game.dart';
import 'package:test_1/main_screen/signup.dart';
import 'package:test_1/main.dart';
import 'package:test_1/components/custombuttonauth.dart';
import 'package:test_1/components/customlogoauth.dart';
import 'package:test_1/components/textformfield.dart';
import 'package:google_sign_in/google_sign_in.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // TODO: Add authentication logic here (e.g., check against a database)
    print('Username: $username, Password: $password');
  }

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return;
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(" MainMenu ", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/assets/image/images/Login_Page_Background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 65.0,
            left: 16.0,
            child: CustomBackButton(
              onPressed: () {
                Get.offAll(() => MainApp(),
                    transition: Transition.rightToLeft,
                    duration: Duration(milliseconds: 400));
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const Image(
                      image: AssetImage(
                          'lib/assets/image/images/main_CharacterTheme.png'),
                      height: 150,
                      width: 150,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 130, left: 30),
                      child: Text(
                        'إدراك',
                        style: GoogleFonts.tajawal(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  child: TextField(
                    controller: _usernameController,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.brown[400],
                    decoration: InputDecoration(
                      labelText: 'اسم المستخدم',
                      labelStyle:
                          GoogleFonts.tajawal(fontWeight: FontWeight.bold),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    cursorColor: Colors.brown[400],
                    decoration: InputDecoration(
                      labelText: 'كلمة السر',
                      labelStyle:
                          GoogleFonts.tajawal(fontWeight: FontWeight.bold),
                      fillColor: Colors.white70,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  child: Text(
                    'تسجيل دخول',
                    style: GoogleFonts.tajawal(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _usernameController.text,
                              password: _passwordController.text);
                      if (credential.user!.emailVerified) {
                        Navigator.of(context)
                            .pushReplacementNamed(" MainMenu ");
                      } else {
                        FirebaseAuth.instance.currentUser!
                            .sendEmailVerification();
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.info,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'الرجاء التوجه الى البريد الاكتروني للتحقق',
                        ).show();
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'No user found for that email.',
                        ).show();
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc: 'Wrong password provided for that user.',
                        ).show();
                      }
                    }
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login with Google',
                        style: GoogleFonts.tajawal(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        "images/Google_Logo.jpg",
                        width: 50,
                      )
                    ],
                  ),
                  onPressed: () {
                    signInWithGoogle();
                  },
                ),
                const SizedBox(height: 10.0),
                const SizedBox(height: 5.0),
                ElevatedButton(
                  onPressed: () {
                    Get.off(() => GameCatalog(),
                        transition: Transition.zoom,
                        duration: Duration(milliseconds: 300));
                  },
                  child: Text(
                    'إلعب كـضيف',
                    style: GoogleFonts.tajawal(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(height: 10),
                // Text(
                //   "Don't have an Account ? Regsister",
                //   textAlign: TextAlign.center,
                // )
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: const Center(
                      child: Text.rich(TextSpan(children: [
                    TextSpan(text: "Don't have an Account ?"),
                    TextSpan(
                        text: " Regsister",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold))
                  ]))),
                ),
                InkWell(
                  onTap: () async {
                    if (_usernameController.text == "") {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.info,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'الرجاء كتابة البريد الاكتروني في حقل المستخدم',
                      ).show();
                      return;
                    }
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: _usernameController.text);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Password reset sent',
                        desc:
                            'لقد تم ارسال على بريدك الالكتروني تعين كلمة مرور جديدة',
                      ).show();
                    } catch (e) {
                      print(e);
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'الرجاء التأكد من صحة البريد المدخل',
                      ).show();
                    }
                  },
                  child: const Center(
                      child: Text.rich(TextSpan(children: [
                    TextSpan(text: "Forget the  "),
                    TextSpan(
                        text: "password ?",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold))
                  ]))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
