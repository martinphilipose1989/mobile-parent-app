import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  AppColors._();
  // Primary Colors
  static const Color primary = Color(0xFF3F41D1);
  static const Color primaryLight = Color(0xFF4B4DD4);
  static const Color primaryLighter = Color(0xFFEBEBFA);

  // On Primary Colors
  static const Color primaryOn = Color(0xFFFFFFFF);

  // Accent Colors
  static const Color accent = Color(0xFFE697AB);

  // On Accent Colors
  static const Color accentOn = Color(0xFF310000);

  // Surface Colors
  static const Color surface = Color(0xFFF7F7F7);
  static const Color surfaceLight = Color(0xFFF0F2F4);

  // Success & Failure Colors
  static const Color success = Color(0xFF06C270);
  static const Color failure = Color(0xFFE6393E);

  // Text Colors
  static const Color textNeutral35 = Color(0xFF535252);
  static const Color titleNeutral5 = Color(0xFF111111);
  static const Color inactiveNeutral60 = Color(0xFF929090);
  static const Color disableNeutral80 = Color(0xFFC9C6C5);
  static const Color labelNeutral35 = Color(0xFF535252);

  // Additional Text Colors
  static const Color textDark = Color(0xFF212121);
  static const Color textGray = Color(0xFF666666);
  static const Color textLightGray = Color(0xFFA3A3A3);
  static const Color textLighterGray = Color(0xFFBDBDBD);
  static const Color textPaleGray = Color.fromRGBO(224, 224, 224, 1.0);
  static const Color textPalerGray = Color(0xFFEBEBEB);

  static const Color listItem = Color(0xFFF7F7FF);

  static const Color dividerColor = Color(0xFFE0E0E0);
}

List<ThemeData> getThemes(BuildContext context) {
  return [
    ThemeData(
      fontFamily: "Graphik",
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.primaryOn,
      dialogBackgroundColor: AppColors.primaryOn,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        surfaceTintColor: AppColors.primaryOn,
        shadowColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryOn,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.primaryOn,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.primaryOn,
        primaryContainer: AppColors.primaryLighter,
        onPrimaryContainer: AppColors.primaryOn,
        secondary: AppColors.accent,
        onSecondary: AppColors.accentOn,
        secondaryContainer: AppColors.surfaceLight,
        onSecondaryContainer: AppColors.surface,
        tertiary: AppColors.textPaleGray,
        onTertiary: AppColors.textDark,
        tertiaryContainer: AppColors.textLightGray,
        onTertiaryContainer: AppColors.textLighterGray,
        background: AppColors.primaryOn,
        onBackground: AppColors.titleNeutral5,
        onSurfaceVariant: AppColors.textGray,
        onInverseSurface: AppColors.textDark,
        inversePrimary: AppColors.primary,
      ),
      indicatorColor: AppColors.textDark,
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.transparent),
      unselectedWidgetColor: AppColors.textLightGray,
      canvasColor: AppColors.surfaceLight,
      cardColor: AppColors.primaryOn,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.primaryOn,
      ),
      cardTheme: CardTheme(
        color: AppColors.primaryOn,
        surfaceTintColor: AppColors.primaryOn,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.primary),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.primaryOn,
      ),
      sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        highlightColor: AppColors.primaryOn,
        splashColor: AppColors.primaryOn,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionHandleColor: AppColors.failure,
        selectionColor: AppColors.textPaleGray,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColors.textDark.withOpacity(0.5),
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.textDark.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textDark.withOpacity(0.5),
            width: 1,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.failure,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textDark.withOpacity(0.5),
            width: 1,
          ),
        ),
        errorStyle: const TextStyle(color: AppColors.failure),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 18),
      ),
    ),
    ThemeData(
      fontFamily: "Graphik",
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.primaryOn,
      dialogBackgroundColor: AppColors.primaryOn,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        surfaceTintColor: AppColors.primaryOn,
        shadowColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.primaryOn,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.primaryOn,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.primaryOn,
        primaryContainer: AppColors.primaryLighter,
        onPrimaryContainer: AppColors.primaryOn,
        secondary: AppColors.accent,
        onSecondary: AppColors.accentOn,
        secondaryContainer: AppColors.surfaceLight,
        onSecondaryContainer: AppColors.surface,
        tertiary: AppColors.textPaleGray,
        onTertiary: AppColors.textDark,
        tertiaryContainer: AppColors.textLightGray,
        onTertiaryContainer: AppColors.textLighterGray,
        background: AppColors.primaryOn,
        onBackground: AppColors.titleNeutral5,
        onSurfaceVariant: AppColors.textGray,
        onInverseSurface: AppColors.textDark,
        inversePrimary: AppColors.primary,
      ),
      indicatorColor: AppColors.textDark,
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.transparent),
      unselectedWidgetColor: AppColors.textLightGray,
      canvasColor: AppColors.surfaceLight,
      cardColor: AppColors.primaryOn,
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.primaryOn,
      ),
      cardTheme: CardTheme(
        color: AppColors.primaryOn,
        surfaceTintColor: AppColors.primaryOn,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 2,
      ),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.primary),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.primaryOn,
      ),
      sliderTheme: SliderThemeData(
        overlayShape: SliderComponentShape.noOverlay,
      ),
      buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        highlightColor: AppColors.primaryOn,
        splashColor: AppColors.primaryOn,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionHandleColor: AppColors.failure,
        selectionColor: AppColors.textPaleGray,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColors.textDark.withOpacity(0.5),
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColors.textDark.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textDark.withOpacity(0.5),
            width: 1,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.failure,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textDark.withOpacity(0.5),
            width: 1,
          ),
        ),
        errorStyle: const TextStyle(color: AppColors.failure),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 18),
      ),
    ),
  ];
}
