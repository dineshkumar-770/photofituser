import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_fit_user/common_widgets/gap.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';
import 'package:photo_fit_user/constants/image_path.dart';

class SliderShowCaseWidget extends StatelessWidget {
  const SliderShowCaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 241, 246),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(blurRadius: 5, color: AppColors.grey, spreadRadius: 2)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'New Arrival',
                style: AppTextStyle.primaryBlue14w500,
              ),
            ),
            const Gap(height: 10),
            CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage(AssetImagePath.slideOne),
                            fit: BoxFit.fill)),
                    child:
                        Image.asset(AssetImagePath.slideOne, fit: BoxFit.fill),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage(AssetImagePath.slideOne),
                            fit: BoxFit.fill)),
                    child:
                        Image.asset(AssetImagePath.slideTwo, fit: BoxFit.fill),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage(AssetImagePath.slideOne),
                            fit: BoxFit.fill)),
                    child: Image.asset(AssetImagePath.frameThree,
                        fit: BoxFit.fill),
                  ),
                ],
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  animateToClosest: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                )),
          ],
        ),
      ),
    );
  }
}
