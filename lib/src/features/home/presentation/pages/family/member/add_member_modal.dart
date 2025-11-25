import 'package:flutter/material.dart';
import '../../../constants/ui_constants.dart';
import 'emoji_picker.dart';
import 'color_picker.dart';
import 'pet_status_section.dart';
import 'birthday_section.dart';
import 'nicknames_section.dart';

class AddMemberModal extends StatefulWidget {
  final Function(String, String, Color) onMemberAdded;

  const AddMemberModal({
    super.key,
    required this.onMemberAdded,
  });

  @override
  State<AddMemberModal> createState() => _AddMemberModalState();
}

class _AddMemberModalState extends State<AddMemberModal> {
  late TextEditingController _nameController;
  String _selectedEmoji = '👨';
  Color _selectedColor = const Color(0xFFD4E8FF);
  bool _isPet = false;
  DateTime? _birthday;
  List<String> _nicknames = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _addMember() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter member name')),
      );
      return;
    }

    widget.onMemberAdded(_nameController.text, _selectedEmoji, _selectedColor);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Drag Handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                const Text(
                  'Add Family Member',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Member Name Input
                const Text(
                  'Member Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter member name',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.cyan, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  ),
                ),
                const SizedBox(height: 20),

                // Emoji Picker
                EmojiPicker(
                  selectedEmoji: _selectedEmoji,
                  onEmojiSelected: (emoji) {
                    setState(() {
                      _selectedEmoji = emoji;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // Color Picker
                ColorPicker(
                  selectedColor: _selectedColor,
                  onColorSelected: (color) {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // Pet Status
                PetStatusSection(
                  isPet: _isPet,
                  onPetStatusChanged: (isPet) {
                    setState(() {
                      _isPet = isPet;
                    });
                  },
                ),
                const SizedBox(height: 20),

                // Birthday
                BirthdaySection(
                  selectedDate: _birthday,
                  onDateSelected: (date) {
                    setState(() {
                      _birthday = date;
                    });
                  },
                ),
                const SizedBox(height: 20),

                // Nicknames
                NicknamesSection(
                  nicknames: _nicknames,
                  onNicknamesChanged: (nicknames) {
                    setState(() {
                      _nicknames = nicknames;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // Add Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: UIConstants.primaryGradient,
                    borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _addMember,
                      borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
                      child: Padding(
                        padding: UIConstants.buttonPaddingVertical,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Add Member',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Cancel Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
                      child: Padding(
                        padding: UIConstants.buttonPaddingVertical,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.close, color: Colors.black),
                            SizedBox(width: 8),
                            Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
