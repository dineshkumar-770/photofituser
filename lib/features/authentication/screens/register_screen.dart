import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_fit_user/common_widgets/clickable_text_button.dart';
import 'package:photo_fit_user/common_widgets/custom_textoform_field.dart';
import 'package:photo_fit_user/common_widgets/flutter_toast.dart';
import 'package:photo_fit_user/common_widgets/loading_animation.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/config/utils/helper_validation.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';
import 'package:photo_fit_user/features/authentication/cubit/authentication_cubit.dart';
import 'package:photo_fit_user/routes/named_routes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late AuthenticationCubit authenticationCubit;

  @override
  void initState() {
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kTransparent,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10 * SizeConfig.widthMultiplier!),
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
                Text('Let\'s get registered !',
                    style: AppTextStyle.primaryBlue14w500),
                SizedBox(
                  height: 20 * SizeConfig.heightMultiplier!,
                ),
                CustomTextFormField(
                  controller: emailController,
                  labelText: "Enter Email",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email can\'t be empty!';
                    } else if (HelperFunction.validateEmail(value) == false) {
                      return 'Enter a valid email to continue';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20 * SizeConfig.heightMultiplier!,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  labelText: "Enter Password",
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
                CustomTextFormField(
                  controller: confirmPasswordController,
                  labelText: "Enter Confirm Password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm Password can\'t be empty!';
                    }
                    if (value != passwordController.text) {
                      return 'Password and confirm password should match';
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
                    if (state is RegistrationSuccessfulState) {
                      Navigator.pushReplacementNamed(context, RoutesName.userDetailsScreen);
                    }

                    if (state is RegistrationErrorState) {
                      Toast.showToast(state.errMsg);
                    }
                  },
                  builder: (context, state) {
                    if (state is RegistrationLoadingState) {
                      return const Center(
                        child: CustomLoader(),
                      );
                    } else {
                      return SizedBox(
                        height: 50 * SizeConfig.heightMultiplier!,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.orange300,
                                shape: const StadiumBorder()),
                            onPressed: () {
                              if (_formKey.currentState?.validate() == true) {
                                authenticationCubit.userSignUp(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            child: const Text('Sign Up')),
                      );
                    }
                  },
                ),
                Clickabletextbutton(
                  buttonText: 'Login here',
                  staticText: 'Already have an account? ',
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.loginscreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
