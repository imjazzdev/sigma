// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';

// class NutritionGauge extends StatelessWidget {
//   final double value;
//   const NutritionGauge({super.key, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return SfRadialGauge(
//       axes: <RadialAxis>[
//         RadialAxis(
//           minimum: 0,
//           maximum: 100,
//           startAngle: 180,
//           endAngle: 0,
//           showTicks: false,
//           showLabels: false,
//           axisLineStyle: const AxisLineStyle(
//             thickness: 0.2,
//             thicknessUnit: GaugeSizeUnit.factor,
//           ),
//           ranges: <GaugeRange>[
//             GaugeRange(
//               startValue: 0,
//               endValue: 33.3,
//               color: Colors.red,
//               label: 'Kurang',
//               sizeUnit: GaugeSizeUnit.factor,
//               startWidth: 0.2,
//               endWidth: 0.2,
//               labelStyle: const GaugeTextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             GaugeRange(
//               startValue: 33.3,
//               endValue: 66.6,
//               color: Colors.orange,
//               label: 'Normal',
//               sizeUnit: GaugeSizeUnit.factor,
//               startWidth: 0.2,
//               endWidth: 0.2,
//               labelStyle: const GaugeTextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             GaugeRange(
//               startValue: 66.6,
//               endValue: 100,
//               color: Colors.green,
//               label: 'Lebih',
//               sizeUnit: GaugeSizeUnit.factor,
//               startWidth: 0.2,
//               endWidth: 0.2,
//               labelStyle: const GaugeTextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//           pointers: <GaugePointer>[
//             NeedlePointer(
//               value: value,
//               needleColor: Colors.black,
//               knobStyle: const KnobStyle(color: Colors.black),
//             ),
//           ],
//           annotations: <GaugeAnnotation>[
//             GaugeAnnotation(
//               widget: Text(
//                 '${value.toStringAsFixed(1)}%',
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               angle: 90,
//               positionFactor: 0.35,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class NutritionGauge extends StatefulWidget {
  final double value; // nilai 0–100
  const NutritionGauge({super.key, required this.value});

  @override
  State<NutritionGauge> createState() => _NutritionGaugeState();
}

class _NutritionGaugeState extends State<NutritionGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.value,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 100,
              startAngle: 180,
              endAngle: 0,
              showTicks: false,
              showLabels: false,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.2,
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 0,
                  endValue: 33.3,
                  color: Colors.red,
                  label: 'Kurang',
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.2,
                  endWidth: 0.2,
                  labelStyle: const GaugeTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                GaugeRange(
                  startValue: 33.3,
                  endValue: 66.6,
                  color: Colors.orange,
                  label: 'Normal',
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.2,
                  endWidth: 0.2,
                  labelStyle: const GaugeTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                GaugeRange(
                  startValue: 66.6,
                  endValue: 100,
                  color: Colors.green,
                  label: 'Lebih',
                  sizeUnit: GaugeSizeUnit.factor,
                  startWidth: 0.2,
                  endWidth: 0.2,
                  labelStyle: const GaugeTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: _animation.value,
                  needleColor: Colors.black,
                  knobStyle: const KnobStyle(color: Colors.black),
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    '${_animation.value.toStringAsFixed(1)}%',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.35,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
