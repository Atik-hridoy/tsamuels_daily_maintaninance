import 'package:flutter/material.dart';

class BirthdaySection extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime?) onDateSelected;

  const BirthdaySection({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  State<BirthdaySection> createState() => _BirthdaySectionState();
}

class _BirthdaySectionState extends State<BirthdaySection> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Birthday',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.cyan, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.selectedDate != null
                        ? '${widget.selectedDate!.month}/${widget.selectedDate!.day}/${widget.selectedDate!.year}'
                        : 'Select a date',
                    style: TextStyle(
                      fontSize: 14,
                      color: widget.selectedDate != null ? Colors.black : Colors.grey.shade400,
                    ),
                  ),
                ),
                Icon(Icons.edit, color: Colors.grey.shade400, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
