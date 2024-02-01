import 'package:flutter/material.dart';
import 'package:test_1/main.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final VoidCallback onRetryPressed;

  ResultPage({required this.score, required this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/Reslutimage.png'), // Replace with your actual image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'نقاطك: $score',
                style: GoogleFonts.tajawal(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 60.0),
              ElevatedButton(
                onPressed: () {
                  // Retry button pressed, restart the game
                  onRetryPressed();
                  Navigator.pop(context);
                },
                child: Text(
                  'إعادة',
                  style: GoogleFonts.tajawal(
                      fontSize: 27.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  // Main Menu button pressed, navigate to the main menu
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainApp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  // Set background color
                  primary: Colors.blue,
                  // Set text color
                  onPrimary: Colors.white,
                  // Set minimum width and height for the button
                  minimumSize: Size(224, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'الصفحة الرئيسية',
                  style: GoogleFonts.tajawal(
                      fontSize: 27.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
