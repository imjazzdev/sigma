import 'package:flutter/material.dart';

class WatermarkWrapper extends StatelessWidget {
  final Widget child;
  final double logoSize;
  final double opacity;

  const WatermarkWrapper({
    super.key,
    required this.child,
    this.logoSize = 300,
    this.opacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child, // Your whole app content
        Positioned(
          child: IgnorePointer(
            // prevent watermark from blocking gestures
            child: Opacity(
              opacity: opacity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/logo/watermark.png', // Ganti dengan logo kamu
                  width: logoSize,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
