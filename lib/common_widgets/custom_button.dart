import 'package:flutter/material.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key,
      required this.label,
      this.onTap,
      this.height,
      this.backgroungColor,
      this.borderRadius});

  final String label;
  final void Function()? onTap;
  final double? height;
  final Color? backgroungColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height ?? 45 * SizeConfig.heightMultiplier!,
          width: double.infinity,
          decoration: BoxDecoration(
              color: backgroungColor ?? AppColors.kPrimaryOrange,
              borderRadius: BorderRadius.circular(borderRadius ?? 5),
              border: Border.all(width: 1, color: AppColors.black44)),
          child: Center(
              child: Text(
            label,
            style: AppTextStyle.black44_17w400,
          ))),
    );
  }
}
