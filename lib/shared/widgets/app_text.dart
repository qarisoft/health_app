import 'package:flutter/material.dart';
import 'package:health_app/core/constants/text_variant.dart' show TextVariant;
import 'package:health_app/core/theme/text_styles.dart' show AppTextStyles;
import '../../core/constants/app_colors.dart';
// import '../../core/constants/app_text_styles.dart';
// import '../../core/enums/text_variant.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextVariant variant;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;
  final double? height;
  final FontWeight? fontWeight;
  final double? fontSize;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextStyle? customStyle;
  final bool inherit;

  const AppText({
    super.key,
    required this.text,
    required this.variant,
    this.color,
    this.align,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.height,
    this.fontWeight,
    this.fontSize,
    this.fontStyle,
    this.letterSpacing,
    this.decoration,
    this.decorationColor,
    this.customStyle,
    this.inherit = true,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = _getStyleFromVariant(variant);
    final effectiveStyle = customStyle != null
        ? defaultStyle.merge(customStyle)
        : defaultStyle;

    final finalStyle = effectiveStyle.copyWith(
      color: color ?? AppColors.textPrimary,
      height: height,
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      decoration: decoration,
      decorationColor: decorationColor,
    );

    return Text(
      text,
      style: finalStyle,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
    );
  }

  TextStyle _getStyleFromVariant(TextVariant variant) {
    switch (variant) {
      case TextVariant.displayLarge:
        return AppTextStyles.displayLarge;
      case TextVariant.displayMedium:
        return AppTextStyles.displayMedium;
      case TextVariant.displaySmall:
        return AppTextStyles.displaySmall;
      case TextVariant.headlineLarge:
        return AppTextStyles.headlineLarge;
      case TextVariant.headlineMedium:
        return AppTextStyles.headlineMedium;
      case TextVariant.headlineSmall:
        return AppTextStyles.headlineSmall;
      case TextVariant.titleLarge:
        return AppTextStyles.titleLarge;
      case TextVariant.titleMedium:
        return AppTextStyles.titleMedium;
      case TextVariant.titleSmall:
        return AppTextStyles.titleSmall;
      case TextVariant.bodyLarge:
        return AppTextStyles.bodyLarge;
      case TextVariant.bodyMedium:
        return AppTextStyles.bodyMedium;
      case TextVariant.bodySmall:
        return AppTextStyles.bodySmall;
      case TextVariant.labelLarge:
        return AppTextStyles.labelLarge;
      case TextVariant.labelMedium:
        return AppTextStyles.labelMedium;
      case TextVariant.labelSmall:
        return AppTextStyles.labelSmall;
      case TextVariant.buttonLarge:
        return AppTextStyles.buttonLarge;
      case TextVariant.buttonMedium:
        return AppTextStyles.buttonMedium;
      case TextVariant.buttonSmall:
        return AppTextStyles.buttonSmall;
      case TextVariant.caption:
        return AppTextStyles.caption;
      case TextVariant.overline:
        return AppTextStyles.overline;
      case TextVariant.formLabel:
        return AppTextStyles.formLabel;
      case TextVariant.formHint:
        return AppTextStyles.formHint;
      case TextVariant.formError:
        return AppTextStyles.formError;
      case TextVariant.cardTitle:
        return AppTextStyles.cardTitle;
      case TextVariant.cardSubtitle:
        return AppTextStyles.cardSubtitle;
      case TextVariant.cardCaption:
        return AppTextStyles.cardCaption;
      case TextVariant.appBarTitle:
        return AppTextStyles.appBarTitle;
      case TextVariant.bottomNavLabel:
        return AppTextStyles.bottomNavLabel;
      case TextVariant.chipLabel:
        return AppTextStyles.chipLabel;
      case TextVariant.richTextBody:
        return AppTextStyles.richTextBody;
      case TextVariant.richTextHeading:
        return AppTextStyles.richTextHeading;
    }
  }
}

// Extension for easier access to text variants
extension AppTextExtension on BuildContext {
  TextStyle get displayLarge => AppTextStyles.displayLarge;
  TextStyle get displayMedium => AppTextStyles.displayMedium;
  TextStyle get displaySmall => AppTextStyles.displaySmall;
  TextStyle get headlineLarge => AppTextStyles.headlineLarge;
  TextStyle get headlineMedium => AppTextStyles.headlineMedium;
  TextStyle get headlineSmall => AppTextStyles.headlineSmall;
  TextStyle get titleLarge => AppTextStyles.titleLarge;
  TextStyle get titleMedium => AppTextStyles.titleMedium;
  TextStyle get titleSmall => AppTextStyles.titleSmall;
  TextStyle get bodyLarge => AppTextStyles.bodyLarge;
  TextStyle get bodyMedium => AppTextStyles.bodyMedium;
  TextStyle get bodySmall => AppTextStyles.bodySmall;
  TextStyle get labelLarge => AppTextStyles.labelLarge;
  TextStyle get labelMedium => AppTextStyles.labelMedium;
  TextStyle get labelSmall => AppTextStyles.labelSmall;
  TextStyle get buttonLarge => AppTextStyles.buttonLarge;
  TextStyle get buttonMedium => AppTextStyles.buttonMedium;
  TextStyle get buttonSmall => AppTextStyles.buttonSmall;
}