import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final bool isDark;
  final String? senderName;
  const Avatar({required this.isDark, this.senderName});

  @override
  Widget build(BuildContext context) {
    Color getAvatarColor(String name) {
      final colors = [
        const Color(0xFF598BF6),
        const Color(0xFF34C759),
        const Color(0xFFFF9500),
        const Color(0xFFFF3B30),
        const Color(0xFFAF52DE),
      ];
      final index = name.codeUnits.fold(0, (a, b) => a + b) % colors.length;
      return colors[index];
    }

    String getInitials(String name) {
      if (name.isEmpty) return '?';
      if (name.length == 1) return name;
      return name.substring(0, 1);
    }

    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: senderName != null
            ? getAvatarColor(senderName!)
            : (isDark ? Colors.grey[700] : Colors.grey[300]),
      ),
      child: Center(
        child: Text(
          senderName != null ? getInitials(senderName!) : '?',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
