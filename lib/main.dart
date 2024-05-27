import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontrend_task/utils/color_consts.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'view/splash/screen_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OnTrend Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: kWhiteColor,
        useMaterial3: false,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const ScreenSplash(),
      debugShowCheckedModeBanner: false,
    );
  }
}
