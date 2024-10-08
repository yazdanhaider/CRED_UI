import 'package:flutter/material.dart';

class CentralizedAnimation {
  final AnimationController controller;
  final Animation<double> animation;

  CentralizedAnimation({required TickerProvider vsync})
      : controller = AnimationController(
    vsync: vsync,
    duration: Duration(seconds: 2),
  ),
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: AnimationController(vsync: vsync, duration: Duration(seconds: 2)),
            curve: Curves.easeInOut,
          ),
        );

  // Start the animation
  void start() {
    controller.repeat(reverse: true);
  }

  // Dispose the controller when it's no longer needed
  void dispose() {
    controller.dispose();
  }
}
