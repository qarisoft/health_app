import 'package:flutter/material.dart';

class OverlayDialogService {
  static final OverlayDialogService _instance = OverlayDialogService._internal();
  factory OverlayDialogService() => _instance;
  OverlayDialogService._internal();

  final List<OverlayEntry> _overlayEntries = [];
  OverlayState? _overlayState;

  /// Initialize with BuildContext
  void init(BuildContext context) {
    _overlayState = Overlay.of(context);
  }

  /// Show a dialog using Overlay
  void showDialog({
    required WidgetBuilder builder,
    bool barrierDismissible = true,
    Color barrierColor = const Color(0x80000000),
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    if (_overlayState == null) {
      throw Exception('OverlayDialogService not initialized. Call init() first.');
    }

    // Create overlay entry
    final overlayEntry = OverlayEntry(
      builder: (context) => _DialogOverlay(
        builder: builder,
        barrierDismissible: barrierDismissible,
        barrierColor: barrierColor,
        onDismiss: () => dismiss(),
        useSafeArea: useSafeArea,
      ),
    );

    _overlayEntries.add(overlayEntry);
    _overlayState!.insert(overlayEntry);
  }

  /// Dismiss the current dialog
  void dismiss() {
    if (_overlayEntries.isNotEmpty) {
      final entry = _overlayEntries.removeLast();
      entry.remove();
    }
  }

  /// Dismiss all dialogs
  void dismissAll() {
    for (final entry in _overlayEntries) {
      entry.remove();
    }
    _overlayEntries.clear();
  }

  /// Check if any dialog is shown
  bool get isDialogShown => _overlayEntries.isNotEmpty;

  /// Get the number of shown dialogs
  int get dialogCount => _overlayEntries.length;
}

/// Private widget for the dialog overlay
class _DialogOverlay extends StatelessWidget {
  final WidgetBuilder builder;
  final bool barrierDismissible;
  final Color barrierColor;
  final VoidCallback onDismiss;
  final bool useSafeArea;

  const _DialogOverlay({
    required this.builder,
    required this.barrierDismissible,
    required this.barrierColor,
    required this.onDismiss,
    required this.useSafeArea,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Barrier
          Positioned.fill(
            child: GestureDetector(
              onTap: barrierDismissible ? onDismiss : null,
              child: Container(
                color: barrierColor,
              ),
            ),
          ),

          // Dialog content
          Center(
            child: GestureDetector(
              onTap: () {}, // Prevent tap from going through to barrier
              child: builder(context),
            ),
          ),
        ],
      ),
    );

    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return content;
  }
}












