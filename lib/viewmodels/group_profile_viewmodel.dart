import 'package:flutter/foundation.dart';

@immutable
class GroupMemberSummary {
  final String id;
  final String name;
  final String? avatarUrl;
  final bool online;
  final String? lastSeen;
  const GroupMemberSummary({
    required this.id,
    required this.name,
    this.avatarUrl,
    this.online = false,
    this.lastSeen,
  });
}

@immutable
class GroupProfileViewModel {
  final String groupId;
  final String name;
  final String? avatarUrl;
  final String? intro;
  final bool isOwner;
  final bool blocked;
  final List<GroupMemberSummary> members;

  const GroupProfileViewModel({
    required this.groupId,
    required this.name,
    this.avatarUrl,
    this.intro,
    this.isOwner = false,
    this.blocked = false,
    this.members = const [],
  });

  const GroupProfileViewModel.sample()
      : groupId = 'g_001',
        name = 'Flutter Devs',
        avatarUrl =
            'https://avatars.githubusercontent.com/u/14101776?s=200&v=4',
        intro = 'Flutter 开发者技术交流与分享',
        isOwner = false,
        blocked = false,
        members = const [
          GroupMemberSummary(id: 'u1', name: 'Alice', online: true),
          GroupMemberSummary(
              id: 'u2', name: 'Bob', lastSeen: 'yesterday 22:30'),
          GroupMemberSummary(
              id: 'u3', name: 'Charlie', lastSeen: 'today 09:15'),
          GroupMemberSummary(id: 'u4', name: 'Diana', online: true),
          GroupMemberSummary(id: 'u5', name: 'Eve', lastSeen: 'today 08:10'),
          GroupMemberSummary(
              id: 'u6', name: 'Frank', lastSeen: 'yesterday 18:40'),
          GroupMemberSummary(id: 'u7', name: 'Grace', online: true),
          GroupMemberSummary(id: 'u8', name: 'Heidi', lastSeen: 'today 12:00'),
          GroupMemberSummary(id: 'u9', name: 'Ivan', lastSeen: 'today 07:55'),
          GroupMemberSummary(id: 'u10', name: 'Judy', online: true),
          GroupMemberSummary(
              id: 'u11', name: 'Kevin', lastSeen: 'yesterday 23:10'),
          GroupMemberSummary(id: 'u12', name: 'Laura', lastSeen: 'today 10:30'),
          GroupMemberSummary(
              id: 'u13', name: 'Mallory', lastSeen: 'today 11:45'),
          GroupMemberSummary(id: 'u14', name: 'Niaj', online: true),
          GroupMemberSummary(
              id: 'u15', name: 'Olivia', lastSeen: 'today 09:50'),
          GroupMemberSummary(
              id: 'u16', name: 'Peggy', lastSeen: 'yesterday 20:05'),
          GroupMemberSummary(id: 'u17', name: 'Quentin', online: true),
          GroupMemberSummary(
              id: 'u18', name: 'Rupert', lastSeen: 'today 13:15'),
          GroupMemberSummary(id: 'u19', name: 'Sybil', lastSeen: 'today 14:30'),
          GroupMemberSummary(id: 'u20', name: 'Trent', online: true),
          GroupMemberSummary(id: 'u21', name: 'Uma', lastSeen: 'today 15:05'),
          GroupMemberSummary(
              id: 'u22', name: 'Victor', lastSeen: 'yesterday 21:25'),
          GroupMemberSummary(id: 'u23', name: 'Wendy', online: true),
          GroupMemberSummary(
              id: 'u24', name: 'Xavier', lastSeen: 'today 16:40'),
          GroupMemberSummary(
              id: 'u25', name: 'Yvonne', lastSeen: 'today 17:55'),
          GroupMemberSummary(id: 'u26', name: 'Zack', online: true),
          GroupMemberSummary(id: 'u27', name: 'Bella', lastSeen: 'today 10:05'),
          GroupMemberSummary(
              id: 'u28', name: 'Carter', lastSeen: 'yesterday 19:35'),
          GroupMemberSummary(id: 'u29', name: 'Duke', online: true),
        ];
}
