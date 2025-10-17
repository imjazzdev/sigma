import 'package:flutter/material.dart';
import 'package:sigma/components/other/jadwal.dart';
import 'package:sigma/pages/menus/resep/resep_detail.dart';

class ResepPage extends StatelessWidget {
  const ResepPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resep')),
      body: ListView(
        children: [
          JadwalCard(
            hari: "Sen",
            onTapPagi: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const DetailMakananPage(
                        waktu: "Pagi",
                        hari: "Senin",
                        judulHalaman: "Sarapan",
                        iconPath: "assets/icon/morning.png",
                        gambarMakananPath: "assets/images/telur_dadar.png",
                        namaMakanan: "Telur Dadar",
                      ),
                ),
              );

              // Navigasi ke halaman Sarapan
            },
            onTapSiang: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const DetailMakananPage(
                        waktu: "Siang",
                        hari: "Senin",
                        judulHalaman: "Makan Siang",
                        iconPath: "assets/icon/day-mode.png",
                        gambarMakananPath: "assets/images/telur_dadar.png",
                        namaMakanan: "Telur Dadar",
                      ),
                ),
              );
            },
            onTapMalam: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const DetailMakananPage(
                        waktu: "Malam",
                        hari: "Senin",
                        judulHalaman: "Makan Malam",
                        iconPath: "assets/icon/night.png",
                        gambarMakananPath: "assets/images/telur_dadar.png",
                        namaMakanan: "Telur Dadar",
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
