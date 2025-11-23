import 'package:flutter/material.dart';
import '../viewmodels/contacts_viewmodel.dart';

class ContactsPage extends StatelessWidget {
  final ContactsViewModel viewModel;
  const ContactsPage({super.key, this.viewModel = const ContactsViewModel()});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Contacts'));
  }
}
