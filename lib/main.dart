import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: const Text("Quiz App"),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        body: QuizPage(),
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
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool myAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();

    setState(() {
      if (myAnswer == correctAnswer) {
        scoreKeeper.add(
          const Icon(
            size: 35.0,
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          const Icon(
            size: 35.0,
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 27.0, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                checkAnswer(true);
              },
              color: Colors.green,
              child: const Text(
                "True",
                style: TextStyle(fontSize: 27.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                checkAnswer(false);
              },
              color: Colors.red[600],
              child: const Text(
                "False",
                style: TextStyle(fontSize: 27.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Wrap(children: [
          Row(
            children: scoreKeeper,
          ),
        ]),
      ],
    );
  }
}
