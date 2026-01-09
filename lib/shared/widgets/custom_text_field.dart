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
      // Formats date to YYYY-MM-DD
      widget.controller.text = DateFormat('yyyy-MM-dd').format(picked);
      if (widget.onChanged != null) {
        widget.onChanged!(widget.controller.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool shouldShowPasswordToggle = widget.showPasswordToggle && widget.obscureText;

    Widget? finalSuffixIcon;

    // Handle Password Toggle Icon
    if (shouldShowPasswordToggle) {
      finalSuffixIcon = IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey.shade600,
        ),
        onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
        splashRadius: 20,
      );
    } 
    // Handle Date Picker Icon
    else if (widget.isDatePicker) {
      finalSuffixIcon = const Icon(Icons.calendar_today, size: 20);
    }
    // Handle Standard Suffix Icon
    else if (widget.suffixIcon != null) {
      finalSuffixIcon = Icon(widget.suffixIcon);
    }

    return TextFormField(
      controller: widget.controller,
      // Logic: Password visibility state vs base obscure setting
      obscureText: shouldShowPasswordToggle ? !_isPasswordVisible : widget.obscureText,
      // Logic: If date picker, prevent keyboard from appearing
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
      
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: finalSuffixIcon,
        suffix: widget.suffix,
        filled: widget.fillColor != null,
        fillColor: widget.fillColor,
        contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}