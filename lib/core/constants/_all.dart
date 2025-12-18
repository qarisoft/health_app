import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:health_app/l10n/app_localizations.dart' show AppLocalizations;

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ================ PRIMARY PALETTE ================
  // Main healthcare brand color - Teal/Green for health/medical feel
  static const Color primary = Color(0xFF0097A7); // Teal 700
  static const Color primaryDark = Color(0xFF006978); // Teal 800
  static const Color primaryLight = Color(0xFF56C8D8); // Teal 300
  static const Color primaryContainer = Color(0xFFA7E6EE); // Teal 100
  
  // ================ SECONDARY PALETTE ================
  // Complementary color for CTAs and highlights
  static const Color secondary = Color(0xFF7B1FA2); // Purple 700
  static const Color secondaryDark = Color(0xFF4A0072); // Purple 800
  static const Color secondaryLight = Color(0xFFAE52D4); // Purple 300
  static const Color secondaryContainer = Color(0xFFE1BEE7); // Purple 100
  
  // ================ TERTIARY/ACCENT PALETTE ================
  // For alerts, warnings, and special highlights
  static const Color tertiary = Color(0xFF00BFA5); // Teal A400
  static const Color tertiaryDark = Color(0xFF00897B); // Teal 600
  static const Color tertiaryLight = Color(0xFF64FFDA); // Teal A200
  static const Color tertiaryContainer = Color(0xFFB2DFDB); // Teal 50
  
  // ================ NEUTRAL PALETTE ================
  // For backgrounds, surfaces, and text
  static const Color background = Color(0xFFF8F9FA); // Light Grayish
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color surfaceVariant = Color(0xFFF1F3F4); // Slightly darker surface
  static const Color outline = Color(0xFFE0E0E0); // Gray 300
  static const Color outlineVariant = Color(0xFFC2C7CB); // Slightly darker outline
  
  // ================ SEMANTIC COLORS ================
  // For specific meanings and states
  static const Color success = Color(0xFF2E7D32); // Green 800
  static const Color successContainer = Color(0xFFC8E6C9); // Green 100
  
  static const Color warning = Color(0xFFF57C00); // Orange 700
  static const Color warningContainer = Color(0xFFFFE0B2); // Orange 100
  
  static const Color error = Color(0xFFC62828); // Red 800
  static const Color errorContainer = Color(0xFFFFCDD2); // Red 100
  
  static const Color info = Color(0xFF0288D1); // Blue 700
  static const Color infoContainer = Color(0xFFB3E5FC); // Blue 100
  
  static const Color disabled = Color(0xFF9E9E9E); // Gray 500
  static const Color disabledContainer = Color(0xFFF5F5F5); // Gray 100
  
  // ================ TEXT COLORS ================
  static const Color textPrimary = Color(0xFF1A1A1A); // Almost Black
  static const Color textSecondary = Color(0xFF5F6368); // Dark Gray
  static const Color textTertiary = Color(0xFF80868B); // Medium Gray
  static const Color textDisabled = Color(0xFF9AA0A6); // Light Gray
  
  // Text on colored backgrounds
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFFFFFFFF);
  static const Color textOnTertiary = Color(0xFF000000);
  static const Color textOnSuccess = Color(0xFFFFFFFF);
  static const Color textOnWarning = Color(0xFF000000);
  static const Color textOnError = Color(0xFFFFFFFF);
  static const Color textOnSurface = Color(0xFF1A1A1A);
  static const Color textOnBackground = Color(0xFF1A1A1A);
  
  // ================ ELEVATION/SHADOW COLORS ================
  static const Color shadow = Color(0x1A000000); // 10% opacity black
  static const Color scrim = Color(0x33000000); // 20% opacity black
  
  // ================ MEDICAL-SPECIFIC COLORS ================
  // Category-specific colors for better visual organization
  static const Color medicineCard = Color(0xFFE8F5E8); // Light Green
  static const Color medicineIcon = Color(0xFF4CAF50); // Green 500
  
  static const Color doctorCard = Color(0xFFE3F2FD); // Light Blue
  static const Color doctorIcon = Color(0xFF2196F3); // Blue 500
  
  static const Color appointmentCard = Color(0xFFF3E5F5); // Light Purple
  static const Color appointmentIcon = Color(0xFF9C27B0); // Purple 500
  
  static const Color historyCard = Color(0xFFFFF8E1); // Light Yellow/Amber
  static const Color historyIcon = Color(0xFFFF9800); // Orange 500
  
  static const Color emergencyCard = Color(0xFFFFEBEE); // Light Red
  static const Color emergencyIcon = Color(0xFFF44336); // Red 500
  
  static const Color labCard = Color(0xFFE0F2F1); // Light Teal
  static const Color labIcon = Color(0xFF009688); // Teal 500
  
  // ================ HEALTH METRIC COLORS ================
  static const Color heartRate = Color(0xFFE53935); // Red 600
  static const Color bloodPressure = Color(0xFF3949AB); // Indigo 600
  static const Color temperature = Color(0xFFFF8F00); // Amber 700
  static const Color oxygen = Color(0xFF00ACC1); // Cyan 600
  static const Color glucose = Color(0xFF8E24AA); // Purple 600
  static const Color weight = Color(0xFF43A047); // Green 600
  
  // ================ GRADIENTS ================
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );
  
  static const Gradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [secondary, secondaryLight],
  );
  
  static const Gradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [success, Color(0xFF81C784)],
  );
  
  static const Gradient warningGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [warning, Color(0xFFFFB74D)],
  );
  
  static const Gradient errorGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [error, Color(0xFFEF5350)],
  );
  
  // ================ CHART COLORS ================
  static const List<Color> chartColors = [
    Color(0xFF0097A7), // Primary Teal
    Color(0xFF7B1FA2), // Secondary Purple
    Color(0xFF00BFA5), // Tertiary Teal
    Color(0xFFFF9800), // Warning Orange
    Color(0xFF2196F3), // Info Blue
    Color(0xFF4CAF50), // Success Green
    Color(0xFF9C27B0), // Purple
    Color(0xFFF44336), // Red
  ];
  
  // ================ BUTTON STATES ================
  static const Color buttonPressed = Color(0x14000000); // 8% opacity black
  static const Color buttonHovered = Color(0x0A000000); // 4% opacity black
  static const Color buttonFocused = Color(0x1F000000); // 12% opacity black
  
  // ================ INPUT FIELD COLORS ================
  static const Color inputBackground = Color(0xFFF8F9FA);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputFocusedBorder = primary;
  static const Color inputErrorBorder = error;
  static const Color inputLabel = textSecondary;
  static const Color inputHint = textTertiary;
  
  // ================ UTILITY METHODS ================
  
  /// Get a color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
  
  /// Get primary color with opacity
  static Color primaryWithOpacity(double opacity) {
    return primary.withOpacity(opacity);
  }
  
  /// Get a color for different elevations (Material Design spec)
  static Color getSurfaceColor(int elevation) {
    switch (elevation) {
      case 1:
        return const Color(0x0DFFFFFF); // 5% white overlay
      case 2:
        return const Color(0x12FFFFFF); // 7% white overlay
      case 3:
        return const Color(0x14FFFFFF); // 8% white overlay
      case 4:
        return const Color(0x17FFFFFF); // 9% white overlay
      case 5:
        return const Color(0x1CFFFFFF); // 11% white overlay
      case 6:
        return const Color(0x1FFFFFFF); // 12% white overlay
      case 8:
        return const Color(0x24FFFFFF); // 14% white overlay
      case 12:
        return const Color(0x2EFFFFFF); // 18% white overlay
      case 16:
        return const Color(0x33FFFFFF); // 20% white overlay
      case 24:
        return const Color(0x38FFFFFF); // 22% white overlay
      default:
        return const Color(0x14FFFFFF); // Default 8% for elevation 3
    }
  }
  
  /// Get a color for different semantic intensities
  static Color getSemanticColor(SemanticIntensity intensity) {
    switch (intensity) {
      case SemanticIntensity.low:
        return primaryContainer;
      case SemanticIntensity.medium:
        return primaryLight;
      case SemanticIntensity.high:
        return primary;
      case SemanticIntensity.veryHigh:
        return primaryDark;
    }
  }
  
  /// Get a color for different text emphasis levels
  static Color getTextEmphasis(TextEmphasis emphasis) {
    switch (emphasis) {
      case TextEmphasis.high:
        return textPrimary;
      case TextEmphasis.medium:
        return textSecondary;
      case TextEmphasis.low:
        return textTertiary;
      case TextEmphasis.disabled:
        return textDisabled;
    }
  }
}

// ================ ENUMS FOR UTILITY METHODS ================

enum SemanticIntensity {
  low,
  medium,
  high,
  veryHigh,
}

enum TextEmphasis {
  high,
  medium,
  low,
  disabled,
}

// ================ EXTENSIONS FOR EASY ACCESS ================

extension ColorExtension on BuildContext {
  Color get primaryColor => AppColors.primary;
  Color get primaryContainer => AppColors.primaryContainer;
  Color get secondaryColor => AppColors.secondary;
  Color get surfaceColor => AppColors.surface;
  Color get backgroundColor => AppColors.background;
  Color get errorColor => AppColors.error;
  Color get successColor => AppColors.success;
  Color get warningColor => AppColors.warning;
  
  ColorScheme get colorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.textOnPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.textOnSurface,
        secondary: AppColors.secondary,
        onSecondary: AppColors.textOnSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.textOnSurface,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.textOnTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.textOnSurface,
        error: AppColors.error,
        onError: AppColors.textOnError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.textOnError,
        surface: AppColors.surface,
        onSurface: AppColors.textOnSurface,
        surfaceContainerHighest: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.textOnSurface,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        shadow: AppColors.shadow,
        scrim: AppColors.scrim,
        inverseSurface: AppColors.surface,
        onInverseSurface: AppColors.textOnSurface,
        inversePrimary: AppColors.primary,
        surfaceTint: AppColors.primary,
      );
}





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

enum TextVariant {
  // Display variants
  displayLarge,
  displayMedium,
  displaySmall,
  
  // Headline variants
  headlineLarge,
  headlineMedium,
  headlineSmall,
  
  // Title variants
  titleLarge,
  titleMedium,
  titleSmall,
  
  // Body variants
  bodyLarge,
  bodyMedium,
  bodySmall,
  
  // Label variants
  labelLarge,
  labelMedium,
  labelSmall,
  
  // Button variants
  buttonLarge,
  buttonMedium,
  buttonSmall,
  
  // Custom variants
  caption,
  overline,
  
  // Form variants
  formLabel,
  formHint,
  formError,
  
  // Card variants
  cardTitle,
  cardSubtitle,
  cardCaption,
  
  // App-specific variants
  appBarTitle,
  bottomNavLabel,
  chipLabel,
  richTextBody,
  richTextHeading,
}


class AppTextStyles {
  AppTextStyles._();

  // Font families
  static const String primaryFontFamily = 'Inter';
  static const String secondaryFontFamily = 'Poppins';

  // Text style variants
  static TextStyle get displayLarge => GoogleFonts.inter(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        height: 1.12,
        letterSpacing: -0.25,
      );

  static TextStyle get displayMedium => GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        height: 1.16,
      );

  static TextStyle get displaySmall => GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 1.22,
      );

  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 1.25,
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.29,
      );

  static TextStyle get headlineSmall => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 1.33,
      );

  static TextStyle get titleLarge => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 1.27,
      );

  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
        letterSpacing: 0.15,
      );

  static TextStyle get titleSmall => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.1,
      );

  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
        letterSpacing: 0.25,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.4,
      );

  static TextStyle get labelLarge => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.1,
      );

  static TextStyle get labelMedium => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
        letterSpacing: 0.5,
      );

  static TextStyle get labelSmall => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 1.45,
        letterSpacing: 0.5,
      );

  // Custom text styles
  static TextStyle get buttonLarge => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        height: 1.6,
        letterSpacing: 0.1,
      );

  static TextStyle get buttonMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.25,
      );

  static TextStyle get buttonSmall => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 1.38,
        letterSpacing: 0.25,
      );

  static TextStyle get caption => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.4,
      );

  static TextStyle get overline => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.6,
        letterSpacing: 0.5,
      );

  // Rich text styles
  static TextStyle get richTextBody => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.57,
      );

  static TextStyle get richTextHeading => GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.44,
      );

  // Form text styles
  static TextStyle get formLabel => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
      );

  static TextStyle get formHint => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
      );

  static TextStyle get formError => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.33,
      );

  // Card text styles
  static TextStyle get cardTitle => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5,
      );

  static TextStyle get cardSubtitle => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
      );

  static TextStyle get cardCaption => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.33,
      );

  // App-specific styles
  static TextStyle get appBarTitle => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
      );

  static TextStyle get bottomNavLabel => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
      );

  static TextStyle get chipLabel => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 1.38,
      );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      // colorScheme: AppColors.colorScheme,
      
      // // Apply the color scheme from AppColors
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.textOnPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.textOnSurface,
        secondary: AppColors.secondary,
        onSecondary: AppColors.textOnSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.textOnSurface,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.textOnTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.textOnSurface,
        error: AppColors.error,
        onError: AppColors.textOnError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.textOnError,
        surface: AppColors.surface,
        onSurface: AppColors.textOnSurface,
        surfaceContainerHighest: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.textOnSurface,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        shadow: AppColors.shadow,
        scrim: AppColors.scrim,
        inverseSurface: AppColors.surface,
        onInverseSurface: AppColors.textOnSurface,
        inversePrimary: AppColors.primary,
        surfaceTint: AppColors.primary,
      ),
      
      // Scaffold
      scaffoldBackgroundColor: AppColors.background,
      
      // App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: AppColors.primary,
        titleTextStyle: AppTextStyles.appBarTitle.copyWith(
          color: AppColors.textOnPrimary,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textOnPrimary,
        ),
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textTertiary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: AppTextStyles.bottomNavLabel.copyWith(
          color: AppColors.primary,
        ),
        unselectedLabelStyle: AppTextStyles.bottomNavLabel.copyWith(
          color: AppColors.textTertiary,
        ),
      ),
      
      // Floating Action Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 6,
        highlightElevation: 12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusLarge),
        ),
      ),
      
      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          disabledBackgroundColor: AppColors.disabledContainer,
          disabledForegroundColor: AppColors.textDisabled,
          minimumSize: const Size(double.infinity, AppLayout.buttonHeight),
          padding: const EdgeInsets.symmetric(
            horizontal: AppLayout.paddingLarge,
            vertical: AppLayout.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppLayout.buttonBorderRadius),
          ),
          elevation: 2,
          textStyle: AppTextStyles.buttonLarge,
          shadowColor: AppColors.shadow,
        ),
      ),
      
      // Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.disabled,
          padding: const EdgeInsets.symmetric(
            horizontal: AppLayout.paddingMedium,
            vertical: AppLayout.paddingSmall,
          ),
          textStyle: AppTextStyles.buttonMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
          ),
        ),
      ),
      
      // Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.disabled,
          side: BorderSide(color: AppColors.outline),
          padding: const EdgeInsets.symmetric(
            horizontal: AppLayout.paddingLarge,
            vertical: AppLayout.paddingMedium,
          ),
          textStyle: AppTextStyles.buttonMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppLayout.buttonBorderRadius),
          ),
        ),
      ),
      
      // Card
      cardTheme: CardThemeData(
        color: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        elevation: 1,
        shadowColor: AppColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusLarge),
        ),
        margin: const EdgeInsets.all(AppLayout.spacingSmall),
      ),
      
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackground,
        hoverColor: AppColors.inputBackground,
        focusColor: AppColors.primaryContainer,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppLayout.paddingMedium,
          vertical: AppLayout.paddingSmall,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
          borderSide: BorderSide(color: AppColors.inputBorder),
          gapPadding: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
          borderSide: BorderSide(color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
          borderSide: BorderSide(color: AppColors.inputFocusedBorder, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
          borderSide: BorderSide(color: AppColors.inputErrorBorder),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
          borderSide: BorderSide(color: AppColors.inputErrorBorder, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
          borderSide: BorderSide(color: AppColors.disabled),
        ),
        labelStyle: AppTextStyles.formLabel.copyWith(
          color: AppColors.inputLabel,
        ),
        hintStyle: AppTextStyles.formHint.copyWith(
          color: AppColors.inputHint,
        ),
        errorStyle: AppTextStyles.formError.copyWith(
          color: AppColors.error,
        ),
        floatingLabelStyle: WidgetStateTextStyle.resolveWith(
          (Set<WidgetState> states) {
            final Color color = states.contains(WidgetState.error)
                ? AppColors.error
                : states.contains(WidgetState.focused)
                    ? AppColors.primary
                    : AppColors.textSecondary;
            return AppTextStyles.formLabel.copyWith(color: color);
          },
        ),
      ),
      
      // Dialog
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        elevation: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusLarge),
        ),
      ),
      
      // Chip
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceVariant,
        disabledColor: AppColors.disabledContainer,
        selectedColor: AppColors.primaryContainer,
        secondarySelectedColor: AppColors.secondaryContainer,
        labelStyle: AppTextStyles.chipLabel,
        secondaryLabelStyle: AppTextStyles.chipLabel.copyWith(
          color: AppColors.textOnSurface,
        ),
        brightness: Brightness.light,
        padding: const EdgeInsets.symmetric(
          horizontal: AppLayout.paddingSmall,
          vertical: AppLayout.paddingExtraSmall,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        ),
        side: BorderSide.none,
        elevation: 0,
      ),
      
      // Divider
      dividerTheme: DividerThemeData(
        color: AppColors.outline,
        thickness: 1,
        space: AppLayout.spacingMedium,
      ),
      
      // Progress Indicator
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.primaryContainer,
        circularTrackColor: AppColors.primaryContainer,
      ),
      
      // Snack Bar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surface,
        contentTextStyle: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textOnSurface,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        ),
        elevation: 6,
        behavior: SnackBarBehavior.floating,
      ),
      
      // Bottom Sheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppLayout.borderRadiusLarge),
          ),
        ),
        elevation: 8,
        modalBackgroundColor: AppColors.scrim,
        modalElevation: 16,
      ),
      
      // Popup Menu
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        ),
        textStyle: AppTextStyles.bodyMedium,
      ),
    );
  }
  
  // Optional: Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      // You can create a dark version of AppColors or use inverse colors
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryLight,
        secondary: AppColors.secondaryLight,
        tertiary: AppColors.tertiaryLight,
        surface: const Color(0xFF1E1E1E),
      ),
      // ... rest of dark theme configuration
    );
  }
}





extension AppEx on BuildContext {
  // Navigations
  Future<T?> toNamed<T>(String routeName) async =>
      await Navigator.of(this).pushNamed(routeName);

  Future<T?> to<T>(Widget w) async =>
      await Navigator.of(this).push(MaterialPageRoute(builder: (context) => w));

  void pop<T extends Object?>([T? results]) {
    Navigator.of(this).pop(results);
  }
  //

  AppLocalizations get tr => AppLocalizations.of(this)!;

  ThemeData get theme => Theme.of(this);

  bool get isArabic => tr.localeName == 'ar';
}

extension Loger on Object? {
  void log() {
    if (this != null) {
      print('###: ${toString()}');
    }
  }
}

void xlog(Object o) {
  print('###: $o');
}
