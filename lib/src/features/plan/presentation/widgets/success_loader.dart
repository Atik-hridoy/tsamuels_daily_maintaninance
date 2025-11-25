import 'package:flutter/material.dart';

class SuccessLoader extends StatelessWidget {
  final int dotCount;
  final Color dotColor;

  const SuccessLoader({
    super.key,
    this.dotCount = 7,
    this.dotColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        
        // Loading dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            dotCount,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
