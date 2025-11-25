import 'package:flutter/material.dart';
import '../../../constants/ui_constants.dart';
import 'emoji_picker.dart';
import 'color_picker.dart';
import 'pet_status_section.dart';
import 'birthday_section.dart';
import 'nicknames_section.dart';

class EditMemberModal extends StatefulWidget {
  final String memberName;
  final String initialEmoji;
  final Color initialColor;

  const EditMemberModal({
    super.key,
    required this.memberName,
    required this.initialEmoji,
    required this.initialColor,
  });

  @override
  State<EditMemberModal> createState() => _EditMemberModalState();
}

class _EditMemberModalState extends State<EditMemberModal> {
  late String _selectedEmoji;
  late Color _selectedColor;
  bool _isPet = false;
  DateTime? _birthday;
  List<String> _nicknames = [];

  @override
  void initState() {
    super.initState();
    _selectedEmoji = widget.initialEmoji;
    _selectedColor = widget.initialColor;
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
                Text(
                  'Edit ${widget.memberName}\'s Profile',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
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

                // Save Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: UIConstants.primaryGradient,
                    borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile updated successfully')),
                        );
                      },
                      borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
                      child: Padding(
                        padding: UIConstants.buttonPaddingVertical,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Save',
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
                const SizedBox(height: 12),

                // Remove Member Button
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Member removed')),
                      );
                    },
                    child: const Text(
                      'Remove member',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
