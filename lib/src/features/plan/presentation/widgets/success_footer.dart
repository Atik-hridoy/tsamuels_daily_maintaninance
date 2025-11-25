import 'package:flutter/material.dart';

class SuccessFooter extends StatelessWidget {
  const SuccessFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          shape: BoxShape.circle,
        ),
        margin: const EdgeInsets.only(right: 20, bottom: 20),
      ),
    );
  }
}
