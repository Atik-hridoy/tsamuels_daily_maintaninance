import 'package:flutter/material.dart';
import '../../constants/ui_constants.dart';

class AddMembersButton extends StatelessWidget {
  final VoidCallback onTap;

  const AddMembersButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: UIConstants.primaryGradient,
        borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(UIConstants.borderRadiusMedium),
          child: Padding(
            padding: UIConstants.buttonPaddingVertical,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Add Members',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
