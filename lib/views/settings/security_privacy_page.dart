import 'package:flutter/material.dart';
import '../../viewmodels/security_privacy_viewmodel.dart';

class SecurityPrivacyPage extends StatefulWidget {
  final SecurityPrivacyViewModel viewModel;
  const SecurityPrivacyPage(
      {super.key, this.viewModel = const SecurityPrivacyViewModel()});

  @override
  State<SecurityPrivacyPage> createState() => _SecurityPrivacyPageState();
}

class _SecurityPrivacyPageState extends State<SecurityPrivacyPage> {
  late bool _blockSearch = widget.viewModel.blockStrangerSearch;
  late bool _blockMessages = widget.viewModel.blockStrangerMessages;
  late bool _blockVoice = widget.viewModel.blockStrangerVoiceCalls;
  late bool _blockVideo = widget.viewModel.blockStrangerVideoCalls;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('安全和隐私')),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Text(
            '密码',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: cs.onSurface),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color:
                      Theme.of(context).dividerColor.withValues(alpha: 0.15)),
            ),
            child: Column(
              children: [
                ListTile(
                  title: const Text('修改密码'),
                  trailing:
                      Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onTap: () => widget.viewModel.changePassword(context),
                ),
                Divider(
                    height: 0,
                    thickness: 0.5,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.08)),
                ListTile(
                  title: const Text('锁屏密码'),
                  trailing:
                      Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onTap: () => widget.viewModel.setLockScreenPassword(context),
                ),
                Divider(
                    height: 0,
                    thickness: 0.5,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.08)),
                ListTile(
                  title: const Text('设定找回密码邮箱'),
                  trailing:
                      Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onTap: () => widget.viewModel.setRecoveryEmail(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '隐私',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: cs.onSurface),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: cs.primary.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color:
                      Theme.of(context).dividerColor.withValues(alpha: 0.15)),
            ),
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('屏蔽陌生人搜索'),
                  value: _blockSearch,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onChanged: (v) {
                    setState(() => _blockSearch = v);
                    widget.viewModel
                        .updatePrivacy(context, blockStrangerSearch: v);
                  },
                ),
                Divider(
                    height: 0,
                    thickness: 0.5,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.08)),
                SwitchListTile(
                  title: const Text('屏蔽陌生人消息'),
                  value: _blockMessages,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onChanged: (v) {
                    setState(() => _blockMessages = v);
                    widget.viewModel
                        .updatePrivacy(context, blockStrangerMessages: v);
                  },
                ),
                Divider(
                    height: 0,
                    thickness: 0.5,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.08)),
                SwitchListTile(
                  title: const Text('屏蔽陌生人语音通话'),
                  value: _blockVoice,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onChanged: (v) {
                    setState(() => _blockVoice = v);
                    widget.viewModel
                        .updatePrivacy(context, blockStrangerVoiceCalls: v);
                  },
                ),
                Divider(
                    height: 0,
                    thickness: 0.5,
                    color:
                        Theme.of(context).dividerColor.withValues(alpha: 0.08)),
                SwitchListTile(
                  title: const Text('屏蔽陌生人视频通话'),
                  value: _blockVideo,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  onChanged: (v) {
                    setState(() => _blockVideo = v);
                    widget.viewModel
                        .updatePrivacy(context, blockStrangerVideoCalls: v);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
