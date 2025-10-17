import 'package:flutter/material.dart';
import 'package:sigma/components/other/carousel.dart';
import 'package:sigma/pages/chatbot.dart';
import 'package:sigma/pages/menus/fun_fact/fun_fact.dart';
import 'package:sigma/pages/menus/monitoring/monitoring.dart';
import 'package:sigma/pages/menus/resep/resep.dart';
import 'package:sigma/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          Container(height: 150, child: CarouselComponen()),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                'Category',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuItem(
                pathImg: 'assets/icon/storytelling.png',
                title: 'Fun Fact',
                color: Colors.blue.shade100,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FunFactListPage()),
                  );
                },
              ),
              SizedBox(width: 30),
              MenuItem(
                pathImg: 'assets/icon/medical-report.png',
                title: 'Monitoring',
                color: Colors.pink.shade100,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MonitoringPage()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuItem(
                pathImg: 'assets/icon/calculator.png',
                title: 'Kalkulator Gizi',
                color: Colors.amber.shade100,
                fontSize: 10,
                onTap: () {},
              ),
              SizedBox(width: 30),
              MenuItem(
                pathImg: 'assets/icon/chatbot.png',
                title: 'Chatbot',
                color: Colors.blue.shade100,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChatbotPage()),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuItem(
                pathImg: 'assets/icon/recipe-book.png',
                title: 'Resep',
                color: Colors.pink.shade100,
                onTap: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => ResepPage()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String pathImg;
  final String title;
  final Color color;
  final double fontSize;
  final VoidCallback onTap;
  const MenuItem({
    super.key,
    required this.pathImg,
    required this.title,
    required this.color,
    this.fontSize = 14,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 130,
        width: 120,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 4, child: Image.asset(pathImg)),
            SizedBox(height: 4),
            Expanded(
              flex: 1,
              child: Text(title, style: TextStyle(fontSize: fontSize)),
            ),
          ],
        ),
      ),
    );
  }
}
