import 'package:flutter/foundation.dart';

@immutable
class GroupSummary {
  final String id;
  final String name;
  final String? avatarUrl;
  final int members;
  const GroupSummary({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.members,
  });
}

@immutable
class UserProfileViewModel {
  final String userId;
  final String name;
  final String? avatarUrl;
  final String? bio;
  final bool online;
  final List<GroupSummary> sharedGroups;

  const UserProfileViewModel({
    required this.userId,
    required this.name,
    this.avatarUrl,
    this.bio,
    this.online = false,
    this.sharedGroups = const [],
  });

  const UserProfileViewModel.sample()
      : userId = 'u_001',
        name = 'Alice Johnson',
        avatarUrl =
            'https://avatars.githubusercontent.com/u/9919?s=200&v=4',
        bio = 'Mobile developer. Coffee lover. Building delightful chat UIs.',
        online = true,
        sharedGroups = const [
          GroupSummary(
            id: 'g1',
            name: 'Flutter Devs',
            avatarUrl:
                'https://avatars.githubusercontent.com/u/14101776?s=200&v=4',
            members: 128,
          ),
          GroupSummary(
            id: 'g2',
            name: 'Design Weekly',
            members: 42,
          ),
          GroupSummary(
            id: 'g3',
            name: 'Project X Team',
            members: 16,
          ),
        ];
}

