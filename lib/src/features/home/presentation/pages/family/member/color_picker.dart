import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  final Color selectedColor;
  final Function(Color) onColorSelected;

  const ColorPicker({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<Color> colors = [
    const Color(0xFFFF6B6B), // Red
    const Color(0xFF00BCD4), // Cyan
    const Color(0xFFB366FF), // Purple
    const Color(0xFF66BB6A), // Green
    const Color(0xFFFFB74D), // Orange
    const Color(0xFFFF99CC), // Pink
    const Color(0xFF66BB6A), // Light Green
    const Color(0xFFD699FF), // Light Purple
    const Color(0xFFFFB366), // Light Orange
    const Color(0xFFFFFF99), // Yellow
    const Color(0xFF99CCFF), // Light Blue
    const Color(0xFF99FF99), // Lime
    const Color(0xFFFFFF66), // Bright Yellow
    const Color(0xFFCC99FF), // Lavender
    const Color(0xFF6699FF), // Blue
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Color',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: colors.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final color = colors[index];
            final isSelected = color == widget.selectedColor;
            return GestureDetector(
              onTap: () => widget.onColorSelected(color),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  border: isSelected ? Border.all(color: Colors.black, width: 3) : null,
                ),
                child: isSelected
                    ? const Center(
                        child: Icon(Icons.check, color: Colors.white, size: 24),
                      )
                    : null,
              ),
            );
          },
        ),
      ],
    );
  }
}
