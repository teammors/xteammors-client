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
          avatarUrl: 'https://i.pravatar.cc/150?img=3',
          online: true,
        ),
        Contact(
          id: '2',
          name: 'Bob',
          avatarUrl: 'https://i.pravatar.cc/150?img=7',
          lastSeen: DateTime.now().subtract(const Duration(minutes: 12)),
        ),
        Contact(
          id: '3',
          name: 'Charlie',
          avatarUrl: 'https://i.pravatar.cc/150?img=12',
          lastSeen: DateTime.now().subtract(const Duration(hours: 3)),
        ),
        Contact(
          id: '4',
          name: 'Diana',
          avatarUrl: 'https://i.pravatar.cc/150?img=18',
          online: true,
        ),
        Contact(
          id: '5',
          name: 'Evan',
          avatarUrl: 'https://i.pravatar.cc/150?img=20',
          lastSeen: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        ),
        Contact(
          id: '6',
          name: 'Fiona',
          avatarUrl: 'https://i.pravatar.cc/150?img=25',
          lastSeen: DateTime.now().subtract(const Duration(minutes: 2)),
        ),
        Contact(
          id: '7',
          name: 'George',
          avatarUrl: 'https://i.pravatar.cc/150?img=28',
          lastSeen: DateTime.now().subtract(const Duration(hours: 8)),
        ),
        Contact(
          id: '8',
          name: 'Hannah',
          avatarUrl: 'https://i.pravatar.cc/150?img=32',
          online: true,
        ),
      ];
}
