import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditInfoWidget extends StatelessWidget {
  final String? key1;
  final String? value1;
  final String? key2;
  final String? value2;

  // Constructor to accept arguments
  CreditInfoWidget({
    required this.key1,
    required this.value1,
    required this.key2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$key1\n$value1',
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white54,
                fontWeight: FontWeight.bold,
              ),
            ),
            key2 == null
                ? SizedBox()
                : Text(
              '${key2}\n${value2}',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white54,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
