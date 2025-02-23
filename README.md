# Dotted Line Flutter Package

![Logo](https://blogger.googleusercontent.com/img/a/AVvXsEh-3WixyUqbulBnLmtjCYHybJV1ZbhNjlM_pkif4BllCI-PQ5_YIaZvcFF8GUG8qrykJIq9QhdGIcW9LlGijUNt3wShuQIVa0JhnxnazJ64iApAKiN9CAQOLWszZQVQZYyrTuNPkSDxTbf_cvn20gvB4oaBePOP4wAqGl3YUHBAJ-pwQzNTeh-ERbZj81g=w280-h280-s-no)

A highly customizable Flutter package for drawing **dotted, dashed, and gradient lines** in both horizontal and vertical directions. It also supports **shadow effects** and **multiple shapes**.

## ✨ Features

✅ **Dotted and Dashed Lines**  
✅ **Gradient Color Support**  
✅ **Customizable Dash Width & Gap**  
✅ **Horizontal & Vertical Orientation**  
✅ **Shadow Effect for Depth**  
✅ **More Shapes (Star, Circle, etc.)**  
✅ **Star Shape**  
✅ **Circle Dotted Line**  
✅ **Custom Dash Shapes**  
✅ **Patterned Dashes (Short-Long)**  


## 📦 Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  dotted_line_flutter: latest_version
```

Then run:

```sh
flutter pub get
```

## 🛠 Usage

### Basic Dotted Line

```dart
DottedLine(
axis: Axis.horizontal,
lineThickness: 2,
dashGap: 4,
dashWidth: 6,
colors: [Colors.red, Colors.blue], // Gradient Support
);
```

### Vertical Dotted Line

```dart
DottedLine(
axis: Axis.vertical,
lineThickness: 3,
dashGap: 5,
colors: [Colors.green], // Single color
);
```

### Shadow Effect

```dart
DottedLine(
axis: Axis.horizontal,
lineThickness: 3,
dashGap: 6,
colors: [Colors.orange, Colors.purple],
shadowColor: Colors.black,
shadowBlurRadius: 10.0,
);
``` 


## 🖼 Screenshot 1
![App Screenshot 1](https://blogger.googleusercontent.com/img/a/AVvXsEhKbsx8TyRbw6zAa1XXLBm4A0DLz-D4Q50La6gM3keCtSACHWF7AoWbsIEqCZWz4PMxeNBUKjCtlrTGDkSGfZskSca1623kAEnAjOwAlzBpo6u9YIdoSdFpXi-xdUeGY44AX6T4ZSppCEk5eZOKA3HL20JkzoWPZ-TsGSsAbJ8vUPN05djwm1zbc6n2daw=w329-h705-s-no)

## 🖼 Screenshot 2
![App Screenshot 2](https://lh3.googleusercontent.com/pw/AIL4fc84TDXjhTMGLf2XqW52SAEyY8-40tXf-fo75gPQGfkCaJ7P2Sne8GhqmbFaghr5r1mD1v2_y1cq0mzMkPuhF2L3H8vw8j8qZ9HRuuJ5vI5tFCFC1QUjzoARck1UpHO8LaXmE8JjoXwx4ORZbXg3rN2S=w329-h705-s-no)

## 🖼 Screenshot 3
![App Screenshot 3](https://blogger.googleusercontent.com/img/a/AVvXsEgNqxxUUx24JETdbL6W6IJpboXI6UPWu4bi7jKxVQerb_BbaUBSD2qeR96TrfRUL_BWkKw5UeqSAgO9hUqpCR1grpy0odS2-3fMQBpzCp9hZu6kvM1-x-ykGdecQbw8BEjekOUTu4_J0L8w5m1ddeqN8RsjPFbG9hLrhMC2pgGtEqFKnlBRt5VnYHm1INM=w329-h705-s-no)

## 🖼 Screenshot 4
![App Screenshot 4](https://blogger.googleusercontent.com/img/a/AVvXsEhOt5uR0JkTtg5zGQAgq2tGq1FrevY46h9yASWc292WwGSwsSogH24jbxywquUxz1BdR6CDtZ4m1b6k7FoTI0g8wbzdt-0l2d_n1wGK-KFEfkvg0jxAxwBSjJ2-wtgVbQBb6uyWNCKV7zXc1m6Jb3hPHOVp2xX5mC0Xo7OxE2yGfoFsNkK8vHcLcNrUwQA=w329-h705-s-no)



# DottedCube Widget

## Usage

### Parameters

| Parameter        | Default                        | Description                                         |
|-----------------|--------------------------------|-----------------------------------------------------|
| `size`          | `100.0`                        | The overall size of the cube.                      |
| `dotSize`       | `4.0`                          | The size of each individual dot.                   |
| `dotSpacing`    | `8.0`                          | The spacing between dots.                          |
| `scaleFactor`   | `1.0`                          | The scale factor to resize the widget.             |
| `angle`         | `0.0`                          | The rotation angle of the cube.                    |
| `gradientColors`| `[Colors.blue, Colors.purple]` | The gradient colors used for the dots.             |

The `DottedCube` widget can be used without parameters.

```dart
import 'package:flutter/material.dart';

DottedCube()
```

You can also customize it by specifying parameters.

```dart
import 'package:flutter/material.dart';

DottedCube(
  size: 120.0,
  dotSize: 5.0,
  dotSpacing: 10.0,
  scaleFactor: 1.2,
  angle: 0.5,
  gradientColors: [Colors.red, Colors.orange],
)
```


# DottedLine Widget

A Flutter widget to create a customizable dotted line with gradient colors, shadow effects, and adjustable spacing.

## Features
- Supports horizontal and vertical orientation.
- Customizable dash width, gap size, and line thickness.
- Gradient color support.
- Shadow effects for a better visual appearance.

## Usage

### Default Usage
This widget can be used without parameters for a simple dotted line.

```dart
import 'package:dotted_line_flutter/dotted_line.dart';

DottedLine()
```

### Custom Usage
You can customize the dotted line by specifying various parameters:

```dart
import 'package:dotted_line_flutter/dotted_line.dart';

DottedLine(
  colors: [Colors.blue, Colors.green],
  lineThickness: 2.0,
  dashGap: 6.0,
  dashWidth: 8.0,
  height: 3.0,
  axis: Axis.horizontal,
  shadowColor: Colors.black38,
  shadowBlurRadius: 5.0,
)
```

## Parameters

| Parameter          | Default                 | Description                                      |
|-------------------|------------------------|--------------------------------------------------|
| `colors`          | `[Colors.purple]`       | The gradient colors for the dotted line.         |
| `lineThickness`   | `2.0`                   | The thickness of the line.                       |
| `dashGap`         | `5.0`                   | The space between dashes.                        |
| `dashWidth`       | `5.0`                   | The width of each dash.                          |
| `height`         | `2.0`                   | The height of the dotted line.                   |
| `axis`            | `Axis.horizontal`       | The direction of the dotted line (horizontal/vertical). |
| `shadowColor`     | `Colors.black54`        | The color of the shadow.                         |
| `shadowBlurRadius`| `4.0`                   | The blur radius of the shadow.                   |

## Example
Here's how you can use `DottedLine` inside a `Column` or `Row` widget:

```dart
Column(
  children: [
    Text("Above the line"),
    DottedLine(
      colors: [Colors.red, Colors.orange],
      dashWidth: 6.0,
      dashGap: 4.0,
    ),
    Text("Below the line"),
  ],
)
```

This will create a colorful dotted line between two text widgets.



# DottedStar Widget

## Overview
`DottedStar` is a customizable Flutter widget that renders a star shape with a dotted outline using a gradient color effect. It is built using `CustomPaint` and provides various customization options.

## Features
- Supports gradient colors for the dots.
- Configurable size and number of star points.
- Adjustable dot size and spacing.
- Scalable and rotatable star shape.

## Usage

### Basic Usage
```dart
import 'package:flutter/material.dart';
import 'dotted_star.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: DottedStar(),
        ),
      ),
    );
  }
}
```

### Customization
You can customize the `DottedStar` widget by specifying various parameters.

```dart
DottedStar(
  gradientColors: [Colors.purple, Colors.pink],
  size: 80.0,
  points: 6,
  dotSize: 4.0,
  dotSpacing: 6.0,
  scaleFactor: 1.5,
  angle: 0.5, // Rotation in radians
)
```

## Parameters

| Parameter       | Default Value         | Description                                        |
|--------------- |----------------------|--------------------------------------------------|
| `gradientColors` | `[Colors.yellow, Colors.orange]` | List of colors for the gradient effect. |
| `size`         | `50.0`                | The size of the star.                            |
| `points`       | `5`                    | Number of points in the star.                   |
| `dotSize`      | `3.0`                  | The size of each dot in the outline.           |
| `dotSpacing`   | `5.0`                  | The spacing between each dot.                  |
| `scaleFactor`  | `1.0`                  | Scaling factor for resizing the star.          |
| `angle`        | `0.0`                  | Rotation angle in radians.                     |

## Implementation Details

The `DottedStar` widget uses a `CustomPainter` class (`StarPainter`) to draw the dotted outline of a star. It follows these steps:
1. Creates a star shape using `_createStarPath`.
2. Applies a radial gradient to the dots.
3. Iterates over the path using `PathMetrics` to place dots at equal intervals.
4. Draws each dot on the canvas at calculated positions.


# DottedText Widget

The `DottedText` widget is a custom Flutter widget that renders text using dots instead of solid strokes. It provides customization options for dot size, spacing, colors, and text styling.

## Features
- Render text with a dotted effect
- Customizable dot size and spacing
- Supports gradient colors
- Uses Flutter's `CustomPainter` for efficient rendering

## Installation
To use `DottedText`, simply add the Dart file to your Flutter project and import it.

```dart
import 'package:dotted_line_flutter/dotted_line_flutter.dart';
```

## Usage

### Basic Usage
```dart
DottedText(
  text: "Hello, World!",
)
```

### Customizing Properties
```dart
DottedText(
  text: "Flutter Dots",
  textStyle: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
  dotSize: 3.0,
  dotSpacing: 4.0,
  colors: [Colors.red, Colors.orange],
)
```

## Parameters
| Parameter  | Default Value | Description |
|------------|--------------|-------------|
| `text` | Required | The text to be displayed in dotted style. |
| `textStyle` | `TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black)` | The style of the text. |
| `dotSize` | `2.0` | The size of each individual dot. |
| `dotSpacing` | `3.0` | The spacing between dots. |
| `colors` | `[Colors.purple, Colors.blue]` | A list of colors for gradient effect. |




# DottedWidget

DottedWidget is a Flutter custom widget that allows you to create a widget with a customizable dotted border. It supports different shapes, colors, and shadow effects, making it a versatile component for UI design.

## Features
- Customizable dotted border
- Supports both rectangular and circular shapes
- Adjustable dash width, gap, and thickness
- Gradient border colors
- Shadow effect for better appearance


## Usage
```dart
DottedWidget(
            width: 150.0,
            height: 80.0,
            borderRadius: 12.0,
            colors: [Colors.blue, Colors.green],
            lineThickness: 2.0,
            dashWidth: 6.0,
            dashGap: 4.0,
            shadowBlurRadius: 6.0,
            shape: BoxShape.rectangle,
            child: const Text("Dotted Box", style: TextStyle(fontSize: 16)),
          ),
```

## Properties

| Property          | Type         | Default Value  | Description |
|------------------|-------------|---------------|-------------|
| `child`          | `Widget?`    | `null`        | Child widget inside the dotted container. |
| `borderRadius`   | `double`     | `10.0`        | Border radius for rectangle shapes. |
| `colors`         | `List<Color>` | `[Colors.purple]` | Gradient colors for the border. |
| `lineThickness`  | `double`     | `2.0`         | Thickness of the dotted border. |
| `dashGap`        | `double`     | `5.0`         | Gap between each dot in the border. |
| `dashWidth`      | `double`     | `5.0`         | Width of each individual dot. |
| `axis`           | `Axis`       | `Axis.horizontal` | Axis along which dots are drawn. |
| `shadowColor`    | `Color`      | `Colors.black54` | Color of the shadow effect. |
| `shadowBlurRadius` | `double`   | `4.0`         | Blur radius of the shadow. |
| `width`          | `double`     | `100.0`       | Width of the dotted widget. |
| `height`         | `double`     | `50.0`        | Height of the dotted widget. |
| `shape`          | `BoxShape`   | `BoxShape.rectangle` | Shape of the dotted widget (rectangle or circle). |



# DottedShape Widget

A Flutter widget for rendering various shapes with a dotted outline. This can be used to display creative and visually appealing shapes in your app.

## Features
- Supports multiple shapes:
  - Cone
  - Cylinder
  - Oval
  - Triangle
  - Hexagon
  - Pentagon
  - Hexagram
  - Rhombus
  - Heart
  - Triquetra
  - Semicircle
  - Crescent
- Fully customizable dot size, spacing, and color.



## Usage
```dart
DottedShape(
shapeType: ShapeType.hexagon,
size: 150.0,
dotSize: 5.0,
dotSpacing: 8.0,
dotColor: Colors.blue,
),
```

## Customization
| Property    | Description                                      | Default Value |
|------------|--------------------------------------------------|--------------|
| `shapeType` | The type of shape to render                     | `ShapeType.triangle` |
| `size`      | The width and height of the shape               | `100.0` |
| `dotSize`   | The size of each individual dot                 | `4.0` |
| `dotSpacing` | The spacing between each dot                    | `6.0` |
| `dotColor`  | The color of the dots                           | `Colors.black` |




## Feedback

If you have any feedback, please reach out to me at puneetsharma5525@gmail.com.

---

## 👋 Hi, I'm Puneet!

### 🚀 About Me
I'm a flutter and spring boot java developer .

### 🔗 Links
[![Portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://flutterdartdev.blogspot.com/)  
[![LinkedIn](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/iamapuneet/)  
[![Twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/iamapuneet/)




## License
This package is licensed under the MIT License.

[MIT](https://pub.dev/packages/dotted_line_flutter/license)