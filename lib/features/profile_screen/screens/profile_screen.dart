import 'package:flutter/material.dart';
import 'package:photo_fit_user/common_widgets/custom_button.dart';
import 'package:photo_fit_user/common_widgets/gap.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';
import 'package:photo_fit_user/constants/image_path.dart';
import 'package:photo_fit_user/features/profile_screen/widget/sign_in_advantages_listtile.dart';
import 'package:photo_fit_user/routes/named_routes.dart';

class ProfileScreenMain extends StatefulWidget {
  const ProfileScreenMain({super.key});

  @override
  State<ProfileScreenMain> createState() => _ProfileScreenMainState();
}

class _ProfileScreenMainState extends State<ProfileScreenMain> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: AppColors.kTransparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchItemsDelegate());
                },
                icon: const Icon(
                  Icons.search,
                  size: 25,
                  color: AppColors.black3E,
                ))
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff7EE8FA), Color(0xffEEC0C6)])),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 15 * SizeConfig.widthMultiplier!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              height: 200 * SizeConfig.heightMultiplier!,
                              width: 250 * SizeConfig.widthMultiplier!,
                              child: Image.asset(
                                AssetImagePath.mainLogo,
                                fit: BoxFit.fill,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const Gap(height: 10),
                  Text(
                    'Sign in for better \nexperience',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.black05_25w400,
                  ),
                  const Gap(height: 15),
                  CustomAppButton(
                    label: 'Sign in',
                    borderRadius: 12,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.loginscreen);
                    },
                  ),
                  const Gap(height: 15),
                  CustomAppButton(
                    label: 'Create account?',
                    borderRadius: 12,
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.registerScreen);
                    },
                    backgroungColor: AppColors.blue237,
                  ),
                  const Gap(height: 30),
                  const SignInAdvantagesListTile(
                    slogan:
                        'Enjoy better experience to find your favorite frames.',
                    imagePath: AssetImagePath.frameIcon,
                  ),
                  const Gap(height: 30),
                  const SignInAdvantagesListTile(
                    slogan:
                        'Track your all orders easily and more significantly.',
                    imagePath: AssetImagePath.checkList,
                  ),
                  const Gap(height: 30),
                  const SignInAdvantagesListTile(
                    slogan: 'Get delivery fast and safe at your doorstep.',
                    imagePath: AssetImagePath.devilery,
                  ),
                  const Gap(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchItemsDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Icon(Icons.close)];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Icon(Icons.arrow_back_ios);
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) => ListTile(
        title: Text('Search results Build $index'),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) => ListTile(
        title: Text('Search results Build $index'),
      ),
    );
  }
}
