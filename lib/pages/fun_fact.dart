import 'package:flutter/material.dart';
import 'package:sigma/pages/fun_fact_detail.dart';

class FunFactListPage extends StatelessWidget {
  final List<FunFact> funFacts = [
    FunFact(
      title: 'Tidak semua lemak itu buruk — lemak baik mendukung otak anak',
      imagePath: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      content:
          'Lemak sehat seperti omega‑3 dan lemak tak jenuh (dari ikan, alpukat, kacang) penting untuk perkembangan otak anak. Lemak juga membantu penyerapan vitamin A, D, E, dan K.',
      author: 'Little Explainers',
      date: '20 Sep 2025',
    ),
    FunFact(
      title: 'Minuman bersoda terlalu sering bisa mengurangi kalsium anak',
      imagePath: 'https://images.unsplash.com/photo-1648156253473-1154aac22425',
      content:
          'Konsumsi minuman bersoda secara rutin dapat menggantikan minuman yang lebih bergizi (susu, air putih), sehingga anak bisa kekurangan kalsium penting untuk pertumbuhan tulang.',
      author: 'UNICEF',
      date: '15 Aug 2025',
    ),
    FunFact(
      title: 'Obesitas masa kecil meningkatkan risiko diabetes tipe 2',
      imagePath: 'https://images.unsplash.com/photo-1567571221843-47a3a923c6a8',
      content:
          'Anak yang mengalami obesitas memiliki risiko lebih tinggi menderita diabetes tipe 2, tekanan darah tinggi, dan gangguan metabolik di masa depan.',
      author: 'KidsHealth',
      date: '10 Jul 2025',
    ),
    FunFact(
      title: 'Waktu layar (screen time) panjang berkaitan dengan obesitas',
      imagePath: 'https://images.unsplash.com/photo-1608106055806-e892769d2e5a',
      content:
          'Semakin lama anak menonton TV, bermain video game, atau menggunakan gadget, semakin berisiko mengalami penambahan berat badan yang tidak sehat. Disarankan batas waktu layar maksimal 1–2 jam sehari.',
      author: 'Altru Health',
      date: '05 Jun 2025',
    ),
    FunFact(
      title: 'Gula tambahan dalam minuman menyumbang kalori kosong',
      imagePath: 'https://images.unsplash.com/photo-1750762285719-eb784c804f2f',
      content:
          'Minuman manis seperti soda, jus dengan gula tambahan, dan minuman ringan memberikan “kalori kosong” tanpa zat gizi, yang dapat memicu penambahan berat badan jika sering dikonsumsi.',
      author: 'HelpGuide',
      date: '20 May 2025',
    ),
    FunFact(
      title: 'Kurang tidur bisa berkontribusi ke obesitas anak',
      imagePath: 'https://images.unsplash.com/photo-1584034724621-59e62d08bf9f',
      content:
          'Kurang tidur dapat mengganggu hormon pengatur nafsu makan, meningkatkan rasa lapar dan keinginan makan camilan berkalori tinggi.',
      author: 'Childhood Obesity Foundation',
      date: '30 Apr 2025',
    ),
    FunFact(
      title: 'Anak yang sarapan cenderung memiliki berat badan lebih sehat',
      imagePath:
          'https://plus.unsplash.com/premium_photo-1682003612072-cd5cad196d2b',
      content:
          'Sarapan membantu mengontrol rasa lapar hingga waktu makan berikutnya dan mengurangi kecenderungan ngemil tak sehat di siang hari.',
      author: 'CDC',
      date: '10 Apr 2025',
    ),
    FunFact(
      title: 'Makan sayur & buah tiap hari bantu cegah kelebihan berat badan',
      imagePath: 'https://images.unsplash.com/photo-1506806732259-39c2d0268443',
      content:
          'Sayur dan buah kaya serat, vitamin, dan mineral — bisa membuat kenyang lebih lama dan menggantikan camilan tinggi gula atau lemak.',
      author: 'CDC',
      date: '25 Mar 2025',
    ),
    FunFact(
      title: 'Aktivitas fisik rutin penting untuk menjaga berat badan sehat',
      imagePath: 'https://images.unsplash.com/photo-1517649763962-0c623066013b',
      content:
          'Anak disarankan melakukan aktivitas fisik intensitas sedang sampai tinggi minimal 60 menit per hari, seperti berlari, bersepeda, atau bermain aktif.',
      author: 'MyObesityTeam',
      date: '05 Mar 2025',
    ),
    FunFact(
      title: 'Jumlah anak obesitas kini melebihi anak kekurangan gizi di dunia',
      imagePath: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773',
      content:
          'Menurut laporan UNICEF terbaru, untuk pertama kalinya jumlah anak yang mengalami obesitas melebihi anak kekurangan gizi di dunia. Ini menjadi tantangan gizi global yang harus segera diatasi.',
      author: 'UNICEF',
      date: '28 Feb 2025',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fun Fact'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: funFacts.length,
        itemBuilder: (context, index) {
          final funFact = funFacts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FunFactDetailPage(funFact: funFact),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      funFact.imagePath,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      funFact.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}

class FunFact {
  final String title;
  final String imagePath;
  final String content;
  final String author;
  final String date;

  FunFact({
    required this.title,
    required this.imagePath,
    required this.content,
    required this.author,
    required this.date,
  });
}
