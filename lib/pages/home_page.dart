import 'package:flutter/material.dart';
import 'package:quiz_app/pages/start_quiz_screen.dart';
import 'package:quiz_app/shared/assets_images/assets_images.dart';
import 'package:quiz_app/utils/app_colors.dart';

class HomePage extends StatelessWidget {
    static const routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Image.asset(AssetsImages.homePageImage),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "Welcome To Our Quiz App",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Are You Ready To Start Flutter Quiz!",
            style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, StartQuizScreen.routeName);
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Click To Start',
                        style: TextStyle(color: AppColors.white, fontSize: 16),
                      ),
                      Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: AppColors.white,
                        size: 32,
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
