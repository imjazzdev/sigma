import 'package:flutter/material.dart';
import 'package:sigma/components/other/watermark.dart';
import 'package:sigma/pages/auth/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigma/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return WatermarkWrapper(child: child ?? const SizedBox());
      },
      home: SplashPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          // color: AppColors.logoBlue,
          titleTextStyle: TextStyle(color: AppColors.white, fontSize: 16),
          backgroundColor: AppColors.logoBlue,
        ),
        textTheme: GoogleFonts.lexendDecaTextTheme(),
      ),
    );
  }
}
