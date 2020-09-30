import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  List<String> questions = [
    'Q1.Software is a product and can be manufactured using the same technologies used for other engineering artifacts',
    'Q2.Software engineering umbrella activities are only applied during the initial phases of software development projects.',
    'Q3. ahead for software reuse reduces the cost and increases the value of the systems into which they are incorporated.',
    'Q4.The essence of software engineering practice might be described as understand the problem, plan a solution, carry out the plan, and examine the result for accuracy.',
    'Q5.In agile process models the only deliverable work product is the working program.',
    'Q6.A most software development projects are initiated to try to meet some business need.',
    'Q7.In general software only succeeds if its behavior is consistent with the objectives of its designers.',
  ];

  List<bool> answers = [false, false, true, true, false, true, false];

  int qnum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: Center(
              child: Text(
                questions[qnum],
                style: TextStyle(fontSize: 20, color: Colors.black),
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
                bool correctAnswer = answers[qnum];
                if (correctAnswer == true) {
                  scores.add(Icon(
                    Icons.check,
                    color: Colors.blue,
                  ));
                } else
                  scores.add(Icon(
                    Icons.clear,
                    color: Colors.red,
                  ));

                setState(() {
                  qnum++;
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
                bool correctAnswer = answers[qnum];

                if (correctAnswer == false) {
                  scores.add(Icon(
                    Icons.check,
                    color: Colors.blue,
                  ));
                } else
                  scores.add(Icon(
                    Icons.clear,
                    color: Colors.red,
                  ));

                setState(() {
                  qnum++;
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
