import 'package:flutter/material.dart';

class EmojiPicker extends StatefulWidget {
  final String selectedEmoji;
  final Function(String) onEmojiSelected;

  const EmojiPicker({
    super.key,
    required this.selectedEmoji,
    required this.onEmojiSelected,
  });

  @override
  State<EmojiPicker> createState() => _EmojiPickerState();
}

class _EmojiPickerState extends State<EmojiPicker> {
  final List<String> emojis = [
    '👨', '👩', '👦', '👧',
    '👨‍🦰', '👩‍🦰', '👨‍🦱', '👩‍🦱',
    '👨‍🦳', '👩‍🦳', '👨‍🦲', '👩‍🦲',
    '👨‍🦯', '👩‍🦯', '👨‍⚕️', '👩‍⚕️',
    '👨‍🌾', '👩‍🌾', '🐱', '🐶',
    '🐻', '🐸', '🦊', '🐴',
    '🐮', '🐷', '🐸', '🦋',
    '🐳', '🐘', '🦁', '🐼',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose Avatar',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.cyan.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: emojis.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final emoji = emojis[index];
              final isSelected = emoji == widget.selectedEmoji;
              return GestureDetector(
                onTap: () => widget.onEmojiSelected(emoji),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.cyan : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected ? Border.all(color: Colors.cyan, width: 2) : null,
                  ),
                  child: Center(
                    child: Text(
                      emoji,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
