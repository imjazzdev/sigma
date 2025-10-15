import 'package:flutter/material.dart';

class ScaffoldTemplate extends StatelessWidget {
  final AppBar? appbar;
  final Widget? body;
  const ScaffoldTemplate({super.key, this.appbar, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.white, Colors.blue.shade100],
                ),
              ),
            ),
            body!,
          ],
        ),
      ),
    );
  }
}
