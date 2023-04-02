import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/loader.json',
        animate: true,
        height: 150 * SizeConfig.heightMultiplier!,
        width: 150 * SizeConfig.widthMultiplier!,
        addRepaintBoundary: true);
  }
}
