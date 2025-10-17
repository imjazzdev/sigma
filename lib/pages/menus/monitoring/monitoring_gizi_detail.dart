import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class MonitoringGiziDetailPage extends StatelessWidget {
  const MonitoringGiziDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monitoring Gizi Detail')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MenuItemMonitoringGiziDetail(
              title: 'Umur',
              sub: 'Tahun',
              fontSize: 16,
              color: Colors.pink.shade100,
              onTap: () {},
            ),
            MenuItemMonitoringGiziDetail(
              title: 'Tinggi',
              sub: 'Cm',
              fontSize: 16,
              color: Colors.blue.shade100,
              onTap: () {},
            ),
            MenuItemMonitoringGiziDetail(
              title: 'Berat',
              sub: 'Kg',
              fontSize: 16,
              color: Colors.amber.shade100,
              onTap: () {},
            ),
            MenuItemMonitoringGiziDetail(
              title: 'Jenis\nKelamin',
              sub: '',
              fontSize: 12,
              color: Colors.green.shade100,
              onTap: () {},
            ),
            SizedBox(height: 30),
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                boxShadow: [
                  // BoxShadow(
                  //   offset: Offset(4, 4),
                  //   blurRadius: 2,
                  //   spreadRadius: 2,
                  //   color: Colors.grey.withValues(alpha: 0.2),
                  // ),
                ],
                border: Border.all(color: AppColors.white, width: 5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hasil Perhitungan',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 39),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Hitung Ulang',
                      style: TextStyle(color: AppColors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemMonitoringGiziDetail extends StatelessWidget {
  final String title;
  final String sub;
  final Color color;
  final double fontSize;
  final VoidCallback onTap;
  const MenuItemMonitoringGiziDetail({
    super.key,
    required this.title,
    required this.sub,
    required this.color,
    this.fontSize = 20,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 90,

        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            // BoxShadow(
            //   offset: Offset(4, 4),
            //   blurRadius: 2,
            //   spreadRadius: 2,
            //   color: Colors.grey.withValues(alpha: 0.2),
            // ),
          ],
          border: Border.all(color: AppColors.white, width: 5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                sub,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
