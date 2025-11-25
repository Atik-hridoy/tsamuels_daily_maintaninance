import 'package:flutter/material.dart';

class ViewToggle extends StatelessWidget {
  final bool isMonthView;
  final Function(bool) onToggle;

  const ViewToggle({
    super.key,
    required this.isMonthView,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text Toggle
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onToggle(true),
              child: Text(
                'Month',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isMonthView ? FontWeight.w600 : FontWeight.normal,
                  color: isMonthView ? Colors.cyan : Colors.grey,
                ),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => onToggle(false),
              child: Text(
                'Week',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: !isMonthView ? FontWeight.w600 : FontWeight.normal,
                  color: !isMonthView ? Colors.cyan : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Icon Toggle
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => onToggle(true),
              child: Icon(
                Icons.view_agenda,
                color: isMonthView ? Colors.cyan : Colors.grey.shade300,
                size: 24,
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () => onToggle(false),
              child: Icon(
                Icons.grid_3x3,
                color: !isMonthView ? Colors.cyan : Colors.grey.shade300,
                size: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
