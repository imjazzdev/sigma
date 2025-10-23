import 'package:flutter/material.dart';

class JadwalCard extends StatelessWidget {
  final String hari;
  final VoidCallback onTapPagi;
  final VoidCallback onTapSiang;
  final VoidCallback onTapMalam;
  final VoidCallback onLongPressPagi;
  final VoidCallback onLongPressSiang;
  final VoidCallback onLongPressMalam;

  const JadwalCard({
    super.key,
    required this.hari,
    required this.onTapPagi,
    required this.onTapSiang,
    required this.onTapMalam,
    required this.onLongPressPagi,
    required this.onLongPressSiang,
    required this.onLongPressMalam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF4C2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Hari
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
            onLongPress: onLongPressPagi,
          ),
          const SizedBox(width: 12),

          // Siang
          _WaktuCard(
            label: 'Siang',
            iconPath: 'assets/icon/day-mode.png',
            onTap: onTapSiang,
            onLongPress: onLongPressSiang,
          ),
          const SizedBox(width: 12),

          // Malam
          _WaktuCard(
            label: 'Malam',
            iconPath: 'assets/icon/night.png',
            onTap: onTapMalam,
            onLongPress: onLongPressMalam,
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
  final VoidCallback onLongPress;

  const _WaktuCard({
    required this.label,
    required this.iconPath,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      highlightColor: Colors.blue.shade400,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
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
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
