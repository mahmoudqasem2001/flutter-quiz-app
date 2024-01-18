import 'package:flutter/material.dart';
import 'package:quiz_app/utils/app_colors.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  const MainButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.black,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(text),
        ),
      ],
    );
  }
}
