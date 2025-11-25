import 'package:flutter/material.dart';
import '../../../constants/ui_constants.dart';

class NicknamesSection extends StatefulWidget {
  final List<String> nicknames;
  final Function(List<String>) onNicknamesChanged;

  const NicknamesSection({
    super.key,
    required this.nicknames,
    required this.onNicknamesChanged,
  });

  @override
  State<NicknamesSection> createState() => _NicknamesSectionState();
}

class _NicknamesSectionState extends State<NicknamesSection> {
  late TextEditingController _nicknameController;

  @override
  void initState() {
    super.initState();
    _nicknameController = TextEditingController();
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  void _addNickname() {
    if (_nicknameController.text.isNotEmpty) {
      setState(() {
        widget.nicknames.add(_nicknameController.text);
        widget.onNicknamesChanged(widget.nicknames);
        _nicknameController.clear();
      });
    }
  }

  void _removeNickname(int index) {
    setState(() {
      widget.nicknames.removeAt(index);
      widget.onNicknamesChanged(widget.nicknames);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Common names (AKAs)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _nicknameController,
                decoration: InputDecoration(
                  hintText: 'Enter a nickname',
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
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                gradient: UIConstants.primaryGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _addNickname,
                  borderRadius: BorderRadius.circular(8),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (widget.nicknames.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              widget.nicknames.length,
              (index) => Container(
                decoration: BoxDecoration(
                  color: Colors.cyan.withOpacity(0.1),
                  border: Border.all(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.nicknames[index],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.cyan,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () => _removeNickname(index),
                      child: const Icon(Icons.close, size: 16, color: Colors.cyan),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
