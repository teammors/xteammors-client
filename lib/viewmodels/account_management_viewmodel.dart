import 'package:flutter/material.dart';
import '../utils/toast_utils.dart';

@immutable
class UserAccount {
  final String id;
  final String nickname;
  final String loginName;
  final String? avatarUrl;
  const UserAccount({
    required this.id,
    required this.nickname,
    required this.loginName,
    this.avatarUrl,
  });
}

@immutable
class AccountManagementViewModel {
  final List<UserAccount> accounts;
  final String currentUserId;
  const AccountManagementViewModel({
    required this.accounts,
    required this.currentUserId,
  });

  const AccountManagementViewModel.sample()
      : accounts = const [
          UserAccount(
            id: 'u1',
            nickname: 'Alice',
            loginName: 'alice@example.com',
          ),
          UserAccount(
            id: 'u2',
            nickname: 'Bob',
            loginName: 'bob@example.com',
          ),
          UserAccount(
            id: 'u3',
            nickname: 'Charlie',
            loginName: 'charlie@example.com',
          ),
        ],
        currentUserId = 'u1';

  void login(BuildContext context, UserAccount account) {
    ToastUtils.showSuccess(context, '已登录为 ${account.nickname}');
  }
}
