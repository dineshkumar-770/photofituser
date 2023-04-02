import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_fit_user/common_widgets/flutter_toast.dart';
import 'package:photo_fit_user/common_widgets/loading_animation.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';
import 'package:photo_fit_user/constants/image_path.dart';
import 'package:photo_fit_user/features/Home/widgets/slider_showcase.dart';
import 'package:photo_fit_user/features/authentication/cubit/authentication_cubit.dart';
import 'package:photo_fit_user/features/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:photo_fit_user/routes/named_routes.dart';
import 'package:photo_fit_user/sample_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  late AuthenticationCubit authenticationCubit;

  @override
  void initState() {
    super.initState();
    authenticationCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: AppColors.kPureWhite,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                _key.currentState?.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: AppColors.black3E,
              )),
        ),
        drawer: Drawer(
          width: 300 * SizeConfig.widthMultiplier!,
          child: Column(
            children: [
              BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                  if (state is SignOutSuccessfullyState) {
                    Navigator.pushReplacementNamed(
                        context, RoutesName.loginscreen);
                  }
                  if (state is SignOutFailedState) {
                    Toast.showToast(state.errMsg);
                  }
                },
                builder: (context, state) {
                  if (state is SignOutLoadingState) {
                    return const CustomLoader();
                  }
                  return ListTile(
                    leading: const Icon(Icons.logout_outlined),
                    title: const Text('Sign Out'),
                    onTap: () {
                      authenticationCubit.userSignOut();
                    },
                  );
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SliderShowCaseWidget(),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Shop More',
                  style: AppTextStyle.primaryBlue14w500,
                ),
                const SizedBox(
                  height: 15,
                ),
                const ProductCard(
                  discount: 99,
                  price: 1299,
                  freeDelivery: false,
                  imageUrl: AssetImagePath.frameOne,
                  rating: 4.7,
                  title: 'The Photo frame for your family pics',
                  deliveryCharges: 60,
                ),
                const SizedBox(
                  height: 15,
                ),
                const ProductCard(
                  discount: 100,
                  price: 899,
                  freeDelivery: true,
                  imageUrl: AssetImagePath.frameTwo,
                  rating: 4.2,
                  title: 'The Photo frame for your family pics',
                  deliveryCharges: 60,
                ),
                const SizedBox(
                  height: 15,
                ),
                const ProductCard(
                  discount: 150,
                  price: 999,
                  freeDelivery: true,
                  imageUrl: AssetImagePath.frameThree,
                  rating: 4.2,
                  title: 'The Photo frame for your family pics',
                  deliveryCharges: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
