import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';
import 'package:photo_fit_user/features/Home/screens/home_page.dart';
import 'package:photo_fit_user/features/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:photo_fit_user/features/profile_screen/screens/profile_screen.dart';
import 'package:photo_fit_user/features/user_details/screens/userdetails_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late NavigationBarCubit navigationBarCubit;

  @override
  void initState() {
    super.initState();
    navigationBarCubit = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBarCubit, NavigationState>(
        builder: (context, state) {
          if (state.navBarItems == NavBarItems.home) {
            return const HomePage();
          } else if (state.navBarItems == NavBarItems.cart) {
            return Center(
              child: Text(
                'Cart Screen',
                style: AppTextStyle.primaryBlue14w500,
              ),
            );
          } else if (state.navBarItems == NavBarItems.profile) {
            return FirebaseAuth.instance.currentUser != null
                ? Center(
                    child: Text(
                      'You Signed In Successfully',
                      style: AppTextStyle.primaryBlue14w500,
                    ),
                  )
                : const ProfileScreenMain();
          } else if (state.navBarItems == NavBarItems.settings) {
            return const UserDetailsScreen();
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBarCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
              elevation: 20,
              landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
              currentIndex: state.index,
              showSelectedLabels: true,
              enableFeedback: true,
              selectedItemColor: AppColors.kPrimaryOrange,
              onTap: (value) {
                if (value == 0) {
                  navigationBarCubit.getNavBarItems(NavBarItems.home);
                } else if (value == 1) {
                  navigationBarCubit.getNavBarItems(NavBarItems.cart);
                } else if (value == 2) {
                  navigationBarCubit.getNavBarItems(NavBarItems.profile);
                } else if (value == 3) {
                  navigationBarCubit.getNavBarItems(NavBarItems.settings);
                }
              },
              items: const [
                BottomNavigationBarItem(
                  tooltip: 'Home',
                  activeIcon: Icon(
                    Icons.grid_view_rounded,
                    color: AppColors.kPrimaryOrange,
                  ),
                  icon: Icon(
                    Icons.grid_view,
                    color: AppColors.black3E,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.shop_2,
                    color: AppColors.kPrimaryOrange,
                  ),
                  icon: Icon(
                    Icons.shop_2_outlined,
                    color: AppColors.black3E,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  activeIcon:
                      Icon(Icons.person, color: AppColors.kPrimaryOrange),
                  icon: Icon(Icons.person_2_outlined, color: AppColors.black3E),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  activeIcon:
                      Icon(Icons.settings, color: AppColors.kPrimaryOrange),
                  icon: Icon(Icons.settings_outlined, color: AppColors.black3E),
                  label: 'Settings',
                ),
              ]);
        },
      ),
    );
  }
}
