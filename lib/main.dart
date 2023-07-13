import 'package:delmer/res/text.dart';
import 'package:delmer/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delmer/layout/ui/auth/sign_in.dart';
import 'package:delmer/layout/ui/intro/intro.dart';
import 'package:delmer/layout/main_nav_page.dart';
import 'package:delmer/layout/ui/profile/edit_profile.dart';
import 'package:delmer/layout/ui/profile/order_history.dart';
import 'package:delmer/layout/ui/intro/splash.dart';
import 'package:delmer/layout/ui/auth/verification.dart';

import 'bloc/app/bloc.dart';

void main() {
  // await ScreenUtil.ensureScreenSize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _app = AppBloc(InitialState());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) => MaterialApp(
        title: AppText.appName,
        theme: AppTheme.getThemeData(),
        routes: {
          IntroPage.route: (context) => const IntroPage(),
          SignInPage.route: (context) => const SignInPage(),
          VerificationPage.route: (context) => const VerificationPage(),
          MainNavPage.route: (context) => const MainNavPage(),
          EditProfilePage.route: (context) => const EditProfilePage(),
          OrderHistoryPage.route: (context) => const OrderHistoryPage(),
        },
        home: const SplashPage(),
      ),
    );
  }
}
