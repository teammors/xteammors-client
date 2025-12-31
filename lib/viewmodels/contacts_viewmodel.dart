import 'package:flutter/foundation.dart';

@immutable
class Contact {
  final String id;
  final String name;
  final String? avatarUrl;
  final DateTime? lastSeen;
  final bool online;
  const Contact({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.lastSeen,
    this.online = false,
  });
}

@immutable
class ContactsViewModel {
  const ContactsViewModel();

  List<Contact> get contacts => [
        Contact(
          id: '1',
          name: 'Alice',
          avatarUrl: 'https://avatars.githubusercontent.com/u/9919?s=200&v=4',
          online: true,
        ),
        Contact(
          id: '2',
          name: 'Bob',
          lastSeen: DateTime.now().subtract(const Duration(minutes: 12)),
        ),
        Contact(
          id: '3',
          name: 'Charlie',
          avatarUrl:
              'https://avatars.githubusercontent.com/u/1342004?s=200&v=4',
          lastSeen: DateTime.now().subtract(const Duration(hours: 3)),
        ),
        Contact(
          id: '4',
          name: 'Diana',
          online: true,
        ),
        Contact(
          id: '5',
          name: 'Evan',
          lastSeen: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        ),
        Contact(
          id: '6',
          name: 'Fiona',
          avatarUrl:
              'https://avatars.githubusercontent.com/u/14101776?s=200&v=4',
          lastSeen: DateTime.now().subtract(const Duration(minutes: 2)),
        ),
        Contact(
          id: '7',
          name: 'George',
          lastSeen: DateTime.now().subtract(const Duration(hours: 8)),
        ),
        Contact(
          id: '8',
          name: 'Hannah',
          online: true,
        ),
      ];
}
