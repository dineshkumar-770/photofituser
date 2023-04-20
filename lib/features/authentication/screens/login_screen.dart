import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_fit_user/common_widgets/clickable_text_button.dart';
import 'package:photo_fit_user/common_widgets/gap.dart';
import 'package:photo_fit_user/common_widgets/horizontal_gap.dart';
import 'package:photo_fit_user/common_widgets/loading_animation.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/config/utils/helper_validation.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';
import 'package:photo_fit_user/constants/image_path.dart';
import 'package:photo_fit_user/features/authentication/controller/auth_notifier.dart';
import 'package:photo_fit_user/features/authentication/controller/auth_states.dart';
import 'package:photo_fit_user/features/authentication/widgets/custom_text_field.dart';
import 'package:photo_fit_user/routes/named_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10 * SizeConfig.widthMultiplier!),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 200 * SizeConfig.heightMultiplier!,
                      width: 300 * SizeConfig.widthMultiplier!,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/logo/logo.png'),
                              fit: BoxFit.cover)),
                    ),
                    Text('Let\'s get started !',
                        style: AppTextStyle.primaryBlue14w500),
                    SizedBox(
                      height: 20 * SizeConfig.heightMultiplier!,
                    ),
                    NormalCustomTextField(
                      controller: emailController,
                      label: 'Email',
                      hint: 'Enter your email',
                      isPasswordField: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email can\'t be empty!';
                        } else if (HelperFunction.validateEmail(value) ==
                            false) {
                          return 'Enter a valid email to continue';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20 * SizeConfig.heightMultiplier!,
                    ),
                    NormalCustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      hint: 'Enter your password',
                      isPasswordField: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password can\'t be empty!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20 * SizeConfig.heightMultiplier!,
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(authProvider);
                        ref.listen(authProvider, (previous, next) {
                          if (next is SignInSuccessState) {
                            Navigator.pushReplacementNamed(
                                context, RoutesName.rootScreen);
                          }
                          if (next is SignInErrorState) {
                            Fluttertoast.showToast(msg: next.errorMessage);
                          }
                        });
                        if (state is SignInLoadingState) {
                          return SizedBox(
                            height: 45 * SizeConfig.heightMultiplier!,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryOrange,
                              ),
                              onPressed: () {},
                              child: SizedBox(
                                height: 45 * SizeConfig.heightMultiplier!,
                                width: double.infinity,
                                child: const CustomLoader(),
                              ),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 45 * SizeConfig.heightMultiplier!,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryOrange,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ref.read(authProvider.notifier).signIn(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              child: SizedBox(
                                  height: 45 * SizeConfig.heightMultiplier!,
                                  width: double.infinity,
                                  child: const Center(child: Text('Sign In'))),
                            ),
                          );
                        }
                      },
                    ),
                    const Gap(height: 15),
                    const Divider(
                      thickness: 1.5,
                    ),
                    const Gap(height: 15),
                    Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(authProvider);
                        ref.listen(authProvider, (previous, next) {
                          if (next is GoogleSignInSuccessState) {
                            Navigator.pushReplacementNamed(
                                context, RoutesName.rootScreen);
                          }
                          if (next is GoogleSignInErrorState) {
                            Fluttertoast.showToast(
                                msg: 'Google Sign in cancelled by User');
                          }
                        });
                        if (state is GoogleSignInLoadingState) {
                          return SizedBox(
                            height: 45 * SizeConfig.heightMultiplier!,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryOrange,
                              ),
                              onPressed: () {},
                              child: SizedBox(
                                height: 45 * SizeConfig.heightMultiplier!,
                                width: double.infinity,
                                child: const CustomLoader(),
                              ),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 45 * SizeConfig.heightMultiplier!,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryOrange,
                              ),
                              onPressed: () {
                                ref
                                    .read(authProvider.notifier)
                                    .signInWithGoogle();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    AssetImagePath.googleLogo,
                                    height: 25 * SizeConfig.heightMultiplier!,
                                    width: 25 * SizeConfig.widthMultiplier!,
                                  ),
                                  const HorizontalGap(width: 5),
                                  const Text('Sign in with Google'),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    Clickabletextbutton(
                      buttonText: 'Sign Up',
                      staticText: 'Don\'t have an account? ',
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.registerScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
