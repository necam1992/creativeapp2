import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/questionbank.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scores = [];

  QuestionBank questionBank = QuestionBank();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child: Center(
              child: Card(
                margin: EdgeInsets.symmetric(),
                clipBehavior: Clip.hardEdge,
                child: Text(
                  questionBank.getQuestions(),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.blue,
              onPressed: () {
                bool correctAnswer = questionBank.getAnswer();
                if (correctAnswer == true) {
                  scores.add(Icon(
                    Icons.exposure_plus_1,
                    color: Colors.blue,
                  ));
                } else
                  scores.add(Icon(
                    Icons.exposure_zero,
                    color: Colors.red,
                  ));

                setState(() {
                  questionBank.nextQuestion();
                });
              },
              child: Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                bool correctAnswer = questionBank.getAnswer();

                if (correctAnswer == false) {
                  scores.add(Icon(
                    Icons.exposure_plus_1,
                    color: Colors.blue,
                  ));
                } else
                  scores.add(Icon(
                    Icons.exposure_zero,
                    color: Colors.red,
                  ));

                setState(() {
                  questionBank.nextQuestion();
                });
              },
              child: Text(
                'False',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: scores,
        )
      ],
    );
  }
}
