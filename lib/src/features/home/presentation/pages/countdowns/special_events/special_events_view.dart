import 'package:flutter/material.dart';
import '../../../constants/ui_constants.dart';
import 'special_event_item.dart';
import 'add_special_event_modal.dart';

class SpecialEventsView extends StatefulWidget {
  const SpecialEventsView({super.key});

  @override
  State<SpecialEventsView> createState() => _SpecialEventsViewState();
}

class _SpecialEventsViewState extends State<SpecialEventsView> {
  List<Map<String, String>> specialEvents = [
    {'name': 'Birthday', 'date': '12/25/2025'},
    {'name': 'Anniversary', 'date': '4/5/2026'},
    {'name': 'Wedding', 'date': 'Tap to add date'},
    {'name': 'Graduation', 'date': '1/1/2026'},
    {'name': 'Baby Shower', 'date': '2/14/2026'},
  ];

  void _addSpecialEvent(String name, String date) {
    setState(() {
      specialEvents.add({'name': name, 'date': date});
    });
  }

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
          'Special Event',
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
                'Special Events List',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tap to edit or update your events.',
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
                      'Special Event',
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

              // Special Events List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: specialEvents.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return SpecialEventItem(
                    name: specialEvents[index]['name']!,
                    date: specialEvents[index]['date']!,
                  );
                },
              ),
              const SizedBox(height: 20),

              // Add Special Event Button
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
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (BuildContext context) {
                          return AddSpecialEventModal(
                            onEventAdded: _addSpecialEvent,
                          );
                        },
                      );
                    },
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
