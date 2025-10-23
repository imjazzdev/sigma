import 'package:flutter/material.dart';
import 'package:sigma/pages/menus/fun_fact/fun_fact_detail.dart';

class FunFactListPage extends StatelessWidget {
  final List<FunFact> funFacts = [
    // FunFact(
    //   title: 'Tidak semua lemak itu buruk — lemak baik mendukung otak anak',
    //   imagePath: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
    //   content:
    //       'Lemak sehat seperti omega‑3 dan lemak tak jenuh (dari ikan, alpukat, kacang) penting untuk perkembangan otak anak. Lemak juga membantu penyerapan vitamin A, D, E, dan K.',
    //   author: 'Little Explainers',
    //   date: '20 Sep 2025',
    // ),
    // FunFact(
    //   title: 'Minuman bersoda terlalu sering bisa mengurangi kalsium anak',
    //   imagePath: 'https://images.unsplash.com/photo-1648156253473-1154aac22425',
    //   content:
    //       'Konsumsi minuman bersoda secara rutin dapat menggantikan minuman yang lebih bergizi (susu, air putih), sehingga anak bisa kekurangan kalsium penting untuk pertumbuhan tulang.',
    //   author: 'UNICEF',
    //   date: '15 Aug 2025',
    // ),
    // FunFact(
    //   title: 'Obesitas masa kecil meningkatkan risiko diabetes tipe 2',
    //   imagePath: 'https://images.unsplash.com/photo-1567571221843-47a3a923c6a8',
    //   content:
    //       'Anak yang mengalami obesitas memiliki risiko lebih tinggi menderita diabetes tipe 2, tekanan darah tinggi, dan gangguan metabolik di masa depan.',
    //   author: 'KidsHealth',
    //   date: '10 Jul 2025',
    // ),
    // FunFact(
    //   title: 'Waktu layar (screen time) panjang berkaitan dengan obesitas',
    //   imagePath: 'https://images.unsplash.com/photo-1608106055806-e892769d2e5a',
    //   content:
    //       'Semakin lama anak menonton TV, bermain video game, atau menggunakan gadget, semakin berisiko mengalami penambahan berat badan yang tidak sehat. Disarankan batas waktu layar maksimal 1–2 jam sehari.',
    //   author: 'Altru Health',
    //   date: '05 Jun 2025',
    // ),
    // FunFact(
    //   title: 'Gula tambahan dalam minuman menyumbang kalori kosong',
    //   imagePath: 'https://images.unsplash.com/photo-1750762285719-eb784c804f2f',
    //   content:
    //       'Minuman manis seperti soda, jus dengan gula tambahan, dan minuman ringan memberikan “kalori kosong” tanpa zat gizi, yang dapat memicu penambahan berat badan jika sering dikonsumsi.',
    //   author: 'HelpGuide',
    //   date: '20 May 2025',
    // ),
    // FunFact(
    //   title: 'Kurang tidur bisa berkontribusi ke obesitas anak',
    //   imagePath: 'https://images.unsplash.com/photo-1584034724621-59e62d08bf9f',
    //   content:
    //       'Kurang tidur dapat mengganggu hormon pengatur nafsu makan, meningkatkan rasa lapar dan keinginan makan camilan berkalori tinggi.',
    //   author: 'Childhood Obesity Foundation',
    //   date: '30 Apr 2025',
    // ),
    // FunFact(
    //   title: 'Anak yang sarapan cenderung memiliki berat badan lebih sehat',
    //   imagePath:
    //       'https://plus.unsplash.com/premium_photo-1682003612072-cd5cad196d2b',
    //   content:
    //       'Sarapan membantu mengontrol rasa lapar hingga waktu makan berikutnya dan mengurangi kecenderungan ngemil tak sehat di siang hari.',
    //   author: 'CDC',
    //   date: '10 Apr 2025',
    // ),
    // FunFact(
    //   title: 'Makan sayur & buah tiap hari bantu cegah kelebihan berat badan',
    //   imagePath: 'https://images.unsplash.com/photo-1506806732259-39c2d0268443',
    //   content:
    //       'Sayur dan buah kaya serat, vitamin, dan mineral — bisa membuat kenyang lebih lama dan menggantikan camilan tinggi gula atau lemak.',
    //   author: 'CDC',
    //   date: '25 Mar 2025',
    // ),
    // FunFact(
    //   title: 'Aktivitas fisik rutin penting untuk menjaga berat badan sehat',
    //   imagePath: 'https://images.unsplash.com/photo-1517649763962-0c623066013b',
    //   content:
    //       'Anak disarankan melakukan aktivitas fisik intensitas sedang sampai tinggi minimal 60 menit per hari, seperti berlari, bersepeda, atau bermain aktif.',
    //   author: 'MyObesityTeam',
    //   date: '05 Mar 2025',
    // ),
    // FunFact(
    //   title: 'Jumlah anak obesitas kini melebihi anak kekurangan gizi di dunia',
    //   imagePath: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773',
    //   content:
    //       'Menurut laporan UNICEF terbaru, untuk pertama kalinya jumlah anak yang mengalami obesitas melebihi anak kekurangan gizi di dunia. Ini menjadi tantangan gizi global yang harus segera diatasi.',
    //   author: 'UNICEF',
    //   date: '28 Feb 2025',
    // ),
    FunFact(
      title: 'Tidak semua lemak itu buruk — lemak baik mendukung otak anak',
      imagePath: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      content:
          'Pemahaman umum sering kali menganggap semua lemak itu buruk, padahal faktanya, anak-anak membutuhkan asupan lemak yang cukup dan jenis yang tepat untuk pertumbuhan optimal. Lemak merupakan sumber energi padat kalori, namun yang lebih krusial, lemak bertindak sebagai pembawa untuk vitamin larut lemak (A, D, E, dan K) yang esensial. Tanpa lemak, vitamin-vitamin ini tidak dapat diserap dan dimanfaatkan tubuh secara efisien.\n\nAspek terpenting dari lemak yang sehat adalah peranannya dalam perkembangan otak. Otak, terutama pada masa kanak-kanak, terdiri sebagian besar dari lemak, dan membutuhkan asam lemak esensial, terutama Omega-3, untuk membangun selaput sel otak dan saraf. Asam lemak tak jenuh ganda (PUFA), seperti DHA dan EPA, sangat penting untuk fungsi kognitif, ketajaman visual, dan perkembangan sistem saraf secara keseluruhan. Kekurangan lemak baik dapat mengganggu proses penting ini.\n\nSumber lemak baik meliputi ikan berlemak (seperti salmon), alpukat, kacang-kacangan, biji-bijian, dan minyak nabati tertentu seperti minyak zaitun. Lemak tak jenuh tunggal dan ganda ini membantu menjaga kesehatan jantung dan mengurangi peradangan, sehingga memberikan manfaat jangka panjang.\n\nSebaliknya, lemak trans dan lemak jenuh yang berlebihan, yang sering ditemukan dalam makanan olahan, *fast food*, dan makanan yang digoreng, harus dibatasi. Lemak jenis ini tidak hanya memicu penambahan berat badan yang tidak sehat, tetapi juga dapat meningkatkan risiko penyakit kardiovaskular di masa dewasa.\n\nOleh karena itu, orang tua perlu fokus pada kualitas lemak, bukan sekadar membatasinya. Mengintegrasikan makanan utuh kaya lemak sehat ke dalam pola makan anak adalah strategi nutrisi yang cerdas untuk mendukung kesehatan otak dan seluruh tubuh.',
      author: 'American Academy of Pediatrics (AAP)',
      date: '15 Sep 2025',
    ),
    FunFact(
      title: 'Minuman bersoda terlalu sering bisa mengurangi kalsium anak',
      imagePath: 'https://images.unsplash.com/photo-1648156253473-1154aac22425',
      content:
          'Minuman bersoda, minuman energi, dan minuman manis lainnya telah menjadi bagian yang mengkhawatirkan dari pola makan anak-anak modern. Salah satu dampaknya yang paling sering diabaikan adalah potensi gangguan terhadap penyerapan kalsium dan kesehatan tulang secara keseluruhan. Meskipun minuman ini tampak "aman" bagi banyak orang tua, konsumsi rutin dapat menggantikan minuman bergizi utama, yaitu susu dan air putih.\n\nSusu adalah sumber kalsium dan Vitamin D yang vital untuk pertumbuhan tulang yang kuat selama masa kanak-kanak dan remaja. Ketika anak memilih soda dibandingkan susu, mereka tidak hanya kehilangan asupan kalsium, tetapi juga mungkin mengonsumsi asam fosfat yang terkandung dalam banyak minuman bersoda. Asam fosfat ini dapat mengganggu keseimbangan mineral dalam tubuh.\n\nPenelitian menunjukkan adanya korelasi antara konsumsi soda tinggi dan penurunan kepadatan mineral tulang, terutama pada anak perempuan remaja. Meskipun mekanismenya kompleks dan kontroversial—apakah ini murni karena penggantian susu atau efek langsung dari asam fosfat—hasil akhirnya sama: struktur tulang anak menjadi kurang kuat.\n\nMasa kanak-kanak dan remaja adalah periode krusial untuk membangun "bank tulang" (Bone Mass Peak). Kalsium yang cukup sangat dibutuhkan saat ini. Kerusakan atau kekurangan yang terjadi pada masa ini dapat meningkatkan risiko osteoporosis dan patah tulang di masa dewasa nanti.\n\nOleh karena itu, batasan ketat terhadap minuman bersoda dan manis perlu diterapkan. Mengganti minuman tersebut dengan air putih, susu rendah lemak, atau air yang diberi irisan buah (infused water) adalah langkah preventif sederhana namun sangat efektif untuk melindungi kesehatan tulang dan gizi anak.',
      author: 'Harvard T.H. Chan School of Public Health',
      date: '01 Aug 2025',
    ),
    FunFact(
      title: 'Obesitas masa kecil meningkatkan risiko diabetes tipe 2',
      imagePath: 'https://images.unsplash.com/photo-1567571221843-47a3a923c6a8',
      content:
          'Obesitas pada anak tidak hanya menjadi masalah estetika atau sosial, tetapi merupakan kondisi medis serius yang membawa serangkaian komplikasi kesehatan jangka panjang. Salah satu risiko terbesar dan paling cepat meningkat adalah pemicu diabetes tipe 2, sebuah penyakit yang dulunya hampir secara eksklusif terjadi pada orang dewasa.\n\nAnak-anak yang kelebihan berat badan atau obesitas sering mengalami kondisi yang disebut resistensi insulin. Ini terjadi ketika sel-sel tubuh menjadi kurang responsif terhadap insulin, hormon yang bertanggung jawab untuk memindahkan glukosa (gula) dari aliran darah ke dalam sel untuk digunakan sebagai energi. Akibatnya, kadar gula darah tetap tinggi, dan pankreas harus bekerja ekstra keras memproduksi lebih banyak insulin.\n\nDalam jangka panjang, pankreas bisa kelelahan dan gagal menghasilkan cukup insulin, yang menyebabkan perkembangan penuh diabetes tipe 2. Tingginya kadar gula darah yang tidak terkontrol ini, bahkan pada usia muda, dapat merusak pembuluh darah, saraf, dan organ vital seperti mata dan ginjal.\n\nSelain diabetes tipe 2, obesitas pada masa kanak-kanak juga terkait erat dengan sindrom metabolik, yang mencakup tekanan darah tinggi (hipertensi), kadar kolesterol abnormal, dan penyakit hati berlemak non-alkoholik (NAFLD). Kumpulan kondisi ini secara signifikan meningkatkan risiko serangan jantung dan stroke di usia muda.\n\nIntervensi dini melalui perubahan pola makan dan peningkatan aktivitas fisik sangatlah penting. Mengatasi obesitas anak bukan hanya tentang berat badan, tetapi tentang mencegah komplikasi kronis yang dapat mengurangi kualitas hidup dan harapan hidup mereka secara drastis.',
      author: 'World Health Organization (WHO)',
      date: '20 Jul 2025',
    ),
    FunFact(
      title: 'Waktu layar (screen time) panjang berkaitan dengan obesitas',
      imagePath: 'https://images.unsplash.com/photo-1608106055806-e892769d2e5a',
      content:
          'Gaya hidup modern yang didominasi oleh perangkat digital telah melahirkan tantangan baru bagi kesehatan anak: waktu layar yang berlebihan. Hubungan antara waktu yang dihabiskan di depan layar (TV, komputer, tablet, ponsel) dan peningkatan risiko obesitas anak adalah nyata dan dipengaruhi oleh beberapa mekanisme biologis dan perilaku.\n\nPertama dan yang paling jelas adalah kurangnya aktivitas fisik. Saat anak-anak sibuk menonton atau bermain *game*, mereka tidak bergerak. Kondisi ini disebut perilaku *sedentary* (duduk berlebihan), di mana kalori yang dikonsumsi tidak terbakar. Perilaku ini secara langsung mengarah pada ketidakseimbangan energi, di mana asupan kalori melebihi pengeluaran kalori, yang pada akhirnya menumpuk menjadi lemak tubuh.\n\nKedua, paparan iklan makanan. Sebagian besar iklan yang ditujukan kepada anak-anak, terutama saat mereka menonton TV atau bermain *game*, mempromosikan makanan tinggi gula, garam, dan lemak, seperti sereal manis, *snack* berkalori tinggi, dan minuman bersoda. Paparan berulang ini secara implisit mendorong anak untuk mengonsumsi makanan yang tidak sehat.\n\nKetiga, kecenderungan makan sambil menonton atau bermain. Anak-anak yang makan sambil terdistraksi oleh layar cenderung makan tanpa sadar (mindless eating), yang berarti mereka makan lebih banyak dari yang dibutuhkan karena kurang memperhatikan sinyal kenyang dari tubuh mereka. Ini sering kali melibatkan camilan berkalori tinggi.\n\nKeempat, gangguan tidur. Cahaya biru dari layar, terutama sebelum tidur, dapat menekan produksi melatonin, hormon tidur. Kurang tidur, seperti yang diulas dalam fakta lain, dapat mengganggu hormon pengatur nafsu makan (ghrelin dan leptin), membuat anak merasa lebih lapar dan lebih rentan terhadap makanan berkalori tinggi.\n\nPara ahli kesehatan, termasuk American Academy of Pediatrics, merekomendasikan pembatasan waktu layar rekreasional maksimal 1-2 jam per hari untuk anak usia sekolah. Mengganti waktu layar dengan bermain aktif, olahraga, atau interaksi sosial adalah kunci untuk menjaga berat badan dan kesehatan fisik serta mental anak.',
      author: 'Altru Health System',
      date: '15 Jun 2025',
    ),
    FunFact(
      title: 'Gula tambahan dalam minuman menyumbang kalori kosong',
      imagePath: 'https://images.unsplash.com/photo-1750762285719-eb784c804f2f',
      content:
          'Konsep "kalori kosong" sangat penting dalam memahami peningkatan obesitas anak. Kalori kosong merujuk pada kalori yang berasal dari makanan atau minuman yang mengandung sedikit atau bahkan tidak ada zat gizi penting seperti serat, vitamin, mineral, atau protein. Minuman manis adalah penyumbang kalori kosong terbesar dalam pola makan anak.\n\nMinuman seperti soda, teh manis kemasan, minuman rasa buah, dan bahkan jus buah yang diberi gula tambahan, sarat dengan gula olahan. Gula ini memberikan sejumlah besar kalori, namun karena tidak mengandung serat atau protein, mereka tidak memberikan rasa kenyang yang signifikan. Akibatnya, anak dapat mengonsumsi ratusan kalori tambahan tanpa mengurangi asupan makanan utama mereka.\n\nAsupan gula cair ini sangat berbahaya karena diproses cepat oleh hati, yang dapat memicu penyimpanan lemak tubuh dan meningkatkan risiko resistensi insulin. Berbeda dengan gula yang ada secara alami di buah utuh (yang diimbangi dengan serat), gula tambahan dalam minuman masuk ke sistem tubuh dengan cepat, menyebabkan lonjakan gula darah.\n\nKonsumsi rutin minuman manis tidak hanya memicu penambahan berat badan, tetapi juga meningkatkan risiko masalah gigi (karies) dan mengganggu kebiasaan makan yang sehat. Otak anak menjadi terbiasa dengan rasa manis yang intens, membuat mereka kurang menyukai rasa makanan utuh yang sehat, seperti sayuran dan buah-buahan tanpa pemanis.\n\nStrategi terbaik adalah memilih air putih sebagai minuman utama. Jika ingin memberikan rasa, pertimbangkan air yang diberi irisan lemon, mentimun, atau buah beri segar, dan batasi konsumsi minuman kemasan manis sebisa mungkin. Mengurangi kalori kosong adalah langkah efektif untuk mengontrol berat badan dan meningkatkan kualitas gizi anak.',
      author: 'HelpGuide',
      date: '25 May 2025',
    ),
    FunFact(
      title: 'Kurang tidur bisa berkontribusi ke obesitas anak',
      imagePath: 'https://images.unsplash.com/photo-1584034724621-59e62d08bf9f',
      content:
          'Meskipun tidur sering dianggap sebagai kegiatan pasif, kualitas dan kuantitas tidur malam hari memainkan peran yang sangat aktif dalam regulasi berat badan, bahkan pada anak-anak. Kurang tidur, atau tidur yang tidak teratur, telah terbukti menjadi faktor risiko independen untuk obesitas pada masa kanak-kanak dan remaja.\n\nHubungan ini sebagian besar dijelaskan oleh gangguan pada hormon yang mengatur nafsu makan. Ada dua hormon kunci: *Ghrelin* (hormon lapar) dan *Leptin* (hormon kenyang). Ketika anak kurang tidur, tubuh mereka memproduksi lebih banyak *Ghrelin*, yang meningkatkan rasa lapar dan merangsang keinginan untuk makan.\n\nPada saat yang sama, kadar *Leptin* cenderung menurun. *Leptin* bertugas memberi sinyal kepada otak bahwa tubuh sudah kenyang. Dengan kadar *Leptin* yang rendah, anak tidak merasa puas setelah makan dan cenderung mencari makanan lagi, yang berkontribusi pada asupan kalori berlebihan.\n\nSelain efek hormonal, kurang tidur juga memengaruhi pilihan makanan. Anak yang lelah cenderung mencari sumber energi cepat, yaitu makanan yang tinggi karbohidrat sederhana, gula, dan lemak—atau yang sering disebut *comfort food*. Ini adalah cara tubuh yang kelelahan mencoba mengimbangi kurangnya energi.\n\nKurang tidur juga berhubungan dengan tingkat kortisol yang lebih tinggi (hormon stres). Kortisol yang tinggi dapat memicu penyimpanan lemak, terutama di daerah perut. Efek gabungan dari perubahan hormon, pilihan makanan yang buruk, dan penyimpanan lemak yang meningkat menjadikan kurang tidur sebagai pendorong obesitas yang kuat.\n\nMemastikan anak mendapatkan jumlah jam tidur yang direkomendasikan untuk usia mereka (misalnya, 9-12 jam untuk anak usia 6-12 tahun) adalah sama pentingnya dengan nutrisi dan olahraga. Menetapkan rutinitas tidur yang konsisten dan menciptakan lingkungan tidur yang gelap, tenang, dan sejuk adalah investasi penting untuk kesehatan jangka panjang mereka.',
      author: 'Childhood Obesity Foundation & Sleep Foundation',
      date: '10 May 2025',
    ),
    FunFact(
      title: 'Anak yang sarapan cenderung memiliki berat badan lebih sehat',
      imagePath:
          'https://plus.unsplash.com/premium_photo-1682003612072-cd5cad196d2b',
      content:
          'Sarapan sering disebut sebagai "makan paling penting dalam sehari," dan dalam konteks manajemen berat badan anak, pepatah ini memiliki dasar ilmiah yang kuat. Studi observasional secara konsisten menunjukkan bahwa anak-anak yang rutin mengonsumsi sarapan memiliki Indeks Massa Tubuh (IMT) yang lebih sehat dibandingkan dengan mereka yang melewatkannya.\n\nSarapan yang seimbang membantu "memecah" periode puasa semalaman dan mengaktifkan metabolisme tubuh. Hal ini penting karena tubuh yang lapar cenderung lebih efisien dalam menyimpan kalori sebagai lemak di kemudian hari sebagai respons adaptif terhadap puasa yang berkepanjangan. Dengan sarapan, tubuh menerima sinyal bahwa pasokan energi telah dimulai.\n\nManfaat utama sarapan terletak pada kemampuannya untuk mengontrol rasa lapar. Sarapan yang mengandung kombinasi protein, serat, dan karbohidrat kompleks (misalnya, telur, *oatmeal*, buah) dapat menjaga kadar gula darah tetap stabil. Hal ini mencegah lonjakan dan penurunan gula darah yang tajam yang bisa memicu rasa lapar berlebihan dan keinginan untuk ngemil tidak sehat di pertengahan pagi.\n\nAnak yang tidak sarapan cenderung mengonsumsi kalori lebih banyak dan pilihan makanan yang lebih buruk pada waktu makan berikutnya (makan siang) dan lebih sering mengonsumsi camilan manis atau berlemak tinggi. Rasa lapar yang intens akibat melewatkan sarapan seringkali membuat mereka "balas dendam" dengan porsi yang lebih besar.\n\nSelain manfaat berat badan, sarapan juga penting untuk fungsi kognitif. Sarapan yang sehat memberikan bahan bakar bagi otak, meningkatkan konsentrasi, memori, dan performa akademik di sekolah. Dengan demikian, sarapan adalah ritual harian yang mendukung kesehatan fisik dan mental anak secara keseluruhan.',
      author: 'Centers for Disease Control and Prevention (CDC)',
      date: '20 Apr 2025',
    ),
    FunFact(
      title: 'Makan sayur & buah tiap hari bantu cegah kelebihan berat badan',
      imagePath: 'https://images.unsplash.com/photo-1506806732259-39c2d0268443',
      content:
          'Mengintegrasikan porsi harian buah dan sayur yang cukup adalah salah satu fondasi terpenting dalam mencegah kelebihan berat badan dan obesitas pada anak. Makanan nabati ini adalah "paket lengkap" nutrisi yang secara alami rendah kalori namun tinggi akan serat, vitamin, dan mineral penting.\n\nKunci utama peran sayur dan buah dalam manajemen berat badan adalah kandungan seratnya yang tinggi. Serat adalah karbohidrat yang tidak dapat dicerna oleh tubuh, yang bertindak sebagai "pengisi" dalam sistem pencernaan. Serat ini memberikan rasa kenyang yang lama dengan jumlah kalori yang minimal, sehingga secara otomatis mengurangi total asupan kalori harian.\n\nSelain itu, buah dan sayur memiliki kepadatan energi yang rendah, yang berarti mereka memiliki sedikit kalori per volume makanan. Anak dapat mengisi perut mereka dengan porsi besar sayuran atau buah tanpa mengonsumsi banyak kalori, membantu mereka merasa kenyang dan menghindari konsumsi makanan tinggi lemak dan gula.\n\nKandungan vitamin, mineral, dan antioksidan yang melimpah juga berperan dalam menjaga metabolisme yang sehat dan mengurangi peradangan dalam tubuh, faktor-faktor yang penting untuk menjaga berat badan yang seimbang. Pilihan buah dan sayur yang beragam memastikan anak mendapatkan spektrum nutrisi yang luas.\n\nStrategi efektif adalah menjadikan sayur dan buah sebagai camilan utama, menggantikan keripik atau kue kering. Menyajikan sayuran dengan cara yang menarik (misalnya, wortel stik, brokoli panggang) dan membiarkan anak memilih buah favorit mereka dapat mendorong konsumsi harian yang konsisten, membentuk kebiasaan makan sehat seumur hidup.',
      author: 'CDC & USDA Dietary Guidelines',
      date: '10 Apr 2025',
    ),
    FunFact(
      title: 'Aktivitas fisik rutin penting untuk menjaga berat badan sehat',
      imagePath: 'https://images.unsplash.com/photo-1517649763962-0c623066013b',
      content:
          'Selain nutrisi, aktivitas fisik adalah pilar kedua yang tak terpisahkan dalam upaya menjaga berat badan sehat pada anak-anak. Semakin banyak anak terlibat dalam olahraga atau bermain aktif, semakin besar energi yang mereka keluarkan, yang merupakan faktor kunci dalam menyeimbangkan kalori yang masuk.\n\nAktivitas fisik tidak hanya membakar kalori tetapi juga membangun dan mempertahankan massa otot. Otot membakar lebih banyak kalori daripada jaringan lemak, bahkan saat tubuh sedang beristirahat. Dengan demikian, anak yang aktif memiliki tingkat metabolisme basal yang lebih tinggi, yang membuat tubuh mereka lebih efisien dalam mengelola berat badan.\n\nOrganisasi kesehatan dunia, termasuk WHO, menyarankan bahwa anak-anak dan remaja usia 5–17 tahun harus melakukan minimal 60 menit aktivitas fisik intensitas sedang hingga tinggi setiap hari. Aktivitas ini harus mencakup gerakan yang meningkatkan detak jantung (seperti berlari, bersepeda) dan aktivitas yang memperkuat tulang dan otot (seperti melompat atau panjat tebing).\n\nManfaat aktivitas fisik melampaui manajemen berat badan. Olahraga teratur meningkatkan kesehatan kardiovaskular, memperkuat tulang, meningkatkan suasana hati dengan melepaskan endorfin, dan membantu tidur yang lebih nyenyak. Selain itu, aktivitas fisik memberikan kesempatan untuk bersosialisasi dan membangun rasa percaya diri.\n\nPenting bagi orang tua untuk memodelkan perilaku aktif dan menyediakan lingkungan yang mendukung. Daripada memaksa olahraga, doronglah permainan aktif dan menyenangkan yang tidak terasa seperti tugas. Jadikan aktivitas fisik sebagai bagian rutin dan menyenangkan dari kehidupan keluarga untuk membentuk kebiasaan sehat jangka panjang.',
      author: 'World Health Organization (WHO) & MyObesityTeam',
      date: '15 Mar 2025',
    ),
    FunFact(
      title: 'Jumlah anak obesitas kini melebihi anak kekurangan gizi di dunia',
      imagePath: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773',
      content:
          'Dunia sedang menghadapi fenomena yang belum pernah terjadi sebelumnya: pergeseran beban gizi ganda (*double burden of malnutrition*). Secara historis, kekurangan gizi (*stunting* dan *wasting*) menjadi tantangan utama, namun laporan terbaru menunjukkan adanya persimpangan kritis di mana jumlah anak yang mengalami obesitas telah melampaui jumlah anak yang kekurangan gizi di seluruh dunia.\n\nPergeseran ini mencerminkan perubahan global dalam pola makan dan gaya hidup. Pola makan telah beralih dari diet tradisional kaya serat dan makanan utuh menjadi diet yang didominasi makanan olahan, tinggi gula, lemak tidak sehat, dan rendah nutrisi esensial. Perubahan ini diperparah oleh urbanisasi dan pemasaran makanan yang agresif.\n\nFenomena obesitas yang meningkat pesat ini sering terjadi bahkan di negara-negara berpenghasilan rendah dan menengah, di mana anak-anak yang sebelumnya berjuang dengan kekurangan gizi kini terpapar pada lingkungan yang mendukung obesitas (*obesogenic environment*). Kondisi ini menciptakan lingkaran setan, di mana anak-anak dapat mengalami kekurangan zat gizi mikro (vitamin dan mineral) meskipun memiliki kelebihan berat badan.\n\nKelebihan berat badan dan obesitas pada anak tidak hanya meningkatkan risiko penyakit tidak menular (seperti diabetes dan penyakit jantung) di usia dewasa, tetapi juga memberikan beban berat pada sistem kesehatan dan ekonomi global. Obesitas menghambat potensi individu dan menekan produktivitas negara.\n\nUNICEF dan organisasi kesehatan lainnya menyerukan tindakan cepat, terpadu, dan multi-sektoral. Solusinya harus mencakup regulasi pemasaran makanan, label gizi yang jelas, peningkatan akses ke makanan sehat yang terjangkau, serta promosi lingkungan sekolah dan komunitas yang mendukung aktivitas fisik dan pola makan seimbang.',
      author: 'UNICEF & WHO Joint Global Report',
      date: '10 Mar 2025',
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
