import 'package:flutter/material.dart';
import 'package:sigma/components/input/text_field.dart';

import '../components/other/scaffold_template.dart';
import '../theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplate(
      appbar: AppBar(title: Text('Profile')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
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
                CustomTextField(label: 'Nama Lengkap'),
                SizedBox(height: 8),
                CustomTextField(label: 'No. Telp'),
                SizedBox(height: 8),
                CustomTextField(label: 'Jenis Kelamin'),
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
                CustomTextField(label: 'Nama Lengkap'),
                SizedBox(height: 8),
                CustomTextField(label: 'Tanggal Lahir'),
                SizedBox(height: 8),
                CustomTextField(label: 'Jenis Kelamin'),
                SizedBox(height: 8),
                CustomTextField(label: 'Berat Badan (cm)'),
                SizedBox(height: 8),
                CustomTextField(label: 'Tinggi Badan'),
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
                CustomTextField(label: 'Kecamatan/ kota'),
                SizedBox(height: 8),
                CustomTextField(label: 'Kabupaten'),
              ],
            ),
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
