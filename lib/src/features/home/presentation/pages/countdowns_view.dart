import 'package:flutter/material.dart';
import 'countdowns/countdowns_header.dart';
import 'countdowns/customize_button.dart';
import 'countdowns/countdown_card.dart';

class CountdownsView extends StatelessWidget {
  const CountdownsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const CountdownsHeader(),
            const SizedBox(height: 20),

            // Customize Button
            const CustomizeButton(),
            const SizedBox(height: 20),

            // Countdowns List
            CountdownCard(
              title: 'Diwali',
              date: 'November 1',
              daysLeft: 1,
              backgroundColor: const Color(0xFFFFD4B4),
            ),
            const SizedBox(height: 12),
            CountdownCard(
              title: 'Veterans Day',
              date: 'November 11',
              daysLeft: 10,
              backgroundColor: const Color(0xFFFFD4C4),
            ),
            const SizedBox(height: 12),
            CountdownCard(
              title: 'Thanksgiving',
              date: 'November 27',
              daysLeft: 26,
              backgroundColor: const Color(0xFFFFF4B4),
            ),
            const SizedBox(height: 12),
            CountdownCard(
              title: 'Hanukkah',
              date: 'December 14',
              daysLeft: 26,
              backgroundColor: const Color(0xFFD4E8FF),
            ),
            const SizedBox(height: 12),
            CountdownCard(
              title: 'Christmas',
              date: 'December 25',
              daysLeft: 26,
              backgroundColor: const Color(0xFFD4FFD4),
            ),
            const SizedBox(height: 12),
            CountdownCard(
              title: 'New Year\'s Day',
              date: 'January 1',
              daysLeft: 26,
              backgroundColor: const Color(0xFFE8D4FF),
            ),
            const SizedBox(height: 12),
            CountdownCard(
              title: 'MLK Day',
              date: 'January 19',
              daysLeft: 26,
              backgroundColor: const Color(0xFFD4F0FF),
            ),
            const SizedBox(height: 12),
            CountdownCard(
              title: 'Valentine\'s Day',
              date: 'February 14',
              daysLeft: 26,
              backgroundColor: const Color(0xFFFFD4E8),
            ),
            const SizedBox(height: 12),
            CountdownCard(
              title: 'Presidents Day',
              date: 'February 17',
              daysLeft: 26,
              backgroundColor: const Color(0xFFE8D4FF),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
