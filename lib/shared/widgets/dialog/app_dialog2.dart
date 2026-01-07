import 'dart:async';
import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:health_app/core/constants/app_colors.dart' show AppColors;

// --- Placeholder for your existing AppColors ---
// Remove this class if you import your own constants
// class AppColors {

// }

enum DialogType { info, success, error, warning, loading, input, custom }
enum DialogAnimation { fade, scale, slideUp, slideDown, slideLeft, slideRight, none }

class DialogAction {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final bool isPrimary;
  final bool isDestructive;

  const DialogAction({
    required this.text,
    this.onPressed,
    this.color,
    this.isPrimary = false,
    this.isDestructive = false,
  });
}

class DialogResponse<T> {
  final T? data;
  final bool confirmed;
  const DialogResponse({this.data, this.confirmed = false});
}

class AppDialog {
  // Singleton
  static final AppDialog _instance = AppDialog._internal();
  factory AppDialog() => _instance;
  AppDialog._internal();

  /// 1. SETUP: Assign this key to your MaterialApp -> navigatorKey
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Helper to get context safely
  BuildContext? get _context => navigatorKey.currentContext;

  // --- TOAST QUEUE ---
  final Queue<_ToastRequest> _toastQueue = Queue();
  OverlayEntry? _currentToastEntry;
  bool _isShowingToast = false;

  // --- CORE DIALOG METHOD ---

  /// Show a standardized dialog with animations
  Future<DialogResponse<T>?> show<T>({
    String? title,
    String? message,
    Widget? content,
    DialogType type = DialogType.info,
    List<DialogAction> actions = const [],
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
    DialogAnimation animation = DialogAnimation.scale,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    if (_context == null) {
      debugPrint("❌ AppDialog: Context is null. Did you set the navigatorKey?");
      return Future.value(null);
    }

    return showGeneralDialog<DialogResponse<T>>(
      context: _context!,
      barrierDismissible: barrierDismissible,
      barrierLabel: "Dismiss",
      barrierColor: barrierColor,
      transitionDuration: duration,
      pageBuilder: (ctx, anim1, anim2) => const SizedBox(), // Unused, we use transitionBuilder
      transitionBuilder: (ctx, anim1, anim2, child) {
        return _buildAnimatedDialog(
          animation: animation,
          animationController: anim1,
          child: _DialogUI(
            title: title,
            message: message,
            content: content,
            type: type,
            actions: actions,
          ),
        );
      },
    );
  }

  // --- CONVENIENCE METHODS ---

  Future<DialogResponse<void>?> info({
    required String title,
    required String message,
    String buttonText = 'OK',
  }) {
    return show(
      title: title,
      message: message,
      type: DialogType.info,
      actions: [
        DialogAction(text: buttonText, isPrimary: true, onPressed: () => dismiss(confirmed: true)),
      ],
    );
  }

  Future<DialogResponse<void>?> success({
    required String title,
    required String message,
  }) {
    return show(
      title: title,
      message: message,
      type: DialogType.success,
      actions: [
        DialogAction(text: 'Great', isPrimary: true, onPressed: () => dismiss(confirmed: true)),
      ],
    );
  }

  Future<DialogResponse<bool>?> confirm({
    required String title,
    required String message,
    String confirmText = 'Yes',
    String cancelText = 'No',
    bool isDestructive = false,
  }) async {
    final result = await show<bool>(
      title: title,
      message: message,
      type: DialogType.warning,
      actions: [
        DialogAction(
          text: cancelText, 
          onPressed: () => dismiss(confirmed: false, data: false)
        ),
        DialogAction(
          text: confirmText,
          isPrimary: true,
          isDestructive: isDestructive,
          onPressed: () => dismiss(confirmed: true, data: true),
        ),
      ],
    );
    return result;
  }

  /// Show a loading dialog (Blocking)
  void loading({String message = "Loading..."}) {
    show(
      type: DialogType.loading,
      barrierDismissible: false,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(message),
        ],
      ),
    );
  }

  /// Show an Input Dialog
  Future<String?> input({
    required String title,
    String? hint,
    String confirmText = 'Submit',
  }) async {
    String tempValue = "";
    final result = await show<String>(
      title: title,
      type: DialogType.input,
      content: Material(
        color: Colors.transparent,
        child: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          onChanged: (v) => tempValue = v,
        ),
      ),
      actions: [
        DialogAction(text: "Cancel", onPressed: () => dismiss()),
        DialogAction(
          text: confirmText, 
          isPrimary: true, 
          onPressed: () => dismiss(confirmed: true, data: tempValue)
        ),
      ],
    );
    return result?.confirmed == true ? result?.data : null;
  }

  // --- ACTIONS ---

  void dismiss<T>({bool confirmed = false, T? data}) {
    if (navigatorKey.currentState?.canPop() == true) {
      navigatorKey.currentState?.pop(DialogResponse<T>(confirmed: confirmed, data: data));
    }
  }

  // --- TOASTS (OVERLAY BASED) ---

  void toast(String message, {DialogType type = DialogType.info, Duration duration = const Duration(seconds: 3)}) {
    _toastQueue.add(_ToastRequest(message, type, duration));
    if (!_isShowingToast) {
      _processNextToast();
    }
  }

  void _processNextToast() {
    if (_toastQueue.isEmpty) {
      _isShowingToast = false;
      return;
    }

    _isShowingToast = true;
    final request = _toastQueue.removeFirst();
    final overlay = navigatorKey.currentState!.overlay!;

    _currentToastEntry = OverlayEntry(
      builder: (context) => _ToastWidget(
        request: request,
        onDismissed: () {
          _currentToastEntry?.remove();
          _currentToastEntry = null;
          _processNextToast();
        },
      ),
    );

    overlay.insert(_currentToastEntry!);
  }

  // --- ANIMATION BUILDER ---

  Widget _buildAnimatedDialog({
    required DialogAnimation animation,
    required Animation<double> animationController,
    required Widget child,
  }) {
    switch (animation) {
      case DialogAnimation.scale:
        return ScaleTransition(
          scale: CurvedAnimation(parent: animationController, curve: Curves.easeOutBack),
          child: child,
        );
      case DialogAnimation.fade:
        return FadeTransition(opacity: animationController, child: child);
      case DialogAnimation.slideUp:
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut)),
          child: child,
        );
      case DialogAnimation.slideDown:
         return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
              .animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut)),
          child: child,
        );
      default:
        return child;
    }
  }
}

// ==========================================
//              UI WIDGETS
// ==========================================

class _DialogUI extends StatelessWidget {
  final String? title;
  final String? message;
  final Widget? content;
  final DialogType type;
  final List<DialogAction> actions;

  const _DialogUI({
    this.title,
    this.message,
    this.content,
    required this.type,
    required this.actions,
  });

  Color get _headerColor {
    switch (type) {
      case DialogType.success: return AppColors.success;
      case DialogType.error: return AppColors.error;
      case DialogType.warning: return AppColors.warning;
      default: return AppColors.primary;
    }
  }

  IconData? get _icon {
    switch (type) {
      case DialogType.success: return Icons.check_circle_outline;
      case DialogType.error: return Icons.error_outline;
      case DialogType.warning: return Icons.warning_amber_rounded;
      case DialogType.info: return Icons.info_outline;
      case DialogType.input: return Icons.edit;
      default: return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            constraints: const BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 10)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. Icon Header (if not loading/custom)
                if (type != DialogType.loading && type != DialogType.custom && _icon != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 8),
                    child: Icon(_icon, size: 48, color: _headerColor),
                  ),

                // 2. Title
                if (title != null)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),

                // 3. Message
                if (message != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Text(
                      message!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 15, height: 1.4),
                    ),
                  ),

                // 4. Custom Content
                if (content != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    child: content!,
                  ),

                // 5. Actions
                if (actions.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actions.map((action) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: action.isPrimary 
                            ? ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: action.isDestructive ? Colors.red : _headerColor,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                onPressed: action.onPressed,
                                child: Text(action.text),
                              )
                            : TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: action.isDestructive ? Colors.red : Colors.grey[600],
                                ),
                                onPressed: action.onPressed,
                                child: Text(action.text),
                              ),
                        );
                      }).toList(),
                    ),
                  ),
                
                // Bottom padding if no actions
                if (actions.isEmpty) const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- Toast Classes ---

class _ToastRequest {
  final String message;
  final DialogType type;
  final Duration duration;
  _ToastRequest(this.message, this.type, this.duration);
}

class _ToastWidget extends StatefulWidget {
  final _ToastRequest request;
  final VoidCallback onDismissed;

  const _ToastWidget({required this.request, required this.onDismissed});

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnim;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    
    _offsetAnim = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward().then((_) async {
      await Future.delayed(widget.request.duration);
      if (mounted) {
        await _controller.reverse();
        widget.onDismissed();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color get _bgColor {
    switch (widget.request.type) {
      case DialogType.error: return AppColors.error;
      case DialogType.success: return AppColors.success;
      default: return const Color(0xFF333333);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: SlideTransition(
          position: _offsetAnim,
          child: FadeTransition(
            opacity: _fadeAnim,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: _bgColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: const Offset(0, 4))],
              ),
              child: Row(
                children: [
                  if (widget.request.type != DialogType.info) ...[
                    Icon(
                      widget.request.type == DialogType.success ? Icons.check_circle : Icons.error, 
                      color: Colors.white, 
                      size: 20
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Text(
                      widget.request.message,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}