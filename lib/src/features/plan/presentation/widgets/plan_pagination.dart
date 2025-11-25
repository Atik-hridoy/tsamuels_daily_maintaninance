import 'package:flutter/material.dart';

class PlanPagination extends StatelessWidget {
  const PlanPagination({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildDot(true),
          const SizedBox(width: 8),
          _buildDot(false),
          const SizedBox(width: 8),
          _buildDot(false),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2196F3) : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}
