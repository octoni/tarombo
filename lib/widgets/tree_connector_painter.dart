import 'package:flutter/material.dart';

class TreeConnectorPainter extends CustomPainter {
  final int childCount;

  TreeConnectorPainter({required this.childCount});

  @override
  void paint(Canvas canvas, Size size) {
    if (childCount == 0) return;

    final paint =
        Paint()
          ..color = Colors.grey.shade600
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke;

    final parentX = size.width / 2;
    const parentLineStartY = 0.0;
    const junctionY = 24.0;

    // Parent vertical line
    canvas.drawLine(
      Offset(parentX, parentLineStartY),
      Offset(parentX, junctionY),
      paint,
    );

    final spacing = size.width / childCount;

    final firstChildX = spacing / 2;
    final lastChildX = size.width - spacing / 2;

    // Horizontal connector
    canvas.drawLine(
      Offset(firstChildX, junctionY),
      Offset(lastChildX, junctionY),
      paint,
    );

    // Vertical lines to children (FULL HEIGHT)
    for (int i = 0; i < childCount; i++) {
      final childX = spacing * i + spacing / 2;

      canvas.drawLine(
        Offset(childX, junctionY),
        Offset(childX, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
