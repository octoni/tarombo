import 'package:flutter/material.dart';

class TreeConnectorPainter extends CustomPainter {
  final int childCount;

  TreeConnectorPainter({required this.childCount});

  @override
  void paint(Canvas canvas, Size size) {
    if (childCount == 0) return;

    final paint = Paint()
      ..color = Colors.grey.shade600
      ..strokeWidth = 1.5;

    final parentX = size.width / 2;

    canvas.drawLine(
      Offset(parentX, 0),
      Offset(parentX, 20),
      paint,
    );

    final spacing = size.width / childCount;
    final firstChildX = spacing / 2;
    final lastChildX = size.width - spacing / 2;

    canvas.drawLine(
      Offset(firstChildX, 20),
      Offset(lastChildX, 20),
      paint,
    );

    for (int i = 0; i < childCount; i++) {
      final x = spacing * i + spacing / 2;
      canvas.drawLine(
        Offset(x, 20),
        Offset(x, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}