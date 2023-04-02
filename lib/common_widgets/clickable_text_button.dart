import 'package:flutter/material.dart';
import 'package:photo_fit_user/constants/app_color.dart';


class Clickabletextbutton extends StatelessWidget {
  const Clickabletextbutton(
      {super.key, required this.staticText, required this.buttonText, required this.onTap});

  final String staticText;
  final String buttonText;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          staticText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: InkWell(
            onTap: onTap,
            child: Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.kPrimaryOrange),
            ),
          ),
        )
      ],
    );
  }
}
