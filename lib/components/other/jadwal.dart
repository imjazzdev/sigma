import 'package:flutter/material.dart';

class JadwalCard extends StatelessWidget {
  final String hari;
  final VoidCallback onTapPagi;
  final VoidCallback onTapSiang;
  final VoidCallback onTapMalam;

  const JadwalCard({
    super.key,
    required this.hari,
    required this.onTapPagi,
    required this.onTapSiang,
    required this.onTapMalam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4C2), // warna kuning muda
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon kalender + hari
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/icon/calendar.png',
                    width: 70,
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      hari,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 16),

          // Pagi
          _WaktuCard(
            label: 'Pagi',
            iconPath: 'assets/icon/morning.png',
            onTap: onTapPagi,
          ),

          const SizedBox(width: 12),

          // Siang
          _WaktuCard(
            label: 'Siang',
            iconPath: 'assets/icon/day-mode.png',
            onTap: onTapSiang,
          ),

          const SizedBox(width: 12),

          // Malam
          _WaktuCard(
            label: 'Malam',
            iconPath: 'assets/icon/night.png',
            onTap: onTapMalam,
          ),
        ],
      ),
    );
  }
}

class _WaktuCard extends StatelessWidget {
  final String label;
  final String iconPath;
  final VoidCallback onTap;

  const _WaktuCard({
    required this.label,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 30, height: 30),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
