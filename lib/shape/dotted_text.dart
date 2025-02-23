part of '../dotted_line_flutter.dart';

/// A custom widget that renders text using dotted patterns instead of solid glyphs.
///
/// This widget takes a string and paints it as a series of small dots using a
/// specified style, dot size, spacing, and gradient colors.
class DottedText extends StatelessWidget {
  /// The text content to display.
  final String text;

  /// The style of the text, including font size, weight, and color.
  final TextStyle textStyle;

  /// The diameter of each dot used to form the text.
  final double dotSize;

  /// The space between dots.
  final double dotSpacing;

  /// The gradient colors applied to the dots.
  final List<Color> colors;

  /// Creates a [DottedText] widget.
  const DottedText({
    super.key,
    required this.text,
    this.textStyle = const TextStyle(
        fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
    this.dotSize = 2.0,
    this.dotSpacing = 3.0,
    this.colors = const [Colors.purple, Colors.blue],
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedTextPainter(
        text: text,
        textStyle: textStyle,
        dotSize: dotSize,
        dotSpacing: dotSpacing,
        colors: colors,
      ),
    );
  }
}

/// A custom painter that draws text as a series of small dots.
class _DottedTextPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;
  final double dotSize;
  final double dotSpacing;
  final List<Color> colors;

  _DottedTextPainter({
    required this.text,
    required this.textStyle,
    required this.dotSize,
    required this.dotSpacing,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) async {
    // Paints the text to an offscreen canvas to extract pixel information.
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas textCanvas = Canvas(recorder);
    textPainter.paint(textCanvas, Offset.zero);
    final ui.Picture picture = recorder.endRecording();
    final ui.Image image = picture.toImageSync(
        textPainter.width.toInt(), textPainter.height.toInt());

    final ByteData? data =
        await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    if (data == null) return;

    final Uint8List bytes = data.buffer.asUint8List();
    final Paint dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(colors: colors)
          .createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // Iterate over image pixels and draw dots where text is present.
    for (int y = 0;
        y < textPainter.height.toInt();
        y += (dotSpacing + dotSize).toInt()) {
      for (int x = 0;
          x < textPainter.width.toInt();
          x += (dotSpacing + dotSize).toInt()) {
        final int index = (y * textPainter.width.toInt() + x) * 4;
        if (index >= bytes.length) continue;

        final int alpha = bytes[index + 3];
        if (alpha > 50) {
          canvas.drawCircle(
              Offset(x.toDouble(), y.toDouble()), dotSize / 2, dotPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
