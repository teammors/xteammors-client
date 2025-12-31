import 'package:flutter/foundation.dart';

@immutable
class GroupSummary {
  final String id;
  final String name;
  final int members;
  final String? avatarUrl;
  const GroupSummary({
    required this.id,
    required this.name,
    required this.members,
    this.avatarUrl,
  });
}

@immutable
class UserProfileViewModel {
  final String userId;
  final String name;
  final String? avatarUrl;
  final String? bio;
  final bool online;
  final bool blocked;
  final List<GroupSummary> sharedGroups;
  const UserProfileViewModel({
    required this.userId,
    required this.name,
    this.avatarUrl,
    this.bio,
    this.online = false,
    this.blocked = false,
    this.sharedGroups = const [],
  });

  const UserProfileViewModel.sample()
      : userId = 'u_001',
        name = 'Alice',
        avatarUrl = 'https://i.pravatar.cc/150?img=3',
        bio = '这个人很神秘，什么都没有留下',
        online = true,
        blocked = false,
        sharedGroups = const [
          GroupSummary(id: 'g1', name: 'Flutter Devs', members: 128),
          GroupSummary(id: 'g2', name: 'Design Weekly', members: 42),
          GroupSummary(id: 'g3', name: 'Project X Team', members: 16),
        ];
}
