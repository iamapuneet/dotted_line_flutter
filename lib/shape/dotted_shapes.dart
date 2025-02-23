part of '../dotted_line_flutter.dart';

/// Enum representing different shape types.
///
/// This enum defines various geometric shapes that can be used
/// in different contexts such as UI design, graphics rendering,
/// and mathematical operations.
enum ShapeType {
  /// A cone shape.
  cone,

  /// A cylinder shape.
  cylinder,

  /// An oval shape.
  oval,

  /// A triangle shape.
  triangle,

  /// A hexagon shape.
  hexagon,

  /// A pentagon shape.
  pentagon,

  /// A hexagram shape.
  hexagram,

  /// A rhombus shape.
  rhombus,

  /// A heart shape.
  heart,

  /// A triquetra shape.
  triquetra,

  /// A semicircle shape.
  semicircle,

  /// A crescent shape.
  crescent,
}

/// A widget that represents a dotted shape based on a given [ShapeType].
///
/// This widget allows customization of the shape's size, dot size, spacing,
/// and color.
class DottedShape extends StatelessWidget {
  /// The overall size of the shape.
  final double size;

  /// The size of individual dots forming the shape.
  final double dotSize;

  /// The spacing between dots in the shape.
  final double dotSpacing;

  /// The type of shape to be drawn using dots.
  final ShapeType shapeType;

  /// The color of the dots forming the shape.
  final Color dotColor;

  /// Creates a [DottedShape] widget.
  ///
  /// [shapeType] is required to define the shape to be drawn.
  /// [size] defines the overall size of the shape.
  /// [dotSize] controls the size of each individual dot.
  /// [dotSpacing] determines the spacing between dots.
  /// [dotColor] sets the color of the dots.
  const DottedShape({
    super.key,
    required this.shapeType,
    this.size = 100.0,
    this.dotSize = 4.0,
    this.dotSpacing = 6.0,
    this.dotColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedShapePainter(
        shapeType: shapeType,
        dotSize: dotSize,
        dotSpacing: dotSpacing,
        dotColor: dotColor,
      ),
      size: Size(size, size),
    );
  }
}

/// Custom painter that draws the dotted shape.
class _DottedShapePainter extends CustomPainter {
  final ShapeType shapeType;
  final double dotSize;
  final double dotSpacing;
  final Color dotColor;

  _DottedShapePainter({
    required this.shapeType,
    required this.dotSize,
    required this.dotSpacing,
    required this.dotColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = dotColor;
    Path path = getShapePath(size);
    drawDottedPath(canvas, paint, path);
  }

  /// Returns the path of the specified shape.
  Path getShapePath(Size size) {
    switch (shapeType) {
      case ShapeType.cone:
        return _createConePath(size);
      case ShapeType.cylinder:
        return _createCylinderPath(size);
      case ShapeType.oval:
        return _createOvalPath(size);
      case ShapeType.triangle:
        return _createPolygonPath(size, 3);
      case ShapeType.hexagon:
        return _createPolygonPath(size, 6);
      case ShapeType.pentagon:
        return _createPolygonPath(size, 5);
      case ShapeType.hexagram:
        return _createHexagramPath(size);
      case ShapeType.rhombus:
        return _createRhombusPath(size);
      case ShapeType.heart:
        return _createHeartPath(size);
      case ShapeType.triquetra:
        return _createTriquetraPath(size);
      case ShapeType.semicircle:
        return _createSemiCirclePath(size);
      case ShapeType.crescent:
        return _createCrescentPath(size);
    }
  }

  /// Draws the dotted path based on the computed path metrics.
  void drawDottedPath(Canvas canvas, Paint paint, Path path) {
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        Tangent? tangent = pathMetric.getTangentForOffset(distance);
        if (tangent != null) {
          canvas.drawCircle(tangent.position, dotSize / 2, paint);
        }
        distance += dotSize + dotSpacing;
      }
    }
  }

  /// Creates a hexagram path.
  Path _createHexagramPath(Size size) {
    Path path = _createPolygonPath(size, 6);
    path.addPath(_createPolygonPath(size, 6)..shift(Offset(0, size.height / 6)),
        Offset.zero);
    return path;
  }

  /// Creates a Rhombus Path.
  Path _createRhombusPath(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 2);
    path.close();
    return path;
  }

  /// Creates a Triquetra Path.
  Path _createTriquetraPath(Size size) {
    Path path = Path();
    double radius = size.width / 3;
    for (int i = 0; i < 3; i++) {
      path.addArc(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2), radius: radius),
          i * 2 * pi / 3,
          pi);
    }
    return path;
  }

  /// Creates a cone-shaped path.
  Path _createConePath(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  /// Creates a cylinder-shaped path.
  Path _createCylinderPath(Size size) {
    Path path = Path();
    path.addOval(Rect.fromLTRB(0, 0, size.width, size.height / 4));
    path.moveTo(0, size.height / 8);
    path.lineTo(0, size.height * 0.9);
    path.lineTo(size.width, size.height * 0.9);
    path.lineTo(size.width, size.height / 8);
    path.close();
    return path;
  }

  /// Creates an oval-shaped path.
  Path _createOvalPath(Size size) {
    return Path()..addOval(Rect.fromLTRB(0, 0, size.width, size.height));
  }

  /// Creates a polygon-shaped path (triangle, hexagon, pentagon, etc.).
  Path _createPolygonPath(Size size, int sides) {
    Path path = Path();
    double radius = size.width / 2;
    double angle = (2 * pi) / sides;

    for (int i = 0; i < sides; i++) {
      double x = size.width / 2 + radius * cos(i * angle);
      double y = size.height / 2 + radius * sin(i * angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  /// Creates a heart-shaped path.
  Path _createHeartPath(Size size) {
    Path path = Path();
    path.moveTo(size.width / 2, size.height * 0.75);
    path.quadraticBezierTo(size.width, size.height * 0.2, size.width / 2, 0);
    path.quadraticBezierTo(
        0, size.height * 0.2, size.width / 2, size.height * 0.75);
    path.close();
    return path;
  }

  /// Creates a semicircle-shaped path.
  Path _createSemiCirclePath(Size size) {
    return Path()..addArc(Rect.fromLTRB(0, 0, size.width, size.height), pi, pi);
  }

  /// Creates a crescent-shaped path.
  Path _createCrescentPath(Size size) {
    Path path = Path();
    path.addOval(Rect.fromLTRB(0, 0, size.width, size.height));
    path.addOval(
        Rect.fromLTRB(size.width / 4, 0, size.width * 1.1, size.height));
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
