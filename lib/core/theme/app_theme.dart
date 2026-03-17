import 'package:flutter/material.dart';

// import '../constants/app_colors.dart';
// import '../constants/app_layout.dart';

class AppTheme2 {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      surface: AppColors.surface,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        minimumSize: const Size(double.infinity, AppLayout.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        // borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        borderSide: const BorderSide(color: AppColors.inputBorder, width: 1),
        // borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        borderSide: const BorderSide(color: AppColors.primary, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      contentPadding: AppLayout.paddingAllMedium,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
      ),
      margin: AppLayout.marginAllSmall,
    ),
  );
}

class AppTheme {
  // ================ LIGHT THEME ================
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
      surface: AppColors.surface,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.textOnPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textOnPrimary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        minimumSize: const Size(double.infinity, AppLayout.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        borderSide: const BorderSide(color: AppColors.inputBorder, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        borderSide: const BorderSide(
          color: AppColors.inputFocusedBorder,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        borderSide: const BorderSide(color: AppColors.inputErrorBorder),
      ),
      contentPadding: AppLayout.paddingAllMedium,
    ),
    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
      ),
      margin: AppLayout.marginAllSmall,
    ),
  );

  // ================ DARK THEME ================
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primaryDark,
    primaryColorLight: AppColors.primaryLight,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryLight, // Lighter teal for better dark contrast
      secondary: AppColors.secondaryLight,
      error: AppColors.errorContainer, // Lighter red for visibility
      surface: AppColors.surfaceDark,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceDark,
      // Standard dark mode app bar
      foregroundColor: AppColors.textPrimaryDark,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimaryDark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.textPrimary,
        // Dark text on light teal button
        minimumSize: const Size(double.infinity, AppLayout.buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackgroundDark,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        borderSide: const BorderSide(
          color: AppColors.inputBorderDark,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        borderSide: const BorderSide(color: AppColors.primaryLight, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
        borderSide: const BorderSide(color: AppColors.errorContainer),
      ),
      hintStyle: const TextStyle(color: AppColors.textTertiaryDark),
      labelStyle: const TextStyle(color: AppColors.textSecondaryDark),
      contentPadding: AppLayout.paddingAllMedium,
    ),
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppLayout.borderRadiusMedium),
      ),
      margin: AppLayout.marginAllSmall,
    ),
  );
}

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // ================ DARK MODE NEUTRAL PALETTE ================
  static const Color backgroundDark = Color(
    0xFF121212,
  ); // Standard dark background
  static const Color surfaceDark = Color(0xFF1E1E1E); // Elevated dark surface
  static const Color surfaceVariantDark = Color(0xFF2C2C2C); // Higher elevation
  static const Color outlineDark = Color(0xFF424242); // Dark mode borders

  // ================ DARK MODE TEXT COLORS ================
  static const Color textPrimaryDark = Color(0xFFE3E3E3); // Off-white
  static const Color textSecondaryDark = Color(0xFFAAAAAA); // Light Gray
  static const Color textTertiaryDark = Color(0xFF808080); // Medium Gray

  // ================ DARK MODE INPUT COLORS ================
  static const Color inputBackgroundDark = Color(0xFF2C2C2C);
  static const Color inputBorderDark = Color(0xFF424242);

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
  static const Color surfaceVariant = Color(
    0xFFF1F3F4,
  ); // Slightly darker surface
  static const Color outline = Color(0xFFE0E0E0); // Gray 300
  static const Color outlineVariant = Color(
    0xFFC2C7CB,
  ); // Slightly darker outline

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

enum SemanticIntensity { low, medium, high, veryHigh }

enum TextEmphasis { high, medium, low, disabled }

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
