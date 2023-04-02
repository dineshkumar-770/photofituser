import 'package:flutter/material.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';

class SignInAdvantagesListTile extends StatelessWidget {
  const SignInAdvantagesListTile(
      {super.key, required this.imagePath, required this.slogan});

  final String imagePath;
  final String slogan;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 60 * SizeConfig.heightMultiplier!,
          width: 60 * SizeConfig.widthMultiplier!,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          width: 200 * SizeConfig.widthMultiplier!,
          child: Text(
            slogan,
            overflow: TextOverflow.visible,
            style: TextStyle(fontSize: 16, wordSpacing: 2),
          ),
        )
      ],
    );
  }
}
