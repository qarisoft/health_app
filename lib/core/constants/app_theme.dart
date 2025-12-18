import 'package:flutter/material.dart';
import 'package:health_app/core/theme/text_styles.dart' show AppTextStyles;
import '../constants/app_colors.dart';
import '../constants/app_layout.dart';
// import '../constants/app_text_styles.dart';

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