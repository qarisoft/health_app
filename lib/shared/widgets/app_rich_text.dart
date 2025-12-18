import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:health_app/core/constants/text_variant.dart' show TextVariant;
import 'package:health_app/core/theme/text_styles.dart' show AppTextStyles;
import '../../core/constants/app_colors.dart';
// import '../../core/constants/app_text_styles.dart';
// import '../../core/enums/text_variant.dart';

class AppRichText extends StatelessWidget {
  final List<AppRichTextSpan> spans;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;

  const AppRichText({
    super.key,
    required this.spans,
    this.align,
    this.maxLines,
    this.overflow,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: spans.map((span) {
          final style = _getStyleFromVariant(span.variant).copyWith(
            color: span.color ?? AppColors.textPrimary,
            fontWeight: span.fontWeight,
            fontSize: span.fontSize,
            fontStyle: span.fontStyle,
            letterSpacing: span.letterSpacing,
            decoration: span.decoration,
            decorationColor: span.decorationColor,
            height: span.height,
          );
          
          return TextSpan(
            text: span.text,
            style: style,
            recognizer: span.onTap != null
                ? (TapGestureRecognizer()..onTap = span.onTap)
                : null,
          );
        }).toList(),
      ),
      // textAlign: align,
      maxLines: maxLines,
      // overflow: overflow,
      // softWrap: softWrap,
    );
  }

  TextStyle _getStyleFromVariant(TextVariant variant) {
    switch (variant) {
      case TextVariant.richTextBody:
        return AppTextStyles.richTextBody;
      case TextVariant.richTextHeading:
        return AppTextStyles.richTextHeading;
      default:
        return AppTextStyles.bodyMedium;
    }
  }
}

class AppRichTextSpan {
  final String text;
  final TextVariant variant;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? height;
  final VoidCallback? onTap;

  const AppRichTextSpan({
    required this.text,
    required this.variant,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.fontStyle,
    this.letterSpacing,
    this.decoration,
    this.decorationColor,
    this.height,
    this.onTap,
  });
}