import 'package:flutter/material.dart';
import 'package:sigma/pages/auth/signin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../components/input/text_field.dart';
import '../components/other/scaffold_template.dart';
import '../theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    final meta = user?.userMetadata ?? {};

    Future<void> _signOut(BuildContext context) async {
      try {
        await Supabase.instance.client.auth.signOut();

        // Navigasi ke halaman Sign In dan hapus semua route sebelumnya
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const SigninPage()),
          (route) => false,
        );
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Logout success')));
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Logout gagal: $e')));
      }
    }

    return ScaffoldTemplate(
      appbar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => _signOut(context),
            icon: Icon(Icons.logout_rounded, color: Colors.white),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 16),

          // ================= ORANG TUA =================
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.pink,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Orang Tua',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Nama Lengkap',
                  initialValue: meta['full_name'] ?? '',
                  readOnly: true,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Email',
                  initialValue: user?.email ?? '',
                  readOnly: true,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'No. Telp',
                  initialValue: meta['phone'] ?? '',
                  readOnly: true,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Jenis Kelamin',
                  initialValue: meta['gender'] ?? '',
                  readOnly: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ================= ANAK =================
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.cream,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Anak',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Nama Lengkap',
                  initialValue: meta['child_name'] ?? '',
                  readOnly: true,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Tanggal Lahir',
                  initialValue: meta['birth_date'] ?? '',
                  readOnly: true,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Jenis Kelamin',
                  initialValue: meta['child_gender'] ?? '',
                  readOnly: true,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Berat Badan (kg)',
                  initialValue: meta['weight'] ?? '',
                  readOnly: true,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Tinggi Badan (cm)',
                  initialValue: meta['height'] ?? '',
                  readOnly: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ================= ALAMAT =================
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.paleGreen,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Alamat',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Kecamatan / Kota',
                  initialValue: meta['district'] ?? '',
                  readOnly: true,
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  label: 'Kabupaten',
                  initialValue: meta['city'] ?? '',
                  readOnly: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
