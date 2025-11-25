import 'package:flutter/material.dart';
import '../constants/ui_constants.dart';

class AddEventModal extends StatefulWidget {
  final Function(Map<String, dynamic>) onEventAdded;

  const AddEventModal({
    super.key,
    required this.onEventAdded,
  });

  @override
  State<AddEventModal> createState() => _AddEventModalState();
}

class _AddEventModalState extends State<AddEventModal> {
  late TextEditingController _titleController;
  late TextEditingController _locationController;
  late TextEditingController _notesController;
  DateTime? _startDate;
  DateTime? _endDate;
  TimeOfDay? _startTime;
  TimeOfDay? _arriveByTime;
  bool _isAllDayEvent = false;
  bool _isRecurringEvent = false;
  bool _reminderEnabled = true;
  String _reminderTime = '30 min';
  String _recurringOption = '1 week';
  String? _selectedFamilyMember;
  String? _selectedResponsible;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _locationController = TextEditingController();
    _notesController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _locationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate ? (_startDate ?? DateTime.now()) : (_endDate ?? DateTime.now()),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? (_startTime ?? TimeOfDay.now()) : (_arriveByTime ?? TimeOfDay.now()),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          _startTime = picked;
        } else {
          _arriveByTime = picked;
        }
      });
    }
  }

  void _saveEvent() {
    if (_titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter event title')),
      );
      return;
    }

    final event = {
      'title': _titleController.text,
      'location': _locationController.text,
      'notes': _notesController.text,
      'startDate': _startDate,
      'endDate': _endDate,
      'startTime': _startTime,
      'arriveByTime': _arriveByTime,
      'isAllDayEvent': _isAllDayEvent,
      'isRecurringEvent': _isRecurringEvent,
      'recurringOption': _recurringOption,
      'reminderEnabled': _reminderEnabled,
      'reminderTime': _reminderTime,
      'familyMember': _selectedFamilyMember,
      'responsible': _selectedResponsible,
    };

    widget.onEventAdded(event);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with drag handle
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
          const SizedBox(height: 16),
          const Text(
            'Add Event',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),

              // Title
              const Text(
                'Title',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: '"Doctor practice" or "Dentist appointment"',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              const SizedBox(height: 16),

              // Start Date
              const Text(
                'Start Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _selectDate(context, true),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _startDate != null ? _formatDate(_startDate!) : 'Select a date',
                        style: TextStyle(
                          color: _startDate != null ? Colors.black : Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const Icon(Icons.calendar_today, color: Colors.grey, size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // End Date
              const Text(
                'End Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _selectDate(context, false),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _endDate != null ? _formatDate(_endDate!) : 'End date (optional)',
                        style: TextStyle(
                          color: _endDate != null ? Colors.black : Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const Icon(Icons.calendar_today, color: Colors.grey, size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // All Day Event Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Day Event',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Switch(
                    value: _isAllDayEvent,
                    onChanged: (value) {
                      setState(() {
                        _isAllDayEvent = value;
                      });
                    },
                    activeColor: Colors.cyan,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Start Time (if not all day)
              if (!_isAllDayEvent) ...[
                const Text(
                  'Start Time',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () => _selectTime(context, true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _startTime != null ? _startTime!.format(context) : 'Select start time',
                          style: TextStyle(
                            color: _startTime != null ? Colors.black : Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const Icon(Icons.access_time, color: Colors.grey, size: 18),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Arrive By Time
              const Text(
                'Arrive By',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _selectTime(context, false),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _arriveByTime != null ? _arriveByTime!.format(context) : 'Select arrival time',
                        style: TextStyle(
                          color: _arriveByTime != null ? Colors.black : Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const Icon(Icons.access_time, color: Colors.grey, size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Location
              const Text(
                'Location',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: 'e.g., Main St',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              const SizedBox(height: 16),

              // Family Member
              const Text(
                'Family Member',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedFamilyMember,
                decoration: InputDecoration(
                  hintText: 'Select a family member',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
                items: const [
                  DropdownMenuItem(value: 'Meghan', child: Text('Meghan')),
                  DropdownMenuItem(value: 'Morgan', child: Text('Morgan')),
                  DropdownMenuItem(value: 'Family', child: Text('Family')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedFamilyMember = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Responsible
              const Text(
                'Responsible',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedResponsible,
                decoration: InputDecoration(
                  hintText: '(optional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
                items: const [
                  DropdownMenuItem(value: 'Meghan', child: Text('Meghan')),
                  DropdownMenuItem(value: 'Morgan', child: Text('Morgan')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedResponsible = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Notes
              const Text(
                'Notes',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _notesController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Add a description',
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ),
              const SizedBox(height: 16),

              // Reminder
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.notifications, color: Colors.grey, size: 18),
                      const SizedBox(width: 8),
                      const Text(
                        'Reminder',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _reminderTime,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: _reminderEnabled,
                    onChanged: (value) {
                      setState(() {
                        _reminderEnabled = value;
                      });
                    },
                    activeColor: Colors.cyan,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Recurring Event
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Recurring Event',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          _recurringOption,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  Switch(
                    value: _isRecurringEvent,
                    onChanged: (value) {
                      setState(() {
                        _isRecurringEvent = value;
                      });
                    },
                    activeColor: Colors.cyan,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Show in Countdowns
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Show in Countdowns',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Switch(
                    value: false,
                    onChanged: (value) {},
                    activeColor: Colors.cyan,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Disable Auto Leave-By
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Disable Auto Leave-By',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Switch(
                    value: false,
                    onChanged: (value) {},
                    activeColor: Colors.cyan,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  
                  const SizedBox(width: 8),
                  
                  const Spacer(),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: UIConstants.primaryGradient,
                        borderRadius: BorderRadius.circular(UIConstants.borderRadiusSmall),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _saveEvent,
                          borderRadius: BorderRadius.circular(UIConstants.borderRadiusSmall),
                          child: Padding(
                            padding: UIConstants.buttonPaddingVertical,
                            child: Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
