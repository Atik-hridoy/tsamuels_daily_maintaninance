import 'package:flutter/material.dart';
import 'add_event_modal.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late DateTime _selectedDate;
  late DateTime _displayedMonth;
  bool _isMonthView = true;
  late Map<DateTime, List<Map<String, String>>> _events;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _displayedMonth = DateTime(_selectedDate.year, _selectedDate.month);
    _events = {
      DateTime(2025, 10, 1): [
        {'title': 'Road Trip', 'time': '3:00 PM'},
      ],
      DateTime(2025, 10, 15): [
        {'title': 'TEST', 'time': 'All day'},
      ],
      DateTime(2025, 10, 30): [
        {'title': 'TEST', 'time': '2:00 PM'},
      ],
    };
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

  void _selectDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void _showAddEventModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          maxChildSize: 0.95,
          minChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: AddEventModal(
                onEventAdded: (event) {
                  setState(() {
                    final eventDate = event['startDate'] ?? _selectedDate;
                    final eventKey = DateTime(eventDate.year, eventDate.month, eventDate.day);
                    if (_events[eventKey] == null) {
                      _events[eventKey] = [];
                    }
                    _events[eventKey]!.add({
                      'title': event['title'],
                      'time': event['startTime']?.format(context) ?? 'All day',
                    });
                  });
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.calendar_today, color: Colors.white, size: 28),
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Family Calendar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Just say the word and we\'ll take it from there!',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Add Event Button
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF00BCD4), Color(0xFF0097A7)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _showAddEventModal,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Add Event',
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
            const SizedBox(height: 20),

            // Month/Week Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isMonthView = true;
                    });
                  },
                  child: Text(
                    'Month',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: _isMonthView ? FontWeight.w600 : FontWeight.normal,
                      color: _isMonthView ? Colors.cyan : Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isMonthView = false;
                    });
                  },
                  child: Text(
                    'Week',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: !_isMonthView ? FontWeight.w600 : FontWeight.normal,
                      color: !_isMonthView ? Colors.cyan : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // View Toggle Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isMonthView = true;
                    });
                  },
                  child: Icon(
                    Icons.view_agenda,
                    color: _isMonthView ? Colors.cyan : Colors.grey.shade300,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isMonthView = false;
                    });
                  },
                  child: Icon(
                    Icons.grid_3x3,
                    color: !_isMonthView ? Colors.cyan : Colors.grey.shade300,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Calendar Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.cyan.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Month Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatMonth(_displayedMonth),
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
            const SizedBox(height: 20),

            // Today's Events
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.grey, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Today\'s Events (${_getEventsForDate(_selectedDate).length})',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildEventsList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
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
      final isSelected = _selectedDate.year == date.year &&
          _selectedDate.month == date.month &&
          _selectedDate.day == date.day;
      final isToday = DateTime.now().year == date.year &&
          DateTime.now().month == date.month &&
          DateTime.now().day == date.day;

      days.add(
        GestureDetector(
          onTap: () => _selectDate(date),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? Colors.cyan.withOpacity(0.1) : Colors.transparent,
              border: isSelected ? Border.all(color: Colors.cyan, width: 2) : null,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    day.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  if (isToday)
                    Positioned(
                      bottom: 2,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  if (_getEventsForDate(date).isNotEmpty && !isToday)
                    Positioned(
                      bottom: 2,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
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

  Widget _buildEventsList() {
    final events = _getEventsForDate(_selectedDate);
    if (events.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'No events scheduled',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
      );
    }

    return Column(
      children: events
          .map((event) => Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.cyan.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.cyan.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event['title'] ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            event['time'] ?? '',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }

  List<Map<String, String>> _getEventsForDate(DateTime date) {
    final key = DateTime(date.year, date.month, date.day);
    return _events[key] ?? [];
  }

  String _formatMonth(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
