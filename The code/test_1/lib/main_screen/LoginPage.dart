import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/choose_game_screen/game_catalog_screen.dart';
import 'package:test_1/main_screen/custom_backButton.dart';
import 'package:test_1/main_screen/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return; // The user canceled the sign-in
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'تم تسجيل الدخول بنجاح',
          message: '',
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      Navigator.of(context).pushNamedAndRemoveUntil(" MainMenu ", (route) => false);
    } catch (error) {
      print("Error during Google Sign-In: $error");
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'خطأ',
          message: 'حدث خطأ أثناء تسجيل الدخول باستخدام Google',
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/image/images/Login_Page_Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 65.0,
                  left: 16.0,
                  child: CustomBackButton(
                    onPressed: () {
                      Get.offNamedUntil(" MainMenu ", (route) => false);
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
                            image: AssetImage('lib/assets/image/images/main_CharacterTheme.png'),
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
                            labelText: 'البريد الإلكتروني',
                            labelStyle: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
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
                            labelStyle: GoogleFonts.tajawal(fontWeight: FontWeight.bold),
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      ElevatedButton(
                        child: Text(
                          'تسجيل دخول',
                          style: GoogleFonts.tajawal(fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () async {
                          if (_usernameController.text.isEmpty && _passwordController.text.isEmpty) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'خطأ',
                              desc: 'الرجاء كتابة البريد الإلكتروني و كلمة المرور',
                            ).show();
                          } else if (_usernameController.text != "" && _passwordController.text == "") {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'خطأ',
                              desc: 'الرجاء كتابة كلمة المرور',
                            ).show();
                          } else if (_usernameController.text == "" && _passwordController.text != "") {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'خطأ',
                              desc: 'الرجاء كتابة البريد الإلكتروني',
                            ).show();
                          } else {
                            try {
                              final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: _usernameController.text,
                                password: _passwordController.text,
                              );
                              if (credential.user!.emailVerified) {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  content: AwesomeSnackbarContent(
                                    title: 'تم تسجيل الدخول بنجاح',
                                    message: '',
                                    contentType: ContentType.success,
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(snackBar);

                                Navigator.of(context).pushReplacementNamed(" MainMenu ");
                              } else {
                                FirebaseAuth.instance.currentUser!.sendEmailVerification();
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.info,
                                  animType: AnimType.rightSlide,
                                  title: 'توثيق البريد الالكتروني',
                                  desc: 'الرجاء التوجه الى البريد الاكتروني للتحقق',
                                ).show();
                              }
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-email') {
                                print('No user found for that email.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'خطأ',
                                  desc: 'لا يوجد حساب مسجل بهذا البريد الالكتروني',
                                ).show();
                              } else if (e.code == 'invalid-credential') {
                                print('Wrong password provided for that user.');
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'خطأ',
                                  desc: 'البريد الإلكتروني او كلمة السر خطأ, الرجاء المحاولة مرة اخرى',
                                ).show();
                              }
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 300,
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                'سجل الدخول مع قوقل',
                                style: GoogleFonts.tajawal(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                          style: GoogleFonts.tajawal(fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "ما عندك حساب ؟ ",
                              style: GoogleFonts.tajawal(fontSize: 15.0, fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: " سجل الان",
                              style: GoogleFonts.tajawal(color: Colors.blue, fontSize: 17.0, fontWeight: FontWeight.bold),
                            )
                          ])),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          if (_usernameController.text == "") {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'خطأ',
                              desc: 'الرجاء كتابة البريد الاكتروني في حقل المستخدم',
                            ).show();
                            return;
                          }
                          try {
                            await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: _usernameController.text,
                            );
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              title: 'إعادة تعيين كلمة المرور',
                              desc: 'لقد تم ارسال على بريدك الالكتروني تعين كلمة مرور جديدة',
                            ).show();
                          } catch (e) {
                            print(e);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'خطأ',
                              desc: 'الرجاء التأكد من صحة البريد المدخل',
                            ).show();
                          }
                        },
                        child: Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: "نسيت  ",
                              style: GoogleFonts.tajawal(fontSize: 15.0, fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: "كلمة السر ؟",
                              style: GoogleFonts.tajawal(color: Colors.blue, fontSize: 16.0, fontWeight: FontWeight.bold),
                            )
                          ])),
                        ),
                      )
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
}
