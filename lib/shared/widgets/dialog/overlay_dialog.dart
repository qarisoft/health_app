import 'package:flutter/material.dart';
import 'package:health_app/shared/widgets/dialog/app_dialog.dart';

/// Base dialog widget for overlay
class OverlayDialog extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final Color backgroundColor;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  const OverlayDialog({
    super.key,
    required this.child,
    this.padding,
    this.constraints,
    this.backgroundColor = Colors.white,
    this.borderRadius = 12.0,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints ?? const BoxConstraints(maxWidth: 500),
      padding: padding ?? const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow ??
            [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
      ),
      child: child,
    );
  }
}

/// Alert dialog for overlay
class OverlayAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;
  final IconData? icon;
  final Color? iconColor;

  const OverlayAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    this.actions = const [],
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlayDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null)
            Center(
              child: Icon(
                icon,
                size: 48,
                color: iconColor ?? Theme.of(context).primaryColor,
              ),
            ),
          if (icon != null) const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (actions.isNotEmpty) ...[
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions,
            ),
          ],
        ],
      ),
    );
  }
}

/// Confirmation dialog for overlay
class OverlayConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final Color? confirmColor;
  final Color? cancelColor;

  const OverlayConfirmationDialog({
    Key? key,
    required this.title,
    required this.message,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    required this.onConfirm,
    this.onCancel,
    this.confirmColor,
    this.cancelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlayAlertDialog(
      title: title,
      content: message,
      actions: [
        TextButton(
          onPressed: () {
            OverlayDialogService().dismiss();
            onCancel?.call();
          },
          style: TextButton.styleFrom(
            foregroundColor: cancelColor ?? Colors.grey,
          ),
          child: Text(cancelText),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            OverlayDialogService().dismiss();
            onConfirm();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: confirmColor ?? Theme.of(context).primaryColor,
          ),
          child: Text(confirmText),
        ),
      ],
    );
  }
}