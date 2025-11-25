import 'package:flutter/material.dart';

class PetStatusSection extends StatefulWidget {
  final bool isPet;
  final Function(bool) onPetStatusChanged;

  const PetStatusSection({
    super.key,
    required this.isPet,
    required this.onPetStatusChanged,
  });

  @override
  State<PetStatusSection> createState() => _PetStatusSectionState();
}

class _PetStatusSectionState extends State<PetStatusSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pet Status',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: widget.isPet,
              onChanged: (value) {
                widget.onPetStatusChanged(value ?? false);
              },
              activeColor: Colors.cyan,
            ),
            const Text(
              'This member is a pet',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
