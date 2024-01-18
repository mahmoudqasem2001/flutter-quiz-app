import 'package:flutter/material.dart';
import 'package:quiz_app/pages/congratulation_screen.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/review_answers_screen.dart';

import 'pages/start_quiz_screen.dart';

Map<String, WidgetBuilder> routes() {
  return {
    StartQuizScreen.routeName: (_) => const StartQuizScreen(),
    CongratulationScreen.routeName: (_) => const CongratulationScreen(),
    HomePage.routeName: (_) => const HomePage(),
    ReviewAnswersScreen.routeName: (_) => const ReviewAnswersScreen(),
  };
}
