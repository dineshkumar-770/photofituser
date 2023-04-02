import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/constants/app_color.dart';

class AppTextStyle {
  static TextStyle primaryBlue14w500 = GoogleFonts.outfit(
      color: AppColors.kPrimaryOrange,
      fontSize: 20 * SizeConfig.textMultiplier!,
      fontWeight: FontWeight.w500);
  static TextStyle primaryBlue_25w600 = GoogleFonts.outfit(
    fontSize: 25 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w600,
    color: AppColors.kPrimaryOrange,
  );
  static TextStyle black05_25w400 = GoogleFonts.outfit(
    fontSize: 25 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: AppColors.black05,
  );
  static TextStyle black44_17w400 = GoogleFonts.outfit(
    fontSize: 17 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.black44,
  );
  static TextStyle regularGrey14w400 = GoogleFonts.outfit(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle regularGrey16w400 = GoogleFonts.outfit(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
  static TextStyle regularBlack16w400 = GoogleFonts.outfit(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.black3E,
  );
  static TextStyle regularGrey18w400 = GoogleFonts.outfit(
    color: AppColors.grey,
    fontWeight: FontWeight.w400,
    fontSize: (18) * SizeConfig.textMultiplier!,
  );
  static TextStyle regularBlack22w400 = GoogleFonts.outfit(
    color: AppColors.black05,
    fontWeight: FontWeight.w400,
    fontSize: (22) * SizeConfig.textMultiplier!,
  );
  static TextStyle regularBlack21w400 = GoogleFonts.outfit(
    color: AppColors.black05,
    fontWeight: FontWeight.w400,
    fontSize: (21) * SizeConfig.textMultiplier!,
  );
  static TextStyle semiBoldBlack12w400 = GoogleFonts.outfit(
    color: AppColors.black05,
    fontWeight: FontWeight.w500,
    fontSize: (12) * SizeConfig.textMultiplier!,
  );
  static TextStyle regularBlack14w400 = GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    color: const Color(0xFFBAC2C7),
    fontSize: 14 * SizeConfig.textMultiplier!,
  );
  static TextStyle regularBlack0514w400 = GoogleFonts.outfit(
    fontWeight: FontWeight.w400,
    color:  AppColors.black05,
    fontSize: 14 * SizeConfig.textMultiplier!,
  );
}
