import 'package:flutter/material.dart';
import 'package:sigma/components/input/text_field.dart';
import 'package:sigma/components/main_nav.dart';
import 'package:sigma/components/other/scaffold_template.dart';
import 'package:sigma/pages/auth/signup.dart';

import '../../theme/app_colors.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

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
                CustomTextField(label: 'Email', hintText: 'Masukan email kamu'),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Password',
                  hintText: 'Masukan password kamu',
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
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MainNavigator()),
                      (Route<dynamic> route) => false,
                    );
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
}
