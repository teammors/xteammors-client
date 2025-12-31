import 'package:flutter/material.dart';

class AccountManagementPage extends StatelessWidget {
  const AccountManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Account Management')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Account Management',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600, color: cs.onSurface)),
            const SizedBox(height: 8),
            Text('Manage profile, login and linked devices.',
                style: TextStyle(fontSize: 14, color: cs.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
