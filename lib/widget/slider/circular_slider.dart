import 'package:flutter/material.dart';
import 'dart:math';
class RadialSliderScreen extends StatefulWidget {
  final dynamic cardData;

  const RadialSliderScreen({super.key, required this.cardData});

  @override
  RadialSliderScreenState createState() => RadialSliderScreenState();
}

class RadialSliderScreenState extends State<RadialSliderScreen> {
  double _creditAmount = 150000; // Start from 150000

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RadialSlider(
          cardData: widget.cardData,
          creditAmount: _creditAmount,
          onValueChanged: (value) {
            setState(() {
              _creditAmount = value;
            });
          },
        ),
      ),
    );
  }
}

class RadialSlider extends StatefulWidget {
  final double creditAmount;
  final ValueChanged<double> onValueChanged;
  final dynamic cardData;

  RadialSlider({required this.creditAmount, required this.onValueChanged, required this.cardData});

  @override
  RadialSliderState createState() => RadialSliderState();
}

class RadialSliderState extends State<RadialSlider> {
  double _currentAngle = 0;
  final double _minAmount = 500;
  final double _maxAmount = 487891;

  @override
  void initState() {
    super.initState();
    _currentAngle = _amountToAngle(widget.creditAmount); // Calculate angle based on initial amount
  }

  double _angleToAmount(double angle) {
    return (angle / (2 * pi)) * (_maxAmount - _minAmount) + _minAmount; // Adjusted to account for min amount
  }

  double _amountToAngle(double amount) {
    return ((amount - _minAmount) / (_maxAmount - _minAmount)) * (2 * pi); // Adjusted for starting at min amount
  }

  void _updatePosition(Offset position, Size size) {
    final double dx = position.dx - size.width / 2;
    final double dy = position.dy - size.height / 2;
    final double angle = atan2(dy, dx) + pi / 2;

    setState(() {
      _currentAngle = angle;
      double newAmount = _angleToAmount(angle);
      if (newAmount < _minAmount) newAmount = _minAmount;
      if (newAmount > _maxAmount) newAmount = _maxAmount;
      widget.onValueChanged(newAmount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        _updatePosition(details.localPosition, Size(200, 200));
      },
      child: CustomPaint(
        size: Size(300, 300),
        painter: RadialSliderPainter(_currentAngle, widget.creditAmount),
      ),
    );
  }
}

class RadialSliderPainter extends CustomPainter {
  final double angle;
  final double creditAmount;

  RadialSliderPainter(this.angle, this.creditAmount);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Draw the radial background
    canvas.drawCircle(center, radius, paint..color = Colors.grey[300]!);

    // Draw the active radial bar
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, paint..color = Colors.blue);

    // Draw the slider handle
    final handleX = center.dx + radius * cos(angle - pi / 2);
    final handleY = center.dy + radius * sin(angle - pi / 2);
    canvas.drawCircle(Offset(handleX, handleY), 10.0, Paint()..color = Colors.red);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
