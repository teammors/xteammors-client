import 'package:flutter/material.dart';
import '../../viewmodels/messages_viewmodel.dart';

class StatusIcon extends StatelessWidget {
  final ReadMark status;
  const StatusIcon({required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ReadMark.singleGrey:
        return const Icon(Icons.done, color: Colors.grey, size: 16);
      case ReadMark.doubleGreen:
        return const Icon(Icons.done_all, color: Color(0xFF98E774), size: 16);
    }
  }
}
