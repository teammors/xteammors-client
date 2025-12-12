import 'package:flutter/material.dart';
import '../../viewmodels/account_management_viewmodel.dart';

class AccountManagementPage extends StatefulWidget {
  final AccountManagementViewModel viewModel;
  const AccountManagementPage(
      {super.key, this.viewModel = const AccountManagementViewModel.sample()});

  @override
  State<AccountManagementPage> createState() => _AccountManagementPageState();
}

class _AccountManagementPageState extends State<AccountManagementPage> {
  late String _currentUserId = widget.viewModel.currentUserId;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('用户管理')),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.15),
              ),
            ),
            child: Column(
              children: [
                for (int i = 0; i < widget.viewModel.accounts.length; i++)
                  _buildItem(context, widget.viewModel.accounts[i],
                      showDivider: i < widget.viewModel.accounts.length - 1),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, UserAccount account,
      {bool showDivider = false}) {
    final cs = Theme.of(context).colorScheme;
    final isCurrent = account.id == _currentUserId;
    return Column(
      children: [
        ListTile(
          leading: _avatar(account.avatarUrl),
          title: Text(account.nickname,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: cs.onSurface)),
          subtitle:
              Text(account.loginName, style: TextStyle(color: cs.onSurfaceVariant)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          trailing: isCurrent
              ? null
              : TextButton(
                  onPressed: () {
                    widget.viewModel.login(context, account);
                    setState(() => _currentUserId = account.id);
                  },
                  child: const Text('登录'),
                ),
          onTap: isCurrent
              ? null
              : () {
                  widget.viewModel.login(context, account);
                  setState(() => _currentUserId = account.id);
                },
        ),
        if (showDivider)
          Divider(
            height: 0,
            thickness: 0.5,
            color: Theme.of(context).dividerColor.withValues(alpha: 0.08),
          ),
      ],
    );
  }

  Widget _avatar(String? url) {
    if (url != null && url.isNotEmpty) {
      return const CircleAvatar(radius: 20);
    }
    return const CircleAvatar(radius: 20, child: Icon(Icons.person_outline));
  }
}
