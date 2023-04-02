import 'package:flutter/material.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';

class HorizontalGap extends StatelessWidget {
  const HorizontalGap({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * SizeConfig.widthMultiplier!,
    );
  }
}