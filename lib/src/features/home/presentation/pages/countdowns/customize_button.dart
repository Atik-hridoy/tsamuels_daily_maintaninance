import 'package:flutter/material.dart';
import '../../constants/ui_constants.dart';
import 'holidays/holidays_view.dart';
import 'special_events/special_events_view.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.cyan.withOpacity(0.05),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Customize your countdowns',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'From holidays to birthdays, anniversaries, and everything worth celebrating.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: UIConstants.primaryGradient,
                    borderRadius: BorderRadius.circular(UIConstants.borderRadiusSmall),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HolidaysView()),
                        );
                      },
                      borderRadius: BorderRadius.circular(UIConstants.borderRadiusSmall),
                      child: Padding(
                        padding: UIConstants.buttonPaddingVertical,
                        child: const Center(
                          child: Text(
                            'Holidays',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SpecialEventsView()),
                        );
                      },
                      borderRadius: BorderRadius.circular(UIConstants.borderRadiusSmall),
                      child: Padding(
                        padding: UIConstants.buttonPaddingVertical,
                        child: const Center(
                          child: Text(
                            'Special Events',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
}
