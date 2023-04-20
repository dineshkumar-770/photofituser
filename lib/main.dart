import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/config/utils/helper_validation.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_fit_user/features/authentication/screens/login_screen.dart';
import 'package:photo_fit_user/features/navigation_bar/cubit/navigation_bar_cubit.dart';
import 'package:photo_fit_user/features/user_details/cubit/user_details_cubit.dart';
import 'package:photo_fit_user/generated/firebase_options.dart';
import 'package:photo_fit_user/routes/named_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => NavigationBarCubit(),
                      child: Container(),
                    ),
                    BlocProvider(
                      create: (context) => UserDetailsCubit(),
                      child: Container(),
                    ),
                  ],
                  child: MaterialApp(
                    onGenerateRoute: GeneratedRoutes.generateRoute,
                    home: const LoginScreen(),
                    navigatorKey: navigatorKey,
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(
                      primarySwatch: AppColors.kPrimarySwatch,
                      canvasColor: AppColors.kPureWhite,
                      fontFamily: 'Inter Default',
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
