import 'package:flutter/material.dart';

class Makanan {
  String nama;
  double karbo;
  double protein;
  double lemak;

  Makanan({
    required this.nama,
    this.karbo = 0,
    this.protein = 0,
    this.lemak = 0,
  });
}

class KalkulatorGiziPage extends StatefulWidget {
  const KalkulatorGiziPage({super.key});

  @override
  State<KalkulatorGiziPage> createState() => _KalkulatorGiziPageState();
}

class _KalkulatorGiziPageState extends State<KalkulatorGiziPage> {
  List<Makanan> daftarMakanan = [];

  double get totalKarbo =>
      daftarMakanan.fold(0, (sum, item) => sum + item.karbo);
  double get totalProtein =>
      daftarMakanan.fold(0, (sum, item) => sum + item.protein);
  double get totalLemak =>
      daftarMakanan.fold(0, (sum, item) => sum + item.lemak);

  void tambahMakanan() {
    setState(() {
      daftarMakanan.add(Makanan(nama: 'Makanan'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator Gizi')),
      body: Column(
        children: [
          SizedBox(height: 16),
          TotalNutrisiCard(
            karbo: totalKarbo,
            protein: totalProtein,
            lemak: totalLemak,
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: daftarMakanan.length,
              itemBuilder: (context, index) {
                return MakananCard(
                  makanan: daftarMakanan[index],
                  onChanged: (updated) {
                    setState(() {
                      daftarMakanan[index] = updated;
                    });
                  },
                  onDelete: () {
                    setState(() {
                      daftarMakanan.removeAt(index);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tambahMakanan,
        child: Icon(Icons.add),
      ),
    );
  }
}

class TotalNutrisiCard extends StatelessWidget {
  final double karbo;
  final double protein;
  final double lemak;

  const TotalNutrisiCard({
    super.key,
    required this.karbo,
    required this.protein,
    required this.lemak,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Total Nutrisi Harian",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 12),
            NutrisiBar(
              title: "Karbohidrat",
              value: karbo,
              max: 236,
              color: Colors.blue,
            ),
            NutrisiBar(
              title: "Protein",
              value: protein,
              max: 105,
              color: Colors.green,
            ),
            NutrisiBar(
              title: "Lemak",
              value: lemak,
              max: 82,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class NutrisiBar extends StatelessWidget {
  final String title;
  final double value;
  final double max;
  final Color color;

  const NutrisiBar({
    super.key,
    required this.title,
    required this.value,
    required this.max,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (value / max).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title: ${value.toStringAsFixed(0)} / ${max.toStringAsFixed(0)} gr',
          ),
          SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: color.withOpacity(0.2),
              color: color,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class MakananCard extends StatelessWidget {
  final Makanan makanan;
  final ValueChanged<Makanan> onChanged;
  final VoidCallback onDelete;

  const MakananCard({
    super.key,
    required this.makanan,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 14);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: makanan.nama),
                    decoration: InputDecoration(labelText: "Nama Makanan"),
                    onChanged: (val) => onChanged(makanan..nama = val),
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: InputGiziField(
                    label: "Karbo",
                    value: makanan.karbo,
                    onChanged: (val) => onChanged(makanan..karbo = val),
                    color: Colors.blue[100]!,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: InputGiziField(
                    label: "Protein",
                    value: makanan.protein,
                    onChanged: (val) => onChanged(makanan..protein = val),
                    color: Colors.green[100]!,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: InputGiziField(
                    label: "Lemak",
                    value: makanan.lemak,
                    onChanged: (val) => onChanged(makanan..lemak = val),
                    color: Colors.red[100]!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InputGiziField extends StatelessWidget {
  final String label;
  final double value;
  final Function(double) onChanged;
  final Color color;

  const InputGiziField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: value.toString());

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: label, border: InputBorder.none),
        onChanged: (val) => onChanged(double.tryParse(val) ?? 0),
      ),
    );
  }
}
