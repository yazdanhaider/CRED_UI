import 'package:cred_assignment/widget/slider/circular_slider.dart';
import 'package:flutter/material.dart';

class Card_Sheet extends StatefulWidget {
  final List<dynamic> data1;

  const Card_Sheet({super.key, required this.data1});

  @override
  _Card_SheetState createState() => _Card_SheetState();
}

class _Card_SheetState extends State<Card_Sheet> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85, // 85% of screen width
        height: MediaQuery.of(context).size.height * 0.6, // 60% of screen height
        child: Center(
          child: Card(
            elevation: 6.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  Flexible(
                    child: RadialSliderScreen(
                      cardData: widget.data1[0]['open_state']['body']['card'],
                    ),
                  ),

                  const SizedBox(height: 20.0),
                  Text(
                    widget.data1[0]['open_state']['body']['footer'],
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}