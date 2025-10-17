import 'package:flutter/material.dart';

class DetailMakananPage extends StatelessWidget {
  final String waktu; // "Pagi", "Siang", "Malam"
  final String hari;
  final String judulHalaman; // "Sarapan", "Makan Siang", dst.
  final String iconPath;
  final String gambarMakananPath;
  final String namaMakanan;

  const DetailMakananPage({
    super.key,
    required this.waktu,
    required this.hari,
    required this.judulHalaman,
    required this.iconPath,
    required this.gambarMakananPath,
    required this.namaMakanan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(judulHalaman),
        backgroundColor: const Color(0xFF005CB9), // warna biru header
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Row waktu + hari
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(iconPath, width: 30, height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    hari,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Gambar makanan
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                gambarMakananPath,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),

            // Nama makanan
            Text(
              namaMakanan,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Nilai Gizi
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD700), // warna kuning
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF005CB9), // biru tua
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "Nilai Gizi",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ..._buildNutrisiList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildNutrisiList() {
    final List<String> nutrisi = [
      "Karbohidrat",
      "Gula",
      "Lemak total",
      "Protein",
      "Serat pangan",
    ];

    return nutrisi.map((label) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(label, style: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(border: InputBorder.none),
                  isExpanded: true,
                  hint: const Text('0g'),
                  items:
                      ['0g', '5g', '10g', '15g']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                  onChanged: (val) {},
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
