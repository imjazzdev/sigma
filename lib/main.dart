import 'package:flutter/material.dart';
import 'package:sigma/components/other/watermark.dart';
import 'package:sigma/pages/auth/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigma/theme/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://lgzhkypbjwfellwmphad.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxnemhreXBiandmZWxsd21waGFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA5NjQ3MDUsImV4cCI6MjA3NjU0MDcwNX0.DWnltHY228rmayh7ObJdxCUk0N45KzNrv7M007lOv4w',
  );

  await dotenv.load();

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
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: AppColors.white, fontSize: 16),
          backgroundColor: AppColors.logoBlue,
        ),
        textTheme: GoogleFonts.lexendDecaTextTheme(),
      ),
    );
  }
}
