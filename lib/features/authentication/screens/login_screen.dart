import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_fit_user/common_widgets/clickable_text_button.dart';
import 'package:photo_fit_user/common_widgets/custom_textoform_field.dart';
import 'package:photo_fit_user/common_widgets/flutter_toast.dart';
import 'package:photo_fit_user/common_widgets/gap.dart';
import 'package:photo_fit_user/common_widgets/horizontal_gap.dart';
import 'package:photo_fit_user/common_widgets/loading_animation.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/config/utils/helper_validation.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';
import 'package:photo_fit_user/constants/image_path.dart';
import 'package:photo_fit_user/features/authentication/cubit/authentication_cubit.dart';
import 'package:photo_fit_user/features/authentication/widgets/custom_text_field.dart';
import 'package:photo_fit_user/features/navigation_bar/screen/navbar.dart';
import 'package:photo_fit_user/features/user_details/widgets/form_textfield.dart';
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
  late AuthenticationCubit authenticationCubit;

  @override
  void initState() {
    super.initState();
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
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
                      hint: 'enter your email',
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
                      hint: 'enter your password',
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
                    BlocConsumer<AuthenticationCubit, AuthenticationState>(
                      listener: (context, state) {
                        if (state is LoginSuccessfullState) {
                          Navigator.pushReplacementNamed(
                              context, RoutesName.rootScreen);
                        }
                        if (state is LoginErrorState) {
                          Toast.showToast(state.errorMessage);
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoadingState) {
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
                                    authenticationCubit.userSignIn(
                                        email: emailController.text.trim(),
                                        password: passwordController.text);
                                  }
                                },
                                child: const Text('Sign In')),
                          );
                        }
                      },
                    ),
                    const Gap(height: 15),
                    const Divider(
                      thickness: 1.5,
                    ),
                    const Gap(height: 15),
                    BlocConsumer<AuthenticationCubit, AuthenticationState>(
                      listener: (context, state) {
                        if (state is GoogleSignInSuccessState) {
                          Navigator.pushReplacementNamed(
                              context, RoutesName.rootScreen);
                        } else if (state is GoogleSignInErrorState) {
                          Toast.showToast(state.errorMessage);
                        }
                      },
                      builder: (context, state) {
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
                                authenticationCubit.signInWithGoogle();
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
