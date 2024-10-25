import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKepper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.questionText,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: () {
                bool correctAnswer = quizBrain.answerText;
                if (correctAnswer == true) {
                  debugPrint('User got Right Answer!');
                } else {
                  debugPrint('User got Wrong Answer!');
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextButton(
              onPressed: () {
                bool correctAnswer = quizBrain.answerText;
                if (correctAnswer == false) {
                  debugPrint('User got Right Answer!');
                } else {
                  debugPrint('User got Wrong answer!');
                }
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('False'),
            ),
          ),
        ),
        Row(
          children: scoreKepper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
