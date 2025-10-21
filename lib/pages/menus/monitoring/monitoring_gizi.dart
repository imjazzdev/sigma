import 'package:flutter/material.dart';
import 'package:sigma/pages/menus/monitoring/monitoring_gizi_detail.dart';
import '../../../theme/app_colors.dart';

class MonitoringGiziPage extends StatefulWidget {
  const MonitoringGiziPage({super.key});

  @override
  State<MonitoringGiziPage> createState() => _MonitoringGiziPageState();
}

class _MonitoringGiziPageState extends State<MonitoringGiziPage> {
  final TextEditingController tahunController = TextEditingController();
  final TextEditingController tinggiController = TextEditingController();
  final TextEditingController beratController = TextEditingController();
  String? jenisKelamin;

  @override
  void dispose() {
    tahunController.dispose();
    tinggiController.dispose();
    beratController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monitoring Gizi')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            RowItem(
              imagePath: 'assets/icon/baby.png',
              child: MenuItemMonitoringGizi(
                title: 'Tahun',
                color: Colors.pink.shade100,
                controller: tahunController,
              ),
            ),
            SizedBox(height: 25),
            RowItem(
              imagePath: 'assets/icon/height.png',
              child: MenuItemMonitoringGizi(
                title: 'Cm',
                color: Colors.blue.shade100,
                controller: tinggiController,
              ),
            ),
            SizedBox(height: 25),
            RowItem(
              imagePath: 'assets/icon/scale.png',
              child: MenuItemMonitoringGizi(
                title: 'Kg',
                color: Colors.amber.shade100,
                controller: beratController,
              ),
            ),
            SizedBox(height: 25),
            RowItem(
              imagePath: 'assets/icon/equality.png',
              child: MenuItemMonitoringGizi(
                title: 'Jenis Kelamin',
                fontSize: 12,
                color: Colors.green.shade100,
                isDropdown: true,
                dropdownValue: jenisKelamin,
                onDropdownChanged: (value) {
                  setState(() {
                    jenisKelamin = value;
                  });
                },
              ),
            ),
            SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                // Validasi jika perlu
                final double? berat = double.tryParse(beratController.text);
                final double? tinggi = double.tryParse(tinggiController.text);
                final String umur = tahunController.text;
                final String jk = jenisKelamin ?? '-';

                if (berat == null ||
                    tinggi == null ||
                    jk == '-' ||
                    umur.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Lengkapi semua data terlebih dahulu!'),
                    ),
                  );
                  return;
                }

                // Kalkulasi nilai gizi (IMT)
                final double tinggiMeter = tinggi / 100;
                final double imt = berat / (tinggiMeter * tinggiMeter);

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => MonitoringGiziDetailPage(
                          umur: umur,
                          tinggi: tinggiController.text,
                          berat: beratController.text,
                          jenisKelamin: jk,
                          gaugeValue: imt,
                        ),
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

class RowItem extends StatelessWidget {
  final String imagePath;
  final Widget child;

  const RowItem({super.key, required this.imagePath, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(imagePath), SizedBox(width: 10), child],
      ),
    );
  }
}

class MenuItemMonitoringGizi extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final TextEditingController? controller;
  final bool isDropdown;
  final String? dropdownValue;
  final void Function(String?)? onDropdownChanged;

  const MenuItemMonitoringGizi({
    super.key,
    required this.title,
    required this.color,
    this.fontSize = 20,
    this.controller,
    this.isDropdown = false,
    this.dropdownValue,
    this.onDropdownChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppColors.white, width: 5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child:
                isDropdown
                    ? DropdownButtonFormField<String>(
                      value: dropdownValue,
                      isExpanded: true,
                      isDense: true,
                      alignment: Alignment.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ), // 👈 kecilkan font
                      items: const [
                        DropdownMenuItem(
                          value: 'Laki-laki',
                          child: Center(
                            child: Text(
                              'Laki-laki',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        DropdownMenuItem(
                          value: 'Perempuan',
                          child: Center(
                            child: Text(
                              'Perempuan',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                      onChanged: onDropdownChanged,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 0,
                        ),
                        border: InputBorder.none,
                      ),
                    )
                    : TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center, // 👈 input center
                      style: TextStyle(fontSize: 30),
                      decoration: InputDecoration(
                        hintText: '...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: InputBorder.none,
                      ),
                    ),
          ),

          SizedBox(height: 4, child: Divider()),
          Expanded(
            flex: 1,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
