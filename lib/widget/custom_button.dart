import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            minimumSize: const Size(double.infinity, 50),
            // Full-width button
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), // Only top-left rounded
                topRight: Radius.circular(20), // Only top-right rounded
                bottomLeft: Radius.circular(0), // Keep bottom-left square
                bottomRight: Radius.circular(0), // Keep bottom-right square
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
