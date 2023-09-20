import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpodtemp/presentation/dummy_data_screen/dummy_data_screen.dart';
import 'package:riverpodtemp/utils/globals.dart';
import 'package:riverpodtemp/utils/state_logger.dart';
import 'package:riverpodtemp/utils/text.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///set application mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///native splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    ///device preview
    DevicePreview(
      enabled: kIsWeb,

      /// In web mode
      builder: (context) => (const ProviderScope(
          observers: [StateLogger()], child: MyApp())), // Wrap your app
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    initialization();
  }

  void initialization() async {
    Timer(const Duration(seconds: 2), () {
      ///remove native splash screen
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      navigatorKey: Globals.navigatorKey,

      ///common navigator key
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      title: AppText.app_name,

      /// add app name
      useInheritedMediaQuery: true,
      theme: ThemeData(
          fontFamily: GoogleFonts.ptSans().fontFamily, useMaterial3: true),

      ///add font family
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
