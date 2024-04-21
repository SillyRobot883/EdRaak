import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/game2/lib/data/questions.dart';
import 'package:test_1/game2/lib/questions_summary/questions_summary.dart';
import 'package:test_1/game2/lib/start_screen.dart';
import 'package:test_1/main.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart, 
  });

    

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answers': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_answers'] == data['correct_answer'];
    }).length;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ' لقد اجبت عدد $numCorrectAnswers من $numTotalQuestions  بشكل صحيح!',
                style: GoogleFonts.lalezar(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              QuestionsSummary(
                summaryData: summaryData,
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton.icon(
                onPressed: onRestart,
                icon: const Icon(
                  Icons.restart_alt_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  'اختبر نفسك مره اخرى! ',
                  style: GoogleFonts.amiri(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // Main Menu button pressed, navigate to the main menu
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainApp()),
                  );
                },
                child: Text(
                  'القائمة الرئيسية',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 159, 43, 170), 
                  backgroundColor: Color.fromARGB(255, 72, 35, 207), // Text color of the button
                 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
