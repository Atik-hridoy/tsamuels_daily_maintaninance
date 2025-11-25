import 'package:flutter/material.dart';
import 'calendar_grid.dart';

class CalendarCard extends StatelessWidget {
  final DateTime displayedMonth;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final Map<DateTime, List<Map<String, String>>> events;

  const CalendarCard({
    super.key,
    required this.displayedMonth,
    required this.selectedDate,
    required this.onDateSelected,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                _formatMonth(displayedMonth),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.cyan,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: onPreviousMonth,
                    child: const Icon(Icons.chevron_left, color: Colors.cyan),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onNextMonth,
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
          CalendarGrid(
            displayedMonth: displayedMonth,
            selectedDate: selectedDate,
            onDateSelected: onDateSelected,
            events: events,
          ),
        ],
      ),
    );
  }

  String _formatMonth(DateTime date) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
