import 'package:flutter/material.dart';
import 'package:sigma/components/input/text_field.dart';
import 'package:sigma/components/main_nav.dart';
import 'package:sigma/components/other/scaffold_template.dart';
import 'package:sigma/pages/auth/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../theme/app_colors.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: -50,
            child: Image.asset('assets/icon/signin.png', height: 350),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo/logo-landscape.png'),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 16),
                CustomTextField(
                  label: 'Email',
                  hintText: 'Masukan email kamu',
                  controller: emailController,
                ),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Password',
                  hintText: 'Masukan password kamu',
                  controller: passwordController,
                ),
                SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Tidak memiliki akun?'),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        ' daftar',
                        style: TextStyle(color: AppColors.logoBlue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await signIn(
                        emailController.text,
                        passwordController.text,
                      );

                      // Jika signIn berhasil, lanjut ke MainNavigator
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => MainNavigator(),
                        ),
                        (Route<dynamic> route) => false,
                      );
                    } catch (e) {
                      print(e.toString());
                      // Tampilkan error ke user, bisa pakai SnackBar, AlertDialog, dll.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login failed: ${e.toString()}'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: AppColors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.logoBlue,
                  ),
                ),

                SizedBox(height: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> signIn(String email, String password) async {
    final res = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (res.user != null) {
      print('Sign in berhasil: ${res.user!.email}');
    } else if (res != null) {
      print('Error: ');
    }
  }
}
