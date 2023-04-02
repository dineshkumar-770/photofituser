import 'package:flutter/material.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';

class Gap extends StatelessWidget {
  const Gap({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * SizeConfig.heightMultiplier!,
    );
  }
}