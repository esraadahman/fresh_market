import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_market/core/helper/common_imports.dart';
import 'package:fresh_market/core/style/app_colors.dart';

class CustomColoredTextButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? color;
  final enableBorder = false;
  final TextStyle? buttonTextStyle;
  final Color? backgroundColor;
  final void Function()? onTap;

  const CustomColoredTextButton({
    super.key,
    required this.text,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.buttonTextStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 60.h,
        width: width ?? MediaQuery.sizeOf(context).width - 120.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: color ?? AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style:
                buttonTextStyle ??
                TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
            //   AppTextStyles.font18W500.copyWith( , color: Colors.white),
          ),
        ),
      ),
    );
  }
}
