import 'package:flutter/material.dart';

class SpecialEventItem extends StatefulWidget {
  final String name;
  final String date;

  const SpecialEventItem({
    super.key,
    required this.name,
    required this.date,
  });

  @override
  State<SpecialEventItem> createState() => _SpecialEventItemState();
}

class _SpecialEventItemState extends State<SpecialEventItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.cyan.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(color: Colors.cyan, width: 1) : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.cyan : Colors.cyan,
                ),
              ),
            ),
            Expanded(
              child: Text(
                widget.date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
