import 'package:flutter/material.dart';
import 'holiday_item.dart';

class HolidaysView extends StatefulWidget {
  const HolidaysView({super.key});

  @override
  State<HolidaysView> createState() => _HolidaysViewState();
}

class _HolidaysViewState extends State<HolidaysView> {
  final List<Map<String, String>> holidays = [
    {'name': 'Christmas', 'date': '12/25/2025'},
    {'name': 'Easter', 'date': '4/5/2026'},
    {'name': 'Hanukkah', 'date': 'Tap to add date'},
    {'name': 'New Year\'s Day', 'date': '1/1/2026'},
    {'name': 'Valentine\'s Day', 'date': '2/14/2026'},
    {'name': 'MLK Day', 'date': '1/19/2026'},
    {'name': 'Presidents Day', 'date': '2/16/2026'},
    {'name': 'Memorial Day', 'date': '5/25/2026'},
    {'name': 'Juneteenth', 'date': '6/19/2026'},
    {'name': 'Independence Day', 'date': '7/4/2026'},
    {'name': 'Labor Day', 'date': '9/7/2026'},
    {'name': 'Columbus Day', 'date': '10/12/2026'},
    {'name': 'Veterans Day', 'date': '11/11/2025'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Holidays',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                'Tap holidays to show on your Countdowns page',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tap a holiday name to add or remove it. Selected holidays turn blue.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Column Headers
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Holiday',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Next date',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Holidays List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: holidays.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return HolidayItem(
                    name: holidays[index]['name']!,
                    date: holidays[index]['date']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
