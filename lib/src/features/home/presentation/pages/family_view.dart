import 'package:flutter/material.dart';
import 'family/family_header.dart';
import 'family/add_members_button.dart';
import 'family/family_member_card.dart';
import 'family/member/add_member_modal.dart';

class FamilyView extends StatefulWidget {
  const FamilyView({super.key});

  @override
  State<FamilyView> createState() => _FamilyViewState();
}

class _FamilyViewState extends State<FamilyView> {
  List<Map<String, dynamic>> familyMembers = [
    {
      'name': 'John Cena',
      'relation': 'AKA : Jimmy , Dad',
      'emoji': '👨',
      'eventInfo': 'Road Trip - Wed, Oct 15, 3:00 PM at Auburn, Al',
      'backgroundColor': const Color(0xFFD4E8FF),
    },
    {
      'name': 'Suzi',
      'relation': 'AKA : Suzi , Mom',
      'emoji': '👩',
      'eventInfo': 'Road Trip - Wed, Oct 15, 3:00 PM at Auburn, Al',
      'backgroundColor': const Color(0xFFD4FFD4),
    },
  ];

  void _addMember(String name, String emoji, Color color) {
    setState(() {
      familyMembers.add({
        'name': name,
        'relation': '',
        'emoji': emoji,
        'eventInfo': 'No events scheduled',
        'backgroundColor': color,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const FamilyHeader(),
            const SizedBox(height: 20),

            // Add Members Button
            AddMembersButton(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return AddMemberModal(
                      onMemberAdded: _addMember,
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),

            // Family Members List
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: familyMembers.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final member = familyMembers[index];
                return FamilyMemberCard(
                  name: member['name'],
                  relation: member['relation'],
                  emoji: member['emoji'],
                  eventInfo: member['eventInfo'],
                  backgroundColor: member['backgroundColor'],
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
