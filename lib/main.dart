import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
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
  void checkAnswer(bool pickedAnswer) {
    bool correctAnswer = questionBank.getAnswer();

    setState(() {
      if (questionBank.isFinished() == true) {
        Alert(
          context: context,
          title: 'Completed',
          desc: 'You have completed the quiz.',
        ).show();

        questionBank.reset();

        scores = [];
      } else {
        if (pickedAnswer == correctAnswer) {
          scores.add(Icon(
            Icons.exposure_plus_1,
            color: Colors.blue,
          ));
        } else
          scores.add(Icon(
            Icons.exposure_zero,
            color: Colors.red,
          ));
      }
      questionBank.nextQuestion();
    });
  }

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
                checkAnswer(true);
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
                checkAnswer(false);
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
