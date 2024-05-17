import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/game2/lib/question.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/assets/image/image1.png',
            width: 350,
          ),
          const SizedBox(height: 10),
          Text(
            "! اللعب و تحدى نفسك",
            style: GoogleFonts.amiri(
                color: const Color.fromARGB(255, 226, 226, 226),
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 217, 54, 109),
                foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt_outlined),
            label: Text(
              'ابدأ',
              style:
                  GoogleFonts.amiri(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
