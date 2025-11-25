# Family Module Structure

This directory contains all family-related widgets and functionality, organized for maximum maintainability and reusability.

## File Structure

```
family/
├── family_header.dart          # Header with people icon and title
├── add_members_button.dart     # Add members button with gradient
├── family_member_card.dart     # Individual family member card
└── README.md                   # This file
```

## Components

### FamilyHeader
- Displays the people icon and title
- Shows subtitle text
- Stateless widget

### AddMembersButton
- Gradient button to add family members
- Calls `onTap` callback
- Stateless widget

### FamilyMemberCard
- Displays family member information
- Shows member name, relation/alias
- Displays emoji avatar
- Shows associated event information
- Customizable background color
- Settings icon for member options
- Stateless widget

## Usage

All components are used in `family_view.dart` which orchestrates the family functionality:

```dart
FamilyHeader(),
AddMembersButton(onTap: () { ... }),
FamilyMemberCard(
  name: 'John Cena',
  relation: 'AKA : Jimmy , Dad',
  emoji: '👨',
  eventInfo: 'Road Trip - Wed, Oct 15, 3:00 PM at Auburn, Al',
  backgroundColor: Color(0xFFD4E8FF),
),
```

## Integration

Import from `family_view.dart` in `home_page.dart`:
```dart
import 'family_view.dart';

// Use in home page
_buildFamilyTab() => const FamilyView();
```

## Navigation

The Family tab is accessible from the bottom navigation bar with the people icon.
