import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselComponen extends StatefulWidget {
  @override
  _CarouselComponenState createState() => _CarouselComponenState();
}

class _CarouselComponenState extends State<CarouselComponen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15, right: 0, left: 0),
      width: MediaQuery.of(context).size.width * 0.9,
      // height: MediaQuery.of(context).size.height * 0.28,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayAnimationDuration: Duration(seconds: 2),
          disableCenter: false,
          pauseAutoPlayInFiniteScroll: false,
          viewportFraction: 3,
          enlargeCenterPage: true,
        ),
        items: [
          ItemsCarousel(
            color: Colors.orange.shade100,
            pathImg: 'assets/icon/hug.png',
            title: 'Konsultasi ke chatbot',
            subtitle:
                'Dapatkan jawaban cepat seputar tumbuh kembang anak langsung dari chatbot pintar kami.',
          ),
          ItemsCarousel(
            color: Colors.pink.shade100,
            pathImg: 'assets/icon/body-fat.png',
            title: 'Hitung gizi si kecil',
            subtitle:
                'Pantau kebutuhan gizi anak berdasarkan berat badan, tinggi badan, dan usia secara akurat',
          ),
          ItemsCarousel(
            color: Colors.blue.shade100,
            pathImg: 'assets/icon/child.png',
            title: 'Monitoring pola hidup',
            subtitle:
                'Lacak aktivitas, asupan makan, dan pola tidur anak untuk mendukung tumbuh kembang optimal',
          ),
        ],
      ),
    );
  }
}

class ItemsCarousel extends StatelessWidget {
  final String pathImg;
  final String title;
  final Color color;
  final String subtitle;
  const ItemsCarousel({
    super.key,
    required this.pathImg,
    required this.title,
    required this.color,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      margin: EdgeInsets.only(right: 0, left: 0),
      width: MediaQuery.of(context).size.width * 0.95,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(pathImg),
          SizedBox(width: 15),
          SizedBox(
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(subtitle, style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
