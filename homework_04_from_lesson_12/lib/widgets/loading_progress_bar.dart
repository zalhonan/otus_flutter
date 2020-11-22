import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../services/colors.dart';

class LoadingProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(color: kDescriptionBackground),
          child: ProgressLoader(color: Colors.white),
        ),
      ),
    );
  }
}

class ProgressBarPainter extends CustomPainter {
  static const int _steps = 8;

  final Color color;
  final double rotation;

  final _angleStep = pi * 2 / _steps;
  ProgressBarPainter({@required this.rotation, @required this.color});

  @override
  void paint0(Canvas canvas, Size size) {
    final maxPaintRadius = size.width / 10;
    final mainCircleRadius = size.width / 2 - maxPaintRadius;
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = color.withAlpha(0xD0);

    for (int i = 0; i < 12; i++) {
      final currentAngle = i * _angleStep;

      final offset = Offset(center.dx + mainCircleRadius * cos(currentAngle),
          center.dy + mainCircleRadius * sin(currentAngle));
      canvas.drawCircle(offset, maxPaintRadius, paint);
    }
  }

  @override
  void paint1(Canvas canvas, Size size) {
    final maxPaintRadius = size.width / 10;
    final mainCircleRadius = size.width / 2 - maxPaintRadius;

    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = color.withAlpha(0xD0);
    final elementRadiusStep = maxPaintRadius / _steps;

    for (int i = 0; i < _steps; i++) {
      final currentAngle = i * _angleStep;

      final currentRadius = elementRadiusStep * (i + 1);
      final offset = Offset(center.dx + mainCircleRadius * cos(currentAngle),
          center.dy + mainCircleRadius * sin(currentAngle));
      canvas.drawCircle(offset, currentRadius, paint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (size.isEmpty) {
      return;
    }

    final maxPaintRadius = size.width / 10;
    final mainCircleRadius = size.width / 2 - maxPaintRadius;
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = color;

    final allSteps = _steps; // + _steps ~/ 4;

    for (int i = 0; i < allSteps; i++) {
      final currentAngle = _angleStep * (i + (_steps * rotation).toInt());

      final currentRadius = maxPaintRadius * (i / allSteps);
      final offset = Offset(center.dx + mainCircleRadius * cos(currentAngle),
          center.dy + mainCircleRadius * sin(currentAngle));
      canvas.drawCircle(offset, currentRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ProgressLoader extends StatefulWidget {
  final Color color;

  const ProgressLoader({Key key, this.color: Colors.white}) : super(key: key);

  @override
  _ProgressLoaderState createState() => _ProgressLoaderState();
}

class _ProgressLoaderState extends State<ProgressLoader>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, Widget childWidget) {
          return Container(
            child: CustomPaint(
              child: childWidget,
              painter: ProgressBarPainter(
                rotation: _controller.value,
                color: widget.color,
              ),
            ),
          );
        });
  }
}
