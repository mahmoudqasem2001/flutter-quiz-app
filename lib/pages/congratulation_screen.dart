import 'package:flutter/material.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/review_answers_screen.dart';
import 'package:quiz_app/shared/assets_images/assets_images.dart';

import '../models/questions_with_answers.dart';
import '../utils/app_colors.dart';

class CongratulationScreen extends StatefulWidget {
  static const routeName = '/congratulation';

  const CongratulationScreen({super.key});

  @override
  State<CongratulationScreen> createState() => _CongratulationScreenState();
}

class _CongratulationScreenState extends State<CongratulationScreen> {
  @override
  Widget build(BuildContext context) {
    final score = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 48),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
                child: Image.asset(AssetsImages.congratulationImage),
              ),
              const Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Your score: $score/${questionsWithAnswers.length}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                style:
                    TextButton.styleFrom(backgroundColor: Colors.grey.shade200),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ReviewAnswersScreen.routeName);
                },
                child: const Text(
                  'Review Correct Answers',
                  style: TextStyle(color: AppColors.green, fontSize: 16),
                ),
              ),
              const Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    questionsWithAnswers
                        .map((answer) => answer.selectedAnswer = null);
                        
                  });

                  Navigator.of(context)
                      .pushReplacementNamed(HomePage.routeName);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Back To HomePage',
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
