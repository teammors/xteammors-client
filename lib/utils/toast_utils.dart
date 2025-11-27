import 'package:flutter/material.dart';

class ToastUtils {

  static void showTopToast({
    required BuildContext context,
    required String message,
    Color backgroundColor = Colors.green,
    Color textColor = Colors.white,
    IconData? icon,
    Duration displayDuration = const Duration(seconds: 2),
    Curve curve = Curves.easeOut,
  }) {

    final overlayState = Overlay.of(context);

    final controller = AnimationController(
      vsync: overlayState!,
      duration: const Duration(milliseconds: 300),
    );


    final offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: curve));


    final overlayEntry = OverlayEntry(
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final width = mediaQuery.size.width;
        return Positioned(
          top: mediaQuery.viewPadding.top + 15,
          left: 20,
          width: width - 40,
          child: SlideTransition(
            position: offsetAnimation,
            child: Material(
              color: Colors.transparent,
              child: _buildToastContent(
                message,
                backgroundColor,
                textColor,
                icon,
              ),
            ),
          ),
        );
      },
    );


    overlayState.insert(overlayEntry);


    controller.forward();


    Future.delayed(displayDuration + controller.duration!, () {
      controller.reverse().then((_) {
        overlayEntry.remove();
        controller.dispose();
      });
    });
  }


  static Widget _buildToastContent(
    String message,
    Color bgColor,
    Color textColor,
    IconData? icon,
  ) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(icon, color: textColor),
              ),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }


  static void showSuccess(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) {
    showTopToast(
      context: context,
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
      displayDuration: duration,
    );
  }


  static void showError(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    showTopToast(
      context: context,
      message: message,
      backgroundColor: Colors.redAccent,
      icon: Icons.error,
      displayDuration: duration,
    );
  }


  static void showWarning(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    showTopToast(
      context: context,
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
      displayDuration: duration,
    );
  }
}
