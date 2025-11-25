import 'package:flutter/material.dart';

class CalendarGrid extends StatelessWidget {
  final DateTime displayedMonth;
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;
  final Map<DateTime, List<Map<String, String>>> events;

  const CalendarGrid({
    super.key,
    required this.displayedMonth,
    required this.selectedDate,
    required this.onDateSelected,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(displayedMonth.year, displayedMonth.month, 1);
    final lastDay = DateTime(displayedMonth.year, displayedMonth.month + 1, 0);
    final daysInMonth = lastDay.day;
    final firstWeekday = firstDay.weekday;

    List<Widget> days = [];

    // Empty cells for days before month starts
    for (int i = 0; i < firstWeekday; i++) {
      days.add(const SizedBox.shrink());
    }

    // Days of the month
    for (int day = 1; day <= daysInMonth; day++) {
      final date = DateTime(displayedMonth.year, displayedMonth.month, day);
      final isSelected = selectedDate.year == date.year &&
          selectedDate.month == date.month &&
          selectedDate.day == date.day;
      final isToday = DateTime.now().year == date.year &&
          DateTime.now().month == date.month &&
          DateTime.now().day == date.day;

      days.add(
        GestureDetector(
          onTap: () => onDateSelected(date),
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

  List<Map<String, String>> _getEventsForDate(DateTime date) {
    final key = DateTime(date.year, date.month, date.day);
    return events[key] ?? [];
  }
}
