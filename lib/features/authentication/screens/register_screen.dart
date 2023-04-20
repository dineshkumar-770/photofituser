import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_fit_user/common_widgets/clickable_text_button.dart';
import 'package:photo_fit_user/common_widgets/loading_animation.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/config/utils/helper_validation.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';
import 'package:photo_fit_user/features/authentication/controller/auth_notifier.dart';
import 'package:photo_fit_user/features/authentication/controller/auth_states.dart';
import 'package:photo_fit_user/features/authentication/widgets/custom_text_field.dart';
import 'package:photo_fit_user/routes/named_routes.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
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
                NormalCustomTextField(
                  controller: namecontroller,
                  label: 'Name',
                  hint: 'Enter your name ',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Name can\'t be empty!';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 20 * SizeConfig.heightMultiplier!,
                ),
                NormalCustomTextField(
                  controller: emailController,
                  label: "Email",
                  hint: 'Enter your email',
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
                NormalCustomTextField(
                  controller: passwordController,
                  label: "Password",
                  isPasswordField: true,
                  hint: 'Enter your password',
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
                      if (next is SignUpSuccessState) {
                        Navigator.pushReplacementNamed(
                            context, RoutesName.loginscreen);
                      }
                      if (next is SignUpErrorState) {
                        Fluttertoast.showToast(msg: next.errorMessage);
                      }
                    });
                    if (state is SignUpLoadingState) {
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
                                ref.read(authProvider.notifier).signUp(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: namecontroller.text);
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
