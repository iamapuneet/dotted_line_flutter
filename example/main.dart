import 'dart:math';
import 'package:dotted_line_flutter/dotted_line_flutter.dart';
import 'package:flutter/material.dart';

class DottedLineExample extends StatelessWidget {
  const DottedLineExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Dotted Examples',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            DottedText(
              text: "Flutter",
              textStyle: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              dotSize: 4.0,
              dotSpacing: 3.0,
              colors: [Colors.red, Colors.orange],
            ),
            DottedLine(
              axis: Axis.horizontal,
              lineThickness: 3,
              shadowColor: Colors.blueAccent,
              shadowBlurRadius: 40,
              dashGap: 5,
              colors: [
                Colors.amberAccent,
                Colors.deepPurple,
              ],
            ),
            SizedBox(
              height: 20,
            ),
            DottedWidget(
              width: 120,
              height: 50,
              borderRadius: 20,
              colors: [Colors.blue, Colors.green],
              dashWidth: 6,
              shadowBlurRadius: 0,
              dashGap: 4,
              child: Text('Hello', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DottedWidget(
                  width: 100,
                  height: 100,
                  lineThickness: 3,
                  dashWidth: 3,
                  borderRadius: 3,
                  shadowBlurRadius: 0,
                  colors: [Colors.red, Colors.orange],
                  shape: BoxShape.circle,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(width: 20),
                DottedWidget(
                  width: 100,
                  height: 100,
                  colors: [Colors.red, Colors.orange],
                  shape: BoxShape.circle,
                  child: Icon(Icons.account_circle, size: 50),
                ),
              ],
            ),
            DottedStar(
              size: 100, // Base size of the star
              points: 5, // 5-point star
              dotSize: 4, // Dot size
              dotSpacing: 6, // Dot spacing
              scaleFactor: 1, // Scale up by 1.5x
              angle: pi / 1.4,
              gradientColors: [Colors.blue, Colors.purple], // Gradient color
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DottedLine(
                  axis: Axis.vertical,
                  lineThickness: 3,
                  height: 60,
                  shadowColor: Colors.blueAccent,
                  shadowBlurRadius: 40,
                  dashGap: 5,
                  colors: [
                    Colors.amberAccent,
                    Colors.deepPurple,
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                DottedLine(
                  axis: Axis.vertical,
                  lineThickness: 3,
                  height: 60,
                  dashGap: 6,
                  dashWidth: 6,
                  colors: [Colors.red, Colors.blue],
                  shadowColor: Colors.black,
                  shadowBlurRadius: 10.0,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            DottedLine(
              axis: Axis.horizontal,
              lineThickness: 3,
              dashGap: 6,
              dashWidth: 6,
              colors: [Colors.red, Colors.blue], // ✅ Gradient Dotted Line
              shadowColor: Colors.red, // ✅ Dark Shadow
              shadowBlurRadius: 6.0, // ✅ Stronger Blur Effect
            ),
            SizedBox(height: 20),
            Row(
              children: [
                DottedShape(
                    shapeType: ShapeType.crescent, dotColor: Color(0xff02343F)),
                SizedBox(
                  width: 20,
                ),
                DottedShape(
                  shapeType: ShapeType.cylinder,
                  dotColor: Color(0xffFEE715),
                ),
                SizedBox(width: 20),
                DottedShape(
                  shapeType: ShapeType.heart,
                  dotColor: Color(0xfff101820),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                DottedShape(shapeType: ShapeType.hexagon, dotColor: Colors.red),
                SizedBox(width: 20),
                DottedShape(
                    shapeType: ShapeType.hexagram, dotColor: Colors.red),
                SizedBox(width: 20),
                DottedShape(shapeType: ShapeType.oval, dotColor: Colors.red),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                DottedShape(
                    shapeType: ShapeType.pentagon, dotColor: Colors.red),
                SizedBox(width: 20),
                DottedShape(shapeType: ShapeType.rhombus, dotColor: Colors.red),
                SizedBox(width: 20),
                DottedShape(
                    shapeType: ShapeType.semicircle, dotColor: Colors.red),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                DottedShape(
                    shapeType: ShapeType.triangle, dotColor: Colors.red),
                SizedBox(width: 20),
                DottedShape(
                    shapeType: ShapeType.triquetra, dotColor: Colors.red),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 10),
            DottedCube(
              size: 120, // Cube size
              dotSize: 4, // Dot size
              dotSpacing: 6, // Dot spacing
              scaleFactor: 1.2, // Scale the cube
              angle: pi / 4, // Rotate the cube (30 degrees)
              gradientColors: [Colors.red, Colors.green], // Gradient color
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
