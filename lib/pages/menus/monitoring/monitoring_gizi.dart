import 'package:flutter/material.dart';
import 'package:sigma/pages/menus/monitoring/monitoring_gizi_detail.dart';

import '../../../theme/app_colors.dart';

class MonitoringGiziPage extends StatelessWidget {
  const MonitoringGiziPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monitoring Gizi')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 120,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/baby.png'),
                  SizedBox(width: 10),
                  MenuItemMonitoringGizi(
                    title: 'Tahun',
                    color: Colors.pink.shade100,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 120,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/height.png'),
                  SizedBox(width: 10),
                  MenuItemMonitoringGizi(
                    title: 'Cm',
                    color: Colors.blue.shade100,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 120,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/scale.png'),
                  SizedBox(width: 10),
                  MenuItemMonitoringGizi(
                    title: 'Kg',
                    color: Colors.amber.shade100,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 120,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icon/equality.png'),
                  SizedBox(width: 10),
                  MenuItemMonitoringGizi(
                    title: 'Jenis Kelamin',
                    fontSize: 12,
                    color: Colors.green.shade100,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MonitoringGiziDetailPage(),
                  ),
                );
              },
              child: Text(
                'Mulai Hitung',
                style: TextStyle(color: AppColors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.logoBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemMonitoringGizi extends StatelessWidget {
  // final String pathImg;
  final String title;
  final Color color;
  final double fontSize;
  final VoidCallback onTap;
  const MenuItemMonitoringGizi({
    super.key,
    // required this.pathImg,
    required this.title,
    required this.color,
    this.fontSize = 20,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 250,
        width: 120,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 2, child: SizedBox()),
            SizedBox(height: 4, child: Divider()),
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
          ],
        ),
      ),
    );
  }
}
