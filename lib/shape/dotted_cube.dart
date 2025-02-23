part of '../dotted_line_flutter.dart';

/// A widget that displays a 3D dotted cube with customizable properties.
class DottedCube extends StatelessWidget {
  /// The size of the cube.
  final double size;

  /// The size of each dot in the cube.
  final double dotSize;

  /// The spacing between dots.
  final double dotSpacing;

  /// The scaling factor for the cube.
  final double scaleFactor;

  /// The rotation angle of the cube.
  final double angle;

  /// The gradient colors for the cube.
  final List<Color> gradientColors;

  /// Creates a [DottedCube] widget with customizable properties.
  const DottedCube({
    super.key,
    this.size = 100.0,
    this.dotSize = 4.0,
    this.dotSpacing = 8.0,
    this.scaleFactor = 1.0,
    this.angle = 0.0,
    this.gradientColors = const [Colors.blue, Colors.purple],
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleFactor,
      child: Transform.rotate(
        angle: angle,
        child: CustomPaint(
          painter: _CubePainter(
            dotSize: dotSize,
            dotSpacing: dotSpacing,
            gradientColors: gradientColors,
          ),
          size: Size(size, size),
        ),
      ),
    );
  }
}

/// A custom painter that draws a 3D dotted cube.
class _CubePainter extends CustomPainter {
  /// The size of each dot in the cube.
  final double dotSize;

  /// The spacing between dots.
  final double dotSpacing;

  /// The gradient colors for the cube.
  final List<Color> gradientColors;

  /// Creates a [_CubePainter] with the given properties.
  _CubePainter({
    required this.dotSize,
    required this.dotSpacing,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Define cube points
    final Offset p1 = Offset(size.width * 0.2, size.height * 0.2);
    final Offset p2 = Offset(size.width * 0.8, size.height * 0.2);
    final Offset p3 = Offset(size.width * 0.8, size.height * 0.8);
    final Offset p4 = Offset(size.width * 0.2, size.height * 0.8);

    final Offset p5 = Offset(size.width * 0.4, size.height * 0.0);
    final Offset p6 = Offset(size.width * 1.0, size.height * 0.0);
    final Offset p7 = Offset(size.width * 1.0, size.height * 0.6);
    final Offset p8 = Offset(size.width * 0.4, size.height * 0.6);

    // Draw dotted cube edges
    _drawDottedLine(canvas, paint, p1, p2);
    _drawDottedLine(canvas, paint, p2, p3);
    _drawDottedLine(canvas, paint, p3, p4);
    _drawDottedLine(canvas, paint, p4, p1);

    _drawDottedLine(canvas, paint, p1, p5);
    _drawDottedLine(canvas, paint, p2, p6);
    _drawDottedLine(canvas, paint, p3, p7);
    _drawDottedLine(canvas, paint, p4, p8);

    _drawDottedLine(canvas, paint, p5, p6);
    _drawDottedLine(canvas, paint, p6, p7);
    _drawDottedLine(canvas, paint, p7, p8);
    _drawDottedLine(canvas, paint, p8, p5);
  }

  /// Draws a dotted line between [start] and [end] using [paint].
  void _drawDottedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
    final double distance = (end - start).distance;
    final int dotCount = (distance / (dotSize + dotSpacing)).floor();
    final Offset direction = (end - start) / distance;

    for (int i = 0; i < dotCount; i++) {
      Offset dotPosition =
          start + direction * i.toDouble() * (dotSize + dotSpacing);
      canvas.drawCircle(dotPosition, dotSize / 2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
