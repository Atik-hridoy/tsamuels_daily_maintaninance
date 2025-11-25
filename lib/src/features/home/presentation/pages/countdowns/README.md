# Countdowns Module Structure

This directory contains all countdown-related widgets and functionality, organized for maximum maintainability and reusability.

## File Structure

```
countdowns/
├── countdowns_header.dart     # Header with celebration icon and title
├── customize_button.dart      # Customize countdowns button with category selection
├── countdown_card.dart        # Individual countdown card display
└── README.md                  # This file
```

## Components

### CountdownsHeader
- Displays the celebration icon and title
- Shows subtitle text
- Stateless widget

### CustomizeButton
- Container with holiday and special events buttons
- Allows users to customize countdown categories
- Stateless widget

### CountdownCard
- Displays individual countdown information
- Shows event name, date, and days remaining
- Customizable background color for each event
- Stateless widget

## Usage

All components are used in `countdowns_view.dart` which orchestrates the countdowns functionality:

```dart
CountdownsHeader(),
CustomizeButton(),
CountdownCard(
  title: 'Event Name',
  date: 'Month Day',
  daysLeft: 26,
  backgroundColor: Color(0xFFFFD4B4),
),
```

## Integration

Import from `countdowns_view.dart` in `home_page.dart`:
```dart
import 'countdowns_view.dart';

// Use in home page
_buildCountdownsTab() => const CountdownsView();
```

## Navigation

The Countdowns tab is accessible from the bottom navigation bar with the celebration icon.
