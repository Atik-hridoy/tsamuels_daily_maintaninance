# Member Module Structure

This directory contains all member profile editing widgets and functionality for the Family feature.

## File Structure

```
member/
├── emoji_picker.dart           # Avatar emoji selection grid
├── color_picker.dart           # Background color selection
├── pet_status_section.dart     # Pet checkbox toggle
├── birthday_section.dart       # Birthday date picker
├── nicknames_section.dart      # Common names/AKAs management
├── edit_member_modal.dart      # Main edit profile modal
└── README.md                   # This file
```

## Components

### EmojiPicker
- Grid of 32 emoji avatars (people and animals)
- Tap to select emoji
- Visual highlight for selected emoji
- Stateful widget

### ColorPicker
- Grid of 15 colors for background
- Tap to select color
- Checkmark indicator for selected color
- Stateful widget

### PetStatusSection
- Checkbox to mark member as pet
- Callback on status change
- Stateful widget

### BirthdaySection
- Date picker button
- Shows selected date
- Calendar icon
- Stateful widget

### NicknamesSection
- Text input field for nicknames
- Add button with gradient
- Display nicknames as chips with remove button
- Stateful widget

### EditMemberModal
- Orchestrates all member editing components
- Draggable bottom sheet
- Save, Cancel, and Remove Member buttons
- Gradient buttons using UIConstants
- Stateful widget

## Usage

Edit member profile by tapping settings icon on family member card:

```dart
EditMemberModal(
  memberName: 'John Cena',
  initialEmoji: '👨',
  initialColor: Color(0xFFD4E8FF),
)
```

## Integration

Automatically integrated into `FamilyMemberCard` via settings button tap.
