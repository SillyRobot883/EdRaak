import 'package:flutter/material.dart';
import 'package:test_1/LoginPage.dart';
import 'package:test_1/The_game.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EdRaak',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EdRaak'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/Main_menu_Image.png'), // Replace with your actual image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70.0),
              ElevatedButton(
                  child: Text(
                    'العب',
                    style: GoogleFonts.tajawal(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => The_game()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // Set background color
                    primary: Colors.blue,
                    // Set text color
                    onPrimary: Colors.white,
                  )),
              ElevatedButton(
                child: Text(
                  'تسجيل دخول',
                  style: GoogleFonts.tajawal(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
