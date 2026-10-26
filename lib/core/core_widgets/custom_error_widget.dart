import 'package:flutter/material.dart';
import 'package:fresh_market/core/helper/spacing.dart';
import 'package:fresh_market/core/style/app_colors.dart';
import 'package:lottie/lottie.dart';
import 'package:fresh_market/core/helper/common_imports.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;
  const CustomErrorWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/animations/error_animation.json",
            width: MediaQuery.sizeOf(context).width * .8,
          ),
          verticalSpace(16),
          Text(
            title,
            style: TextStyle(
              color: AppColors.textDark,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
