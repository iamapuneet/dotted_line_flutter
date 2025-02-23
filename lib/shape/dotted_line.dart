part of '../dotted_line_flutter.dart';

/// A custom widget that renders a dotted line with optional gradient, shadow,
/// and configurable spacing.
class DottedLine extends StatelessWidget {
  /// A list of colors used to create a gradient effect on the dotted line.
  final List<Color> colors;

  /// The thickness of the line (height for horizontal, width for vertical).
  final double lineThickness;

  /// The gap between dashes.
  final double dashGap;

  /// The width of each dash.
  final double dashWidth;

  /// The total height of the widget (applicable for horizontal lines).
  final double height;

  /// The direction of the dotted line (horizontal or vertical).
  final Axis axis;

  /// The shadow color applied to the dashes.
  final Color shadowColor;

  /// The blur radius of the shadow.
  final double shadowBlurRadius;

  /// Creates a `DottedLine` widget with customizable properties.
  const DottedLine({
    super.key,
    this.colors = const [Colors.purple],
    this.lineThickness = 2.0,
    this.dashGap = 5.0,
    this.height = 2.0,
    this.dashWidth = 5.0,
    this.axis = Axis.horizontal,
    this.shadowColor = Colors.black54,
    this.shadowBlurRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedLinePainter(
        colors: colors.isEmpty ? [Colors.purple] : colors,
        lineThickness: lineThickness,
        dashGap: dashGap,
        dashWidth: dashWidth,
        axis: axis,
        shadowColor: shadowColor,
        shadowBlurRadius: shadowBlurRadius,
      ),
      size: axis == Axis.horizontal
          ? Size(double.infinity, height)
          : Size(1, height),
    );
  }
}

/// A custom painter that draws a dotted line with optional gradient and shadow.
class _DottedLinePainter extends CustomPainter {
  final List<Color> colors;
  final double lineThickness;
  final double dashGap;
  final double dashWidth;
  final Axis axis;
  final Color shadowColor;
  final double shadowBlurRadius;

  _DottedLinePainter({
    required this.colors,
    required this.lineThickness,
    required this.dashGap,
    required this.dashWidth,
    required this.axis,
    required this.shadowColor,
    required this.shadowBlurRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineThickness
      ..strokeCap = StrokeCap.round;

    // Shadow Paint
    final Paint shadowPaint = Paint()
      ..color = shadowColor
      ..strokeWidth = lineThickness
      ..strokeCap = StrokeCap.round
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, shadowBlurRadius);

    // Apply gradient shader if multiple colors are provided
    if (colors.length > 1) {
      paint.shader = LinearGradient(
        colors: colors,
        begin: axis == Axis.horizontal
            ? Alignment.centerLeft
            : Alignment.topCenter,
        end: axis == Axis.horizontal
            ? Alignment.centerRight
            : Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    } else {
      paint.color = colors.first;
    }

    double startPos = 0.0;
    bool isGap = false;

    while (startPos < (axis == Axis.horizontal ? size.width : size.height)) {
      if (!isGap) {
        final Offset startOffset = axis == Axis.horizontal
            ? Offset(startPos, size.height / 2)
            : Offset(size.width / 2, startPos);
        final Offset endOffset = axis == Axis.horizontal
            ? Offset(startPos + dashWidth, size.height / 2)
            : Offset(size.width / 2, startPos + dashWidth);

        // Draw shadow layer with a slight offset
        canvas.drawLine(
          startOffset.translate(2, 2),
          endOffset.translate(2, 2),
          shadowPaint,
        );

        // Draw actual dotted line segment
        canvas.drawLine(startOffset, endOffset, paint);
      }
      startPos += isGap ? dashGap : dashWidth;
      isGap = !isGap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
