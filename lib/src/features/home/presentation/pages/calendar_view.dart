import 'package:flutter/material.dart';
import '../widgets/add_event_modal.dart';
import 'calendar/calendar_header.dart';
import 'calendar/add_event_button.dart';
import 'calendar/view_toggle.dart';
import 'calendar/calendar_card.dart';
import 'calendar/events_list.dart';

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
            const CalendarHeader(),
            const SizedBox(height: 20),

            // Add Event Button
            AddEventButton(onTap: _showAddEventModal),
            const SizedBox(height: 20),

            // Month/Week Toggle
            ViewToggle(
              isMonthView: _isMonthView,
              onToggle: (isMonth) {
                setState(() {
                  _isMonthView = isMonth;
                });
              },
            ),
            const SizedBox(height: 20),

            // Calendar Card
            CalendarCard(
              displayedMonth: _displayedMonth,
              selectedDate: _selectedDate,
              onDateSelected: _selectDate,
              onPreviousMonth: _previousMonth,
              onNextMonth: _nextMonth,
              events: _events,
            ),
            const SizedBox(height: 20),

            // Events List
            EventsList(
              selectedDate: _selectedDate,
              events: _events,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
