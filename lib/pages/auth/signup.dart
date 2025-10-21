import 'package:flutter/material.dart';
import 'package:sigma/components/input/text_field.dart';
import 'package:sigma/components/other/scaffold_template.dart';
import 'package:sigma/theme/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // Controllers untuk field penting
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();

  final childNameController = TextEditingController();
  final birthDateController = TextEditingController();
  final childGenderController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  final districtController = TextEditingController();
  final cityController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  Future<void> signUpWithSupabase() async {
    setState(() => isLoading = true);
    try {
      final email = emailController.text.trim();
      final password = passwordController.text;

      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': fullNameController.text.trim(),
          'phone': phoneController.text.trim(),
          'gender': genderController.text.trim(),
          'child_name': childNameController.text.trim(),
          'birth_date': birthDateController.text.trim(),
          'child_gender': childGenderController.text.trim(),
          'weight': weightController.text.trim(),
          'height': heightController.text.trim(),
          'district': districtController.text.trim(),
          'city': cityController.text.trim(),
        },
      );

      if (response.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign Up Berhasil! Silakan verifikasi email.'),
          ),
        );

        // Navigasi ke halaman login / utama
        Navigator.of(context).pop(); // Kembali ke halaman login misalnya
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Terjadi kesalahan: ${e.toString()}')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sign Up',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),

          // Email & Password Field
          CustomTextField(label: 'Email', controller: emailController),
          SizedBox(height: 8),
          CustomTextField(
            label: 'Password',
            controller: passwordController,
            obscureText: true,
          ),
          SizedBox(height: 16),

          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Orang Tua',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Nama Lengkap',
                  controller: fullNameController,
                ),
                SizedBox(height: 8),
                CustomTextField(label: 'No. Telp', controller: phoneController),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Jenis Kelamin',
                  controller: genderController,
                ),
              ],
            ),
          ),

          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Anak',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Nama Lengkap',
                  controller: childNameController,
                ),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Tanggal Lahir',
                  controller: birthDateController,
                ),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Jenis Kelamin',
                  controller: childGenderController,
                ),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Berat Badan (cm)',
                  controller: weightController,
                ),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Tinggi Badan',
                  controller: heightController,
                ),
              ],
            ),
          ),

          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.paleGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Alamat',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                CustomTextField(
                  label: 'Kecamatan/ kota',
                  controller: districtController,
                ),
                SizedBox(height: 8),
                CustomTextField(label: 'Kabupaten', controller: cityController),
              ],
            ),
          ),

          SizedBox(height: 24),

          ElevatedButton(
            onPressed: isLoading ? null : signUpWithSupabase,
            child:
                isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('Sign Up', style: TextStyle(color: AppColors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.logoBlue,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),

          SizedBox(height: 24),
        ],
      ),
    );
  }
}
