import 'package:flutter/material.dart';

class UIConstants {
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF00D3F2), Color(0xFF2B7FFF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Border Radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;

  // Colors
  static const Color primaryCyan = Color(0xFF00D3F2);
  static const Color primaryBlue = Color(0xFF2B7FFF);
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.grey;
  static const Color borderColor = Colors.grey;

  // Padding
  static const EdgeInsets paddingSmall = EdgeInsets.all(8.0);
  static const EdgeInsets paddingMedium = EdgeInsets.all(16.0);
  static const EdgeInsets paddingLarge = EdgeInsets.all(24.0);

  // Button Padding
  static const EdgeInsets buttonPaddingVertical = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets buttonPaddingHorizontal = EdgeInsets.symmetric(horizontal: 16);
}
