import 'package:flutter/material.dart';

class SecurityPrivacyPage extends StatelessWidget {
  const SecurityPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Security & Privacy')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Security & Privacy',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, color: cs.onSurface)),
            const SizedBox(height: 8),
            Text('Manage permissions, encryption and safety settings.',
                style: TextStyle(fontSize: 14, color: cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
