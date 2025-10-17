import 'package:flutter/material.dart';
import 'package:sigma/pages/menus/monitoring/monitoring_gizi.dart';
import 'package:sigma/theme/app_colors.dart';

import 'monitoring_pola_hidup.dart';

class MonitoringPage extends StatelessWidget {
  const MonitoringPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monitoring')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MenuItemMonitoring(
              pathImg: 'assets/icon/nutrition.png',
              title: 'Monitoring\nGizi',
              color: Colors.pink.shade100,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MonitoringGiziPage()),
                );
              },
            ),
            // SizedBox(height: 30),
            MenuItemMonitoring(
              pathImg: 'assets/icon/balance.png',
              title: 'Monitoring\nPola Hidup',
              color: Colors.amber.shade100,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MonitoringPolaHidupPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItemMonitoring extends StatelessWidget {
  final String pathImg;
  final String title;
  final Color color;
  final double fontSize;
  final VoidCallback onTap;
  const MenuItemMonitoring({
    super.key,
    required this.pathImg,
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
        height: 250,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 2,
              spreadRadius: 2,
              color: Colors.grey.withValues(alpha: 0.2),
            ),
          ],
          border: Border.all(color: AppColors.white, width: 15),
          borderRadius: BorderRadius.circular(70),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 2, child: Image.asset(pathImg, height: 100)),
            SizedBox(height: 4),
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
