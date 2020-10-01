import 'package:quizzler/question_answer.dart';

class QuestionBank {
  int _qnum = 0;
  List<QuestionAnswer> _questions = [
    QuestionAnswer(
        q: 'Q1.Software is a product and can be manufactured using the same technologies used for other engineering artifacts',
        a: false),
    QuestionAnswer(
        q: 'Q2.Software engineering umbrella activities are only applied during the initial phases of software development projects.',
        a: false),
    QuestionAnswer(
        q: 'Q3. ahead for software reuse reduces the cost and increases the value of the systems into which they are incorporated.',
        a: true),
    QuestionAnswer(
        q: 'Q4.The essence of software engineering practice might be described as understand the problem, plan a solution, carry out the plan, and examine the result for accuracy.',
        a: true),
    QuestionAnswer(
        q: 'Q5.In agile process models the only deliverable work product is the working program.',
        a: false),
    QuestionAnswer(
        q: 'Q6.A most software development projects are initiated to try to meet some business need.',
        a: true),
    QuestionAnswer(
        q: 'Q7.In general software only succeeds if its behavior is consistent with the objectives of its designers.',
        a: false),
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
}
