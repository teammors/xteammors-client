import 'package:flutter/material.dart';

class WorkspaceBlank extends StatelessWidget {
  const WorkspaceBlank({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return SizedBox.expand(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.dashboard_customize, size: 48, color: cs.primary),
            const SizedBox(height: 12),
            Text('Choose a topic to work on',
                style: tt.titleLarge?.copyWith(color: cs.onSurface)),
          ],
        ),
      ),
    );
  }
}
