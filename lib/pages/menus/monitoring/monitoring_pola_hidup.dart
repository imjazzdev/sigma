import 'package:flutter/material.dart';

import '../../../components/button/button_text.dart';
import '../../../theme/app_colors.dart';

class MonitoringPolaHidupPage extends StatelessWidget {
  const MonitoringPolaHidupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monitoring Pola Hidup')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MonitoringCard(
              colorTitle: Colors.blue,
              color: Colors.blue.shade100,
              title: 'Aktifitas fisik',
              imageAsset: 'assets/icon/children.png',
              description:
                  'Apakah anak sudah melakukan gerakan aktif secara teratur?',
              onPressedSudah: () {
                print('Sudah ditekan');
              },
              onPressedBelum: () {
                print('Belum ditekan');
              },
              childContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text('Isi tambahan di sini...')],
              ),
            ),
            SizedBox(height: 16),
            MonitoringCard(
              colorTitle: Colors.pink,
              color: Colors.pink.shade100,
              title: 'Pola istirahat',
              imageAsset: 'assets/icon/sleep.png',
              description: 'Apakah anak telah tidur sebanyak 10-13 jam sehari?',
              onPressedSudah: () {
                print('Sudah ditekan');
              },
              onPressedBelum: () {
                print('Belum ditekan');
              },
              childContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text('Isi tambahan di sini...')],
              ),
            ),
            SizedBox(height: 16),
            MonitoringCard(
              colorTitle: Colors.green,
              color: Colors.green.shade100,
              title: 'Konsumsi air',
              imageAsset: 'assets/icon/drink-water.png',
              description:
                  'Apakah anak telah minum air sebanyak 1300 ml sehari?',
              onPressedSudah: () {
                print('Sudah ditekan');
              },
              onPressedBelum: () {
                print('Belum ditekan');
              },
              childContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [Text('Isi tambahan di sini...')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MonitoringCard extends StatelessWidget {
  final String title;
  final Color color;
  final Color colorTitle;
  final String imageAsset;
  final String description;
  final VoidCallback onPressedSudah;
  final VoidCallback onPressedBelum;
  final Widget? childContent;

  const MonitoringCard({
    Key? key,
    required this.title,
    required this.color,
    required this.colorTitle,
    required this.imageAsset,
    required this.description,
    required this.onPressedSudah,
    required this.onPressedBelum,
    this.childContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Header
          Container(
            height: 40,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colorTitle,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Content Row
          Expanded(
            child: Row(
              children: [
                // Image
                Expanded(flex: 1, child: Image.asset(imageAsset)),

                const SizedBox(width: 8),

                // Right Column
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 30,
                        child: Text(
                          description,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),

                      // Buttons
                      Container(
                        height: 40,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              text: 'Sudah',
                              onPressed: onPressedSudah,
                              backgroundColor: AppColors.logoBlue,
                              textColor: AppColors.white,
                              height: 30,
                            ),
                            CustomButton(
                              text: 'Belum',
                              onPressed: onPressedBelum,
                              backgroundColor: AppColors.logoBlue,
                              textColor: AppColors.white,
                              height: 30,
                            ),
                          ],
                        ),
                      ),

                      // Optional Child Content
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: childContent ?? const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
