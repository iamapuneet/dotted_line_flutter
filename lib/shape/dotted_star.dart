part of '../dotted_line_flutter.dart';

/// A widget that renders a star-shaped dotted pattern using a customizable gradient.
class DottedStar extends StatelessWidget {
  /// The gradient colors used to fill the dots.
  final List<Color> gradientColors;

  /// The overall size of the star.
  final double size;

  /// The number of points in the star.
  final int points;

  /// The size of each dot forming the star.
  final double dotSize;

  /// The spacing between each dot in the star.
  final double dotSpacing;

  /// The scaling factor for resizing the star.
  final double scaleFactor;

  /// The rotation angle of the star in radians.
  final double angle;

  /// Creates a [DottedStar] widget with customizable properties.
  const DottedStar({
    super.key,
    this.gradientColors = const [Colors.yellow, Colors.orange],
    this.size = 50.0,
    this.points = 5,
    this.dotSize = 3.0,
    this.dotSpacing = 5.0,
    this.scaleFactor = 1.0,
    this.angle = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleFactor,
      child: Transform.rotate(
        angle: angle, // Rotate the star
        child: CustomPaint(
          painter: _StarPainter(
            gradientColors: gradientColors,
            points: points,
            dotSize: dotSize,
            dotSpacing: dotSpacing,
          ),
          size: Size(size, size),
        ),
      ),
    );
  }
}

/// A custom painter for rendering a dotted star shape.
class _StarPainter extends CustomPainter {
  /// The gradient colors for the dots.
  final List<Color> gradientColors;

  /// The number of points in the star.
  final int points;

  /// The size of each dot forming the star.
  final double dotSize;

  /// The spacing between each dot in the star.
  final double dotSpacing;

  /// Creates a [_StarPainter] with customizable properties.
  _StarPainter({
    required this.gradientColors,
    this.points = 5,
    this.dotSize = 3.0,
    this.dotSpacing = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Path starPath = _createStarPath(
      size.width / 2,
      size.height / 2,
      size.width / 2,
      points,
    );

    final Paint paint = Paint()
      ..shader = RadialGradient(colors: gradientColors).createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2,
        ),
      );

    final PathMetrics metrics = starPath.computeMetrics();
    for (final PathMetric metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        Offset point = metric.getTangentForOffset(distance)!.position;
        canvas.drawCircle(point, dotSize / 2, paint);
        distance += dotSpacing;
      }
    }
  }

  /// Generates a star path with the given parameters.
  Path _createStarPath(double cx, double cy, double radius, int points) {
    final Path path = Path();
    final double innerRadius = radius / 2.5;
    final double angle = pi / points;

    for (int i = 0; i < points * 2; i++) {
      double r = i.isEven ? radius : innerRadius;
      double x = cx + r * cos(i * angle);
      double y = cy + r * sin(i * angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
