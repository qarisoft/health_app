import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue; // <-- New property added
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final bool showPasswordToggle;
  final bool isDatePicker;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffix;
  final Color? fillColor;
  final bool isCompact;

  const CustomTextField({
    super.key,
    this.controller,
    this.initialValue, // <-- Added to constructor
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.showPasswordToggle = false,
    this.isDatePicker = false,
    this.firstDate,
    this.lastDate,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.textInputAction,
    this.focusNode,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
    this.contentPadding,
    this.suffix,
    this.fillColor,
    this.isCompact = false,
  }) : assert(
         initialValue == null || controller == null,
         'Cannot provide both a controller and an initial value.', // <-- Standard Flutter safety check
       );

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isPasswordVisible;
  TextEditingController?
  _internalController; // <-- Manages state if external controller is null

  // Helper to always get a valid controller
  TextEditingController get _effectiveController =>
      widget.controller ?? _internalController!;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = false;

    // If no controller is provided, create an internal one and set the initial value
    if (widget.controller == null) {
      _internalController = TextEditingController(text: widget.initialValue);
    }
  }

  @override
  void dispose() {
    // Only dispose the internal controller to prevent memory leaks.
    // External controllers should be disposed by their parent widget.
    _internalController?.dispose();
    super.dispose();
  }

  Future<void> _handleDateSelection() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
    );

    if (picked != null) {
      // Now safe to use _effectiveController even if external controller is null
      _effectiveController.text = DateFormat('yyyy-MM-dd').format(picked);
      if (widget.onChanged != null) {
        widget.onChanged!(_effectiveController.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool shouldShowPasswordToggle =
        widget.showPasswordToggle && widget.obscureText;

    // 1. A date picker MUST be read-only, but CANNOT be disabled (otherwise onTap won't work)
    final bool isFieldReadOnly = widget.isDatePicker || widget.readOnly;

    // 2. If the user explicitly sets readOnly to true (and it's not a date picker),
    // we completely disable the field.
    final bool isEffectivelyEnabled = widget.enabled && !widget.readOnly;

    final double targetIconSize = widget.isCompact ? 20.0 : 24.0;
    final double targetFontSize = widget.isCompact ? 13.0 : 15.0;
    final EdgeInsetsGeometry targetPadding =
        widget.contentPadding ??
        (widget.isCompact
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 12)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 16));

    Widget? finalSuffixIcon;

    if (shouldShowPasswordToggle) {
      finalSuffixIcon = IconButton(
        iconSize: targetIconSize,
        splashRadius: widget.isCompact ? 18 : 24,
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey.shade600,
        ),
        onPressed: () =>
            setState(() => _isPasswordVisible = !_isPasswordVisible),
      );
    } else if (widget.isDatePicker) {
      finalSuffixIcon = Icon(Icons.calendar_today, size: targetIconSize);
    } else if (widget.suffixIcon != null) {
      finalSuffixIcon = Icon(widget.suffixIcon, size: targetIconSize);
    }

    // 3. Apply a disabled background color
    final Color? effectiveFillColor =
        widget.fillColor ??
        (!isEffectivelyEnabled || isFieldReadOnly
            ? Colors.grey.shade200
            : null);

    return TextFormField(
      controller: _effectiveController,
      obscureText: shouldShowPasswordToggle
          ? !_isPasswordVisible
          : widget.obscureText,

      readOnly: isFieldReadOnly,

      // 4. THIS completely disables the field (blocks typing, tapping, and focus)
      enabled: isEffectivelyEnabled,

      onTap: widget.isDatePicker ? _handleDateSelection : widget.onTap,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      textCapitalization: widget.textCapitalization,

      // 5. Dim the text color when disabled
      style: TextStyle(
        fontSize: widget.isCompact ? 14.0 : 16.0,
        color: !isEffectivelyEnabled ? Colors.grey.shade600 : Colors.black,
      ),

      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: TextStyle(
          fontSize: targetFontSize,
          color: !isEffectivelyEnabled ? Colors.grey.shade600 : null,
        ),
        hintStyle: TextStyle(fontSize: targetFontSize),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, size: targetIconSize)
            : null,
        suffixIcon: finalSuffixIcon,
        suffix: widget.suffix,

        filled: effectiveFillColor != null,
        fillColor: effectiveFillColor,
        contentPadding: targetPadding,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        // 6. Flutter natively uses `disabledBorder` when `enabled: false`
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }

  @override
  Widget build0(BuildContext context) {
    final bool shouldShowPasswordToggle =
        widget.showPasswordToggle && widget.obscureText;

    final double targetIconSize = widget.isCompact ? 20.0 : 24.0;
    final double targetFontSize = widget.isCompact ? 13.0 : 15.0;
    final EdgeInsetsGeometry targetPadding =
        widget.contentPadding ??
        (widget.isCompact
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 12)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 16));

    Widget? finalSuffixIcon;

    if (shouldShowPasswordToggle) {
      finalSuffixIcon = IconButton(
        iconSize: targetIconSize,
        splashRadius: widget.isCompact ? 18 : 24,
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey.shade600,
        ),
        onPressed: () =>
            setState(() => _isPasswordVisible = !_isPasswordVisible),
      );
    } else if (widget.isDatePicker) {
      finalSuffixIcon = Icon(Icons.calendar_today, size: targetIconSize);
    } else if (widget.suffixIcon != null) {
      finalSuffixIcon = Icon(widget.suffixIcon, size: targetIconSize);
    }

    return TextFormField(
      // We always pass _effectiveController, so we NEVER pass initialValue directly to TextFormField
      controller: _effectiveController,
      obscureText: shouldShowPasswordToggle
          ? !_isPasswordVisible
          : widget.obscureText,
      readOnly: widget.isDatePicker || widget.readOnly,

      onTap: widget.isDatePicker ? _handleDateSelection : widget.onTap,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      textCapitalization: widget.textCapitalization,
      style: TextStyle(fontSize: widget.isCompact ? 14.0 : 16.0),
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle: TextStyle(fontSize: targetFontSize),
        hintStyle: TextStyle(fontSize: targetFontSize),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, size: targetIconSize)
            : null,
        suffixIcon: finalSuffixIcon,
        suffix: widget.suffix,
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        contentPadding: targetPadding,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
