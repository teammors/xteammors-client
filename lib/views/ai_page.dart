import 'package:flutter/material.dart';
import '../viewmodels/ai_viewmodel.dart';

class AIPage extends StatelessWidget {
  final AIViewModel viewModel;
  const AIPage({super.key, this.viewModel = const AIViewModel()});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('AI'));
  }
}
