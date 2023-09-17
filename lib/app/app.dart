import 'package:delmer/app/navigator.dart';
import 'package:delmer/bloc/app/bloc.dart';
import 'package:delmer/bloc/auth/auth.dart';
import 'package:delmer/bloc/cart/cart.dart';
import 'package:delmer/res/assets.dart';
import 'package:delmer/res/text.dart';
import 'package:delmer/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final app = AppBloc(FirstRun());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppAssets.preLoad(context);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>.value(
            value: app,
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              const AuthState(
                isLoading: false,
                isAuthorized: false,
              ),
            ),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(
              const CartState(
                products: [],
                subTotal: 0.0,
                total: 0.0,
              ),
            ),
          ),
        ],
        child: MaterialApp.router(
          title: AppText.appName,
          // builder: (context, child) => DevicePreview.appBuilder(context, child),
          // locale: DevicePreview.locale(context),
          theme: AppTheme.getThemeData(),
          // routerConfig: goRouter,
          routerDelegate: goRouter.routerDelegate,
          routeInformationParser: goRouter.routeInformationParser,
          routeInformationProvider: goRouter.routeInformationProvider,
        ),
      ),
    );
  }
}
