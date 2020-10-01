import 'package:flutter/material.dart';
import 'package:quizzler/question_answer.dart';

class QuestionBank {
  int _qnum = 0;
  List<QuestionAnswer> _questions = [
    QuestionAnswer(
        'Q1.Software is roduct and can be manufactured using the same technologies used for other engineering artifacts',
        false),
    QuestionAnswer(
        'Q2.Software engineering umbrella activities are only applied during the initial phases of software development projects.',
        false),
    QuestionAnswer(
        'Q3. ahead for software reuse reduces the cost and increases the value of the systems into which they are incorporated.',
        true),
    QuestionAnswer(
        'Q4.The essence of software engineering practice might be described as understand the problem, plan olution, carry out the plan, and examine the result for accuracy.',
        true),
    QuestionAnswer(
        'Q5.In agile process models the only deliverable work product is the working program.',
        false),
    QuestionAnswer(
        'Q6.A most software development projects are initiated to try to meet some business need.',
        true),
    QuestionAnswer(
        'Q7.In general software only succeeds if its behavior is consistent with the objectives of its designers.',
        false),
  ];

  void nextQuestion() {
    if (_qnum < _questions.length - 1) {
      _qnum++;
    }
  }

  String getQuestions() {
    return _questions[_qnum].question;
  }

  bool getAnswer() {
    return _questions[_qnum].answer;
  }

  bool isFinished() {
    if (_qnum >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _qnum = 0;
  }
}
