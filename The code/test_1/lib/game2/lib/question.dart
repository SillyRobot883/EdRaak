import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/game2/lib/answer_button.dart';
import 'package:test_1/game2/lib/data/questions.dart';


/*
To recap I started in class Quiz because it is responsible for quiz screen.
  I created a list called "selectedAnswers = [];". 
    Then created a method called "chooseAnswer()", 
    that adds answers into that list.
      moved to class Questions.
        created a "onSelectAnswer" function that accepts String of answer.
          edited the method "answerQuestion" to make the State take
          in "onSelectAnswer(selectedAnswers)"
            which is later passed and returned into onPressed.
*/

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);

    setState(() {
      currentQuestionIndex++; // moving to next question
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // making it take all screen available.
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.amiri(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                  answer,
                  () {
                    answerQuestion(answer);
                  },
                );

                // making answers shuffled and mapped.
                // by using spreaded approach ( ' ... ' ).
              }),
              const Padding(padding: EdgeInsets.all(10)),
            ]),
      ),
    );
  }
}
