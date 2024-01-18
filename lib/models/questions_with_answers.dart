import 'package:flutter/material.dart';

class QuestionWithAnswer {
  final String question;
  final List<Answer> answers;
  final String correctAnswer;
  String? selectedAnswer;

  QuestionWithAnswer({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}

class Answer {
  final int id;
  final String text;
  final IconData icon;

  Answer({required this.id, required this.text, required this.icon});
}

List<QuestionWithAnswer> questionsWithAnswers = [
  QuestionWithAnswer(
    question: 'Which company developed Flutter?',
    answers: [
      Answer(id: 0, text: 'Google', icon: Icons.business),
      Answer(id: 1, text: 'Facebook', icon: Icons.business),
      Answer(id: 2, text: 'Microsoft', icon: Icons.business),
      Answer(id: 3, text: 'Apple', icon: Icons.business),
    ],
    correctAnswer: 'Google',
  ),
  QuestionWithAnswer(
    question: 'Which programming language is Flutter built with?',
    answers: [
      Answer(
        id: 0,
        text: 'Java',
        icon: Icons.code,
      ),
      Answer(
        id: 1,
        text: 'Dart',
        icon: Icons.code,
      ),
      Answer(
        id: 2,
        text: 'Python',
        icon: Icons.code,
      ),
      Answer(
        id: 3,
        text: 'Swift',
        icon: Icons.code,
      ),
    ],
    correctAnswer: 'Dart',
  ),
  QuestionWithAnswer(
    question:
        'Which Flutter widget is used to create a scrollable list of widgets?',
    answers: [
      Answer(
        id: 0,
        text: 'ListView',
        icon: Icons.list,
      ),
      Answer(
        id: 1,
        text: 'GridView',
        icon: Icons.grid_on,
      ),
      Answer(
        id: 2,
        text: 'Column',
        icon: Icons.view_column,
      ),
      Answer(
        id: 3,
        text: 'Row',
        icon: Icons.view_week,
      ),
    ],
    correctAnswer: 'ListView',
  ),
  QuestionWithAnswer(
    question:
        'Which command is used to create a new Flutter project from the terminal? flutter',
    answers: [
      Answer(
        id: 0,
        text: 'start',
        icon: Icons.play_arrow,
      ),
      Answer(
        id: 1,
        text: 'create',
        icon: Icons.create,
      ),
      Answer(
        id: 2,
        text: 'build',
        icon: Icons.build,
      ),
      Answer(
        id: 3,
        text: 'new',
        icon: Icons.fiber_new,
      ),
    ],
    correctAnswer: 'create',
  ),
];
