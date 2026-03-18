import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
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

  // New property for dialogs or tight spaces
  final bool isCompact;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
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
    this.isCompact = false, // Defaults to false for normal screens
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = false;
  }

  Future<void> _handleDateSelection() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
    );

    if (picked != null) {
      widget.controller.text = DateFormat('yyyy-MM-dd').format(picked);
      if (widget.onChanged != null) {
        widget.onChanged!(widget.controller.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool shouldShowPasswordToggle =
        widget.showPasswordToggle && widget.obscureText;

    // --- Dynamic Sizing Logic ---
    final double targetIconSize = widget.isCompact ? 20.0 : 24.0;
    final double targetFontSize = widget.isCompact ? 13.0 : 15.0;
    final EdgeInsetsGeometry targetPadding =
        widget.contentPadding ??
        (widget.isCompact
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 12)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 16));

    Widget? finalSuffixIcon;

    // Handle Password Toggle Icon
    if (shouldShowPasswordToggle) {
      finalSuffixIcon = IconButton(
        iconSize: targetIconSize,
        splashRadius: widget.isCompact ? 18 : 24, // Smaller splash radius
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey.shade600,
        ),
        onPressed: () =>
            setState(() => _isPasswordVisible = !_isPasswordVisible),
      );
    }
    // Handle Date Picker Icon
    else if (widget.isDatePicker) {
      finalSuffixIcon = Icon(Icons.calendar_today, size: targetIconSize);
    }
    // Handle Standard Suffix Icon
    else if (widget.suffixIcon != null) {
      finalSuffixIcon = Icon(widget.suffixIcon, size: targetIconSize);
    }

    return TextFormField(
      controller: widget.controller,
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

      // Optionally scale down the input text itself
      style: TextStyle(fontSize: widget.isCompact ? 14.0 : 16.0),

      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        // Apply dynamic font sizes to hints and labels
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
