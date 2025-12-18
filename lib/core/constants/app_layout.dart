import 'package:flutter/material.dart';

class AppLayout {
  // Margins
  static const double marginExtraSmall = 4.0;
  static const double marginSmall = 8.0;
  static const double marginMedium = 16.0;
  static const double marginLarge = 24.0;
  static const double marginExtraLarge = 32.0;
  
  // Paddings
  static const double paddingExtraSmall = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingExtraLarge = 32.0;
  
  // Border Radius
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  static const double borderRadiusExtraLarge = 24.0;
  
  // Spacing
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 24.0;
  
  // Sizes
  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double buttonHeight = 48.0;


  static const double buttonBorderRadius = 4.0;
  
  // Get EdgeInsets
  static EdgeInsets get marginAllSmall => const EdgeInsets.all(marginSmall);
  static EdgeInsets get marginAllMedium => const EdgeInsets.all(marginMedium);
  static EdgeInsets get paddingAllSmall => const EdgeInsets.all(paddingSmall);
  static EdgeInsets get paddingAllMedium => const EdgeInsets.all(paddingMedium);
  static EdgeInsets get paddingAllLarge => const EdgeInsets.all(paddingLarge);
  static EdgeInsets get paddingHorizontalMedium => 
      const EdgeInsets.symmetric(horizontal: paddingMedium);
  static EdgeInsets get paddingHorizontalLarge => 
      const EdgeInsets.symmetric(horizontal: paddingLarge);
  static EdgeInsets get paddingVerticalSmall => 
      const EdgeInsets.symmetric(vertical: paddingSmall);
  static EdgeInsets get paddingVerticalMedium => 
      const EdgeInsets.symmetric(vertical: paddingMedium);
}