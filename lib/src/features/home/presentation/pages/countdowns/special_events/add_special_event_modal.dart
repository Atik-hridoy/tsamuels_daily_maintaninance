import 'package:flutter/material.dart';
import '../../../constants/ui_constants.dart';

class AddSpecialEventModal extends StatefulWidget {
  final Function(String, String) onEventAdded;

  const AddSpecialEventModal({
    super.key,
    required this.onEventAdded,
  });

  @override
  State<AddSpecialEventModal> createState() => _AddSpecialEventModalState();
}

class _AddSpecialEventModalState extends State<AddSpecialEventModal> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _selectedDate;
  bool _showCalendar = false;
  late DateTime _displayedMonth;

  @override
  void initState() {
    super.initState();
    _displayedMonth = DateTime.now();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
      _showCalendar = false;
    });
  }

  void _previousMonth() {
    setState(() {
      _displayedMonth = DateTime(_displayedMonth.year, _displayedMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = DateTime(_displayedMonth.year, _displayedMonth.month + 1);
    });
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  Widget _buildCalendarGrid() {
    final firstDay = DateTime(_displayedMonth.year, _displayedMonth.month, 1);
    final lastDay = DateTime(_displayedMonth.year, _displayedMonth.month + 1, 0);
    final daysInMonth = lastDay.day;
    final firstWeekday = firstDay.weekday;

    List<Widget> days = [];

    // Empty cells for days before month starts
    for (int i = 0; i < firstWeekday; i++) {
      days.add(const SizedBox.shrink());
    }

    // Days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(_displayedMonth.year, _displayedMonth.month, day);
      final isSelected = _selectedDate?.year == date.year &&
          _selectedDate?.month == date.month &&
          _selectedDate?.day == date.day;

      days.add(
        GestureDetector(
          onTap: () => _selectDate(date),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.cyan : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.2,
      children: days,
    );
  }

  void _addEvent() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter event name')),
      );
      return;
    }

    final dateStr = _selectedDate != null
        ? '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}'
        : 'Tap to add date';

    widget.onEventAdded(_nameController.text, dateStr);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.6,
      maxChildSize: 0.9,
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
                  'Add Special Event',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Event Name Input
                const Text(
                  'Special Event Name',
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
                    hintText: 'Enter special event name',
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

                // Date Input
                const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showCalendar = !_showCalendar;
                    });
                  },
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
                        Text(
                          _selectedDate != null
                              ? '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}'
                              : 'Select a date',
                          style: TextStyle(
                            fontSize: 14,
                            color: _selectedDate != null ? Colors.black : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (_showCalendar) ...[
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Month Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${_getMonthName(_displayedMonth.month)} ${_displayedMonth.year}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.cyan,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _previousMonth,
                                  child: const Icon(Icons.chevron_left, color: Colors.cyan),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: _nextMonth,
                                  child: const Icon(Icons.chevron_right, color: Colors.cyan),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Weekday Headers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text('Su', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                            Text('Mo', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                            Text('Tu', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                            Text('We', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                            Text('Th', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                            Text('Fr', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                            Text('Sa', style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // Calendar Grid
                        _buildCalendarGrid(),
                      ],
                    ),
                  ),
                ],
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
                      onTap: _addEvent,
                      borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
                      child: Padding(
                        padding: UIConstants.buttonPaddingVertical,
                        child: const Center(
                          child: Text(
                            'Add Special Event',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Info Text
                const Center(
                  child: Text(
                    'Add special event to your countdown list. Enter a name and select a date to get started.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
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
