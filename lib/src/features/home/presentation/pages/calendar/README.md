# Calendar Module Structure

This directory contains all calendar-related widgets and functionality, organized for maximum maintainability and reusability.

## File Structure

```
calendar/
├── calendar_header.dart       # Header with calendar icon and title
├── add_event_button.dart      # Add event button with gradient
├── view_toggle.dart           # Month/Week view toggle
├── calendar_card.dart         # Main calendar card with month navigation
├── calendar_grid.dart         # Calendar grid with day selection
├── events_list.dart           # Events list display
└── README.md                  # This file
```

## Components

### CalendarHeader
- Displays the calendar icon and title
- Shows subtitle text
- Stateless widget

### AddEventButton
- Cyan gradient button to add events
- Calls `_showAddEventModal()` callback
- Stateless widget

### ViewToggle
- Toggle between Month and Week views
- Text and icon toggles
- Passes selected view to parent

### CalendarCard
- Main calendar container
- Month navigation (previous/next)
- Weekday headers
- Integrates CalendarGrid

### CalendarGrid
- 7-column grid layout
- Day selection with highlighting
- Event indicators (cyan for today, green for events)
- Stateless widget

### EventsList
- Displays events for selected date
- Shows event title and time
- Empty state message when no events

## Usage

All components are used in `calendar_view.dart` which orchestrates the calendar functionality:

```dart
CalendarHeader(),
AddEventButton(onTap: _showAddEventModal),
ViewToggle(isMonthView: _isMonthView, onToggle: (isMonth) { ... }),
CalendarCard(...),
EventsList(...)
```

## State Management

The parent `CalendarView` (StatefulWidget) manages:
- `_selectedDate` - Currently selected date
- `_displayedMonth` - Month being displayed
- `_isMonthView` - View mode toggle
- `_events` - Events map

## Integration

Import from `calendar_view.dart` in `home_page.dart`:
```dart
import 'calendar_view.dart';

// Use in home page
_buildCalendarTab() => const CalendarView();
```
