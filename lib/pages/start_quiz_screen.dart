import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/congratulation_screen.dart';
import 'package:quiz_app/utils/app_colors.dart';

import '../models/questions_with_answers.dart';
import '../widgets/answer_item.dart';

class StartQuizScreen extends StatefulWidget {
  static const routeName = '/start-quiz';

  const StartQuizScreen({super.key});

  @override
  State<StartQuizScreen> createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  int questionIndex = 0;

  int score = 0;

  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.grey,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  questionsWithAnswers[questionIndex].question,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Answer and get points',
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 36),
                Row(
                  children: [
                    Text(
                      'Step ${questionIndex + 1}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ' of ${questionsWithAnswers.length}',
                      style: TextStyle(fontSize: 16, color: AppColors.grey),
                    ),
                  ],
                ),
                Divider(
                  height: 4,
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 36),
                Column(
                  children: questionsWithAnswers[questionIndex]
                      .answers
                      .map((answer) => AnswerItem(
                            answer: answer,
                            selectedAnswer: questionsWithAnswers[questionIndex]
                                .selectedAnswer,
                            onTap: () {
                              setState(() {
                                questionsWithAnswers[questionIndex]
                                    .selectedAnswer = answer.text;
                              });
                            },
                          ))
                      .toList(),
                ),
                const Spacer(),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      questionIndex != 0
                          ? ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (questionIndex > 0) {
                                    questionIndex--;
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.black,
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Row(children: [
                                Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('Prev'),
                              ]))
                          : const SizedBox(),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  final questionObj =
                                      questionsWithAnswers[questionIndex];
                                  if (questionObj.selectedAnswer == null) {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                      title: 'Select Answer Please',
                                      btnOkOnPress: () {},
                                    ).show();
                                  } else {
                                    if (questionObj.selectedAnswer ==
                                        questionObj.correctAnswer) {
                                      score++;
                                    }
                                    if (questionIndex <
                                        questionsWithAnswers.length - 1) {
                                      questionIndex++;
                                    } else {
                                      isFinished = true;
                                      Navigator.of(context).pushNamed(
                                          CongratulationScreen.routeName,
                                          arguments: score);
                                    }
                                  }
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.black,
                                foregroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(children: [
                                questionIndex != questionsWithAnswers.length - 1
                                    ? const Text('Next')
                                    : const Text('Finish'),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 16,
                                ),
                              ]))
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ));
  }
}
