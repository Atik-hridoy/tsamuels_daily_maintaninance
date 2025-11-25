import 'package:flutter/material.dart';
import '../../constants/ui_constants.dart';

class LocationTimePage extends StatefulWidget {
  const LocationTimePage({super.key});

  @override
  State<LocationTimePage> createState() => _LocationTimePageState();
}

class _LocationTimePageState extends State<LocationTimePage> {
  bool _useLocation = false;
  String _selectedTimezone = 'Eastern Time';

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
          'Location and Time',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
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
              // Location Toggle
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: const Text(
                        'Use my location for Leave By feature',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Switch(
                      value: _useLocation,
                      onChanged: (value) {
                        setState(() {
                          _useLocation = value;
                        });
                      },
                      activeColor: Colors.cyan,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Info Text
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Your location is only used when calculating Leave By and Directions. We do not track or share your location.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Timezone
              const Text(
                'Timezone',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Digest and reminders will be based on this timezone.',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: _selectedTimezone,
                items: ['Eastern Time', 'Central Time', 'Mountain Time', 'Pacific Time']
                    .map((tz) {
                  return DropdownMenuItem(value: tz, child: Text(tz));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedTimezone = value ?? 'Eastern Time';
                  });
                },
                decoration: InputDecoration(
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
              const SizedBox(height: 16),

              // Info Text
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Stay one step ahead. Every evening at 7 PM in your chosen timezone, myAnchor sends your personalized daily digest so you can plan, prep, and rest easy.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Save Button
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Settings saved successfully')),
                      );
                    },
                    borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
                    child: Padding(
                      padding: UIConstants.buttonPaddingVertical,
                      child: const Center(
                        child: Text(
                          'Save Notification Settings',
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
