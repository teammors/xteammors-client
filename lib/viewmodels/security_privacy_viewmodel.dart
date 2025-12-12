import 'package:flutter/material.dart';
import '../utils/toast_utils.dart';

@immutable
class SecurityPrivacyViewModel {
  final bool blockStrangerSearch;
  final bool blockStrangerMessages;
  final bool blockStrangerVoiceCalls;
  final bool blockStrangerVideoCalls;
  const SecurityPrivacyViewModel({
    this.blockStrangerSearch = false,
    this.blockStrangerMessages = false,
    this.blockStrangerVoiceCalls = false,
    this.blockStrangerVideoCalls = false,
  });

  void changePassword(BuildContext context) {
    ToastUtils.showTopToast(
      context: context,
      message: '修改密码未实现',
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      icon: Icons.info_outline,
    );
  }

  void setLockScreenPassword(BuildContext context) {
    ToastUtils.showTopToast(
      context: context,
      message: '锁屏密码未实现',
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      icon: Icons.info_outline,
    );
  }

  void setRecoveryEmail(BuildContext context) {
    ToastUtils.showTopToast(
      context: context,
      message: '设定找回密码邮箱未实现',
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      icon: Icons.info_outline,
    );
  }

  void updatePrivacy(
    BuildContext context, {
    bool? blockStrangerSearch,
    bool? blockStrangerMessages,
    bool? blockStrangerVoiceCalls,
    bool? blockStrangerVideoCalls,
  }) {
    ToastUtils.showSuccess(context, '隐私设置已更新');
  }
}
