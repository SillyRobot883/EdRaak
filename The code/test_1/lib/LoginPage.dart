import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/The_game.dart';
import 'package:test_1/main.dart';

void LoginPage1() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // TODO: Add authentication logic here (e.g., check against a database)

    // For demonstration purposes, just print the credentials
    print('Username: $username, Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "images/Login_Page_Background.png"), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                const Image(
                  image: AssetImage("images/main_CharacterTheme.png"),
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
                style: const TextStyle(
                  color: Colors.black,
                ),
                cursorColor: Colors.brown[400],
                decoration: InputDecoration(
                    labelText: 'اسم المستخدم',
                    labelStyle: GoogleFonts.tajawal(
                      fontWeight: FontWeight.bold,
                    ),
                    fillColor: Colors.white70,
                    filled: true),
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
                    labelStyle: GoogleFonts.tajawal(
                      fontWeight: FontWeight.bold,
                    ),
                    fillColor: Colors.white70,
                    filled: true),
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              child: Text(
                'تسجيل دخول',
                style: GoogleFonts.tajawal(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainApp(),
                    ),
                    (route) => false);
              },
            ),
            const SizedBox(height: 5.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => The_game()));
              },
              child: Text(
                'إلعب كـضيف',
                style: GoogleFonts.tajawal(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
