import 'package:flutter/material.dart';

class ForecastCard extends StatefulWidget {
  const ForecastCard({super.key});

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyan.withOpacity(0.2)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/on6.png',
                width: 44,
                height: 44,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '7-Day Forecast',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '🌍 28256 - 11:56 AM - °F | C',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildWeatherDayButton('Wed - 10/15', '☀️', '68°', '88°F', 'Bright and warm.', '78° - 88°F', '81° - 88°F', '70° - 85°F'),
                _buildWeatherDayButton('Thu - 10/16', '☁️', '72°', '82°F', 'Partly cloudy.', '75° - 82°F', '79° - 85°F', '68° - 78°F'),
                _buildWeatherDayButton('Fri - 10/17', '☁️', '70°', '78°F', 'Cloudy.', '73° - 78°F', '76° - 82°F', '65° - 75°F'),
                _buildWeatherDayButton('Sat - 10/18', '🌧️', '65°', '71°F', 'Rainy.', '68° - 71°F', '70° - 75°F', '60° - 68°F'),
                _buildWeatherDayButton('Sun - 10/19', '⛈️', '58°', '60°F', 'Thunderstorms.', '60° - 65°F', '62° - 68°F', '54° - 60°F'),
                _buildWeatherDayButton('Mon - 10/20', '☁️', '30°', '34°F', 'Cold and cloudy.', '32° - 34°F', '33° - 36°F', '28° - 32°F'),
                _buildWeatherDayButton('Tue - 10/21', '☀️', '75°', '79°F', 'Sunny and warm.', '76° - 79°F', '78° - 82°F', '73° - 77°F'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDayButton(
    String day,
    String icon,
    String low,
    String high,
    String description,
    String morningTemp,
    String afternoonTemp,
    String eveningTemp,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: GestureDetector(
        onTap: () => _showWeatherPopup(
          day,
          icon,
          low,
          high,
          description,
          morningTemp,
          afternoonTemp,
          eveningTemp,
        ),
        child: Column(
          children: [
            Text(
              day.split(' - ')[0],
              style: const TextStyle(fontSize: 11, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(icon, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 4),
            Text(
              high,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              low,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  void _showWeatherPopup(
    String day,
    String icon,
    String low,
    String high,
    String description,
    String morningTemp,
    String afternoonTemp,
    String eveningTemp,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      day,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Avatar with initial
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.brown.shade300,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          day[0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$low - $high',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          description,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Weather icon
                Center(
                  child: Text(
                    icon,
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
                const SizedBox(height: 20),

                // Day at a glance section
                const Text(
                  'Day at a glance',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),

                // Morning, Afternoon, Evening
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTimeOfDayWeather('Morning', '☀️', morningTemp),
                    _buildTimeOfDayWeather('Afternoon', '☀️', afternoonTemp),
                    _buildTimeOfDayWeather('Evening', '☀️', eveningTemp),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimeOfDayWeather(String time, String icon, String temp) {
    return Column(
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          icon,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 8),
        Text(
          temp,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
