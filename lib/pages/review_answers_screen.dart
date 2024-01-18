import 'package:flutter/material.dart';
import 'package:quiz_app/utils/app_colors.dart';

import '../models/questions_with_answers.dart';

class ReviewAnswersScreen extends StatefulWidget {
  static const routeName = '/review-answers';

  const ReviewAnswersScreen({super.key});

  @override
  State<ReviewAnswersScreen> createState() => _ReviewAnswersScreenState();
}

class _ReviewAnswersScreenState extends State<ReviewAnswersScreen> {
  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Review Answers',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
          children: questionsWithAnswers
              .map((quizItem) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          quizItem.question,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: quizItem.answers
                                .map(
                                  (answer) => Container(
                                    child: Text(
                                      answer.text,
                                      style: const TextStyle(
                                          color: AppColors.white, fontSize: 16),
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color:
                                          answer.text == quizItem.correctAnswer
                                              ? AppColors.green
                                              : answer.text ==
                                                      quizItem.selectedAnswer
                                                  ? quizItem.selectedAnswer ==
                                                          quizItem.correctAnswer
                                                      ? AppColors.green
                                                      : AppColors.red
                                                  : AppColors.grey,
                                    ),
                                  ),
                                )
                                .toList()),
                        const SizedBox(
                          height: 16,
                        ),
                        const Divider(),
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
