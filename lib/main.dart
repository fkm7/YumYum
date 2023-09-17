import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:delmer/app/app.dart';
import 'package:delmer/bloc/bloc_observer.dart';
import 'package:delmer/firebase_options.dart';
import 'package:delmer/service/remote_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:l/l.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await ScreenUtil.ensureScreenSize();
      if (kIsWeb) {
        usePathUrlStrategy();
      }
      final app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      l.v6(app.isAutomaticDataCollectionEnabled);
      final config = FirebaseRemoteConfigService.getInstance();
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      Bloc.observer = const ChangeObserver();
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
      runApp(const MyApp());
    },
    (error, stack) {
      if (kDebugMode) {
        l.e(error, stack);
      }
      if (kReleaseMode) {
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
        PlatformDispatcher.instance.onError = (error, stack) {
          FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
          return true;
        };
      }
    },
  );
}
