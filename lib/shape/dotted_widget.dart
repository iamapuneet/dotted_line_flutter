part of '../dotted_line_flutter.dart';

/// A custom widget that draws a dotted border around its child.
class DottedWidget extends StatelessWidget {
  /// The child widget inside the dotted border.
  final Widget? child;

  /// The border radius of the dotted border.
  final double borderRadius;

  /// The colors of the dotted border.
  final List<Color> colors;

  /// The thickness of the dotted lines.
  final double lineThickness;

  /// The gap between dashes in the dotted border.
  final double dashGap;

  /// The width of each dash in the dotted border.
  final double dashWidth;

  /// The direction of the dashes (horizontal or vertical).
  final Axis axis;

  /// The shadow color of the dotted border.
  final Color shadowColor;

  /// The blur radius for the shadow effect.
  final double shadowBlurRadius;

  /// The width of the container.
  final double width;

  /// The height of the container.
  final double height;

  /// The shape of the border (rectangle or circle).
  final BoxShape shape;

  /// Creates a [DottedWidget] with customizable properties.
  const DottedWidget({
    super.key,
    this.child,
    this.borderRadius = 10.0,
    this.colors = const [Colors.purple],
    this.lineThickness = 2.0,
    this.dashGap = 5.0,
    this.dashWidth = 5.0,
    this.axis = Axis.horizontal,
    this.shadowColor = Colors.black54,
    this.shadowBlurRadius = 4.0,
    this.width = 100.0,
    this.height = 50.0,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedBorderPainter(
        borderRadius: borderRadius,
        colors: colors,
        lineThickness: lineThickness,
        dashGap: dashGap,
        dashWidth: dashWidth,
        axis: axis,
        shadowColor: shadowColor,
        shadowBlurRadius: shadowBlurRadius,
        shape: shape,
      ),
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}

/// A custom painter that draws a dotted border.
class _DottedBorderPainter extends CustomPainter {
  final double borderRadius;
  final List<Color> colors;
  final double lineThickness;
  final double dashGap;
  final double dashWidth;
  final Axis axis;
  final Color shadowColor;
  final double shadowBlurRadius;
  final BoxShape shape;

  /// Creates a painter to draw a dotted border.
  _DottedBorderPainter({
    required this.borderRadius,
    required this.colors,
    required this.lineThickness,
    required this.dashGap,
    required this.dashWidth,
    required this.axis,
    required this.shadowColor,
    required this.shadowBlurRadius,
    required this.shape,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = lineThickness
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(colors: colors)
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlurRadius);

    Path path;
    if (shape == BoxShape.circle) {
      path = Path()
        ..addOval(Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2));
    } else {
      path = Path()
        ..addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height),
            Radius.circular(borderRadius)));
    }

    drawDottedPath(canvas, paint, path);
  }

  /// Draws a dotted pattern along the given path.
  void drawDottedPath(Canvas canvas, Paint paint, Path path) {
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        Tangent? tangent = pathMetric.getTangentForOffset(distance);
        if (tangent != null) {
          canvas.drawCircle(tangent.position, lineThickness / 2, paint);
        }
        distance += dashWidth + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
