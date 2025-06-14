import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_config.dart';
import 'size_config.dart';
import 'weight_config.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: lightSchema.onPrimary,
    dialogTheme: const DialogThemeData(backgroundColor: AppColor.background),
    popupMenuTheme: const PopupMenuThemeData(color: AppColor.background),
    dividerColor: lightSchema.onSurface,
    tabBarTheme: TabBarThemeData(
      unselectedLabelStyle: GoogleFonts.raleway(
        fontSize: 12,
        fontWeight: AppFontWeight.medium,
      ),
      unselectedLabelColor: lightSchema.onPrimary,
      labelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: AppFontWeight.bold,
      ),
      labelColor: AppColor.primary,
      tabAlignment: TabAlignment.center,
      indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
        width: 3.0,
        color: AppColor.primary,
      )),
      indicatorSize: TabBarIndicatorSize.label,
      dividerHeight: 0,
      labelPadding: Appsize.symetric(horizontal: 10, vertical: 0),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColor.background,
      behavior: SnackBarBehavior.fixed,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.background,
      selectedItemColor: AppColor.background,
      unselectedItemColor: AppColor.primary,
    ),
    colorScheme: lightSchema,
    iconTheme: IconThemeData(
      color: lightSchema.surface,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightSchema.onSurface,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColor.background,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: GoogleFonts.raleway(
        fontSize: 14,
        fontWeight: AppFontWeight.bold,
        color: lightSchema.surface,
      ),
      titleSpacing: 10,
      iconTheme: IconThemeData(color: lightSchema.surface),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: AppFontWeight.regular,
          color: AppColor.background,
        ),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.background,
        iconColor: AppColor.background,
        disabledBackgroundColor: lightSchema.onPrimary,
        disabledForegroundColor: AppColor.background,
        disabledIconColor: AppColor.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.raleway(
        fontSize: 26,
        fontWeight: AppFontWeight.bold,
        color: AppColor.dark,
      ),
      displayMedium: GoogleFonts.raleway(
        fontSize: 24,
        color: AppColor.dark,
        fontWeight: AppFontWeight.medium,
      ),
      displaySmall: GoogleFonts.raleway(
        fontSize: 24,
        fontWeight: AppFontWeight.regular,
        color: AppColor.dark,
      ),
      headlineLarge: GoogleFonts.raleway(
        fontSize: 20,
        color: AppColor.dark,
        fontWeight: AppFontWeight.bold,
      ),
      headlineMedium: GoogleFonts.raleway(
        fontSize: 20,
        fontWeight: AppFontWeight.medium,
        color: AppColor.dark,
      ),
      headlineSmall: GoogleFonts.raleway(
        fontSize: 20,
        fontWeight: AppFontWeight.regular,
        color: AppColor.dark,
      ),
      titleLarge: GoogleFonts.raleway(
        fontSize: 14,
        fontWeight: AppFontWeight.bold,
        color: AppColor.dark,
      ),
      titleMedium: GoogleFonts.raleway(
        fontSize: 14,
        fontWeight: AppFontWeight.medium,
        color: AppColor.dark,
      ),
      titleSmall: GoogleFonts.raleway(
        fontSize: 14,
        fontWeight: AppFontWeight.regular,
        color: AppColor.dark,
      ),
      bodyLarge: GoogleFonts.raleway(
        fontSize: 12,
        fontWeight: AppFontWeight.bold,
        color: AppColor.dark,
      ),
      bodyMedium: GoogleFonts.raleway(
        fontSize: 12,
        fontWeight: AppFontWeight.medium,
        color: AppColor.dark,
      ),
      bodySmall: GoogleFonts.raleway(
        fontSize: 12,
        fontWeight: AppFontWeight.regular,
        color: AppColor.dark,
      ),
      labelLarge: GoogleFonts.raleway(
        fontSize: 10,
        fontWeight: AppFontWeight.bold,
        color: AppColor.dark,
      ),
      labelMedium: GoogleFonts.raleway(
        fontSize: 10,
        fontWeight: AppFontWeight.medium,
        color: AppColor.dark,
      ),
      labelSmall: GoogleFonts.raleway(
        fontSize: 8,
        fontWeight: AppFontWeight.regular,
        color: AppColor.dark,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColor.dark,
    dialogTheme: const DialogThemeData(backgroundColor: AppColor.dark),
    popupMenuTheme: const PopupMenuThemeData(color: AppColor.background),
    dividerColor: AppColor.dark,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: AppColor.dark,
      behavior: SnackBarBehavior.fixed,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.dark,
      selectedItemColor: AppColor.primary,
      unselectedItemColor: lightSchema.surface,
    ),
    colorScheme: darkSchema,
    iconTheme: const IconThemeData(
      color: AppColor.background,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.dark,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: AppFontWeight.bold,
        color: AppColor.background,
      ),
      titleSpacing: 0,
      iconTheme: const IconThemeData(color: AppColor.background),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: AppFontWeight.regular,
          color: AppColor.background,
        ),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.background,
        iconColor: AppColor.background,
        disabledBackgroundColor: AppColor.background,
        disabledForegroundColor: AppColor.background,
        disabledIconColor: AppColor.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: AppFontWeight.bold,
        color: AppColor.background,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 30,
        color: AppColor.background,
        fontWeight: AppFontWeight.medium,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: AppFontWeight.regular,
        color: AppColor.background,
      ),
      headlineLarge: GoogleFonts.poppins(
        fontSize: 26,
        color: AppColor.background,
        fontWeight: AppFontWeight.bold,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: AppFontWeight.medium,
        color: AppColor.background,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: AppFontWeight.regular,
        color: AppColor.background,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: AppFontWeight.bold,
        color: AppColor.background,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: AppFontWeight.medium,
        color: AppColor.background,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: AppFontWeight.regular,
        color: AppColor.background,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: AppFontWeight.bold,
        color: AppColor.background,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: AppFontWeight.medium,
        color: AppColor.background,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: AppFontWeight.regular,
        color: AppColor.background,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: AppFontWeight.bold,
        color: AppColor.background,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: AppFontWeight.medium,
        color: AppColor.background,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: AppFontWeight.regular,
        color: AppColor.background,
      ),
    ),
  );

  static ColorScheme lightSchema = const ColorScheme(
    brightness: Brightness.light,
    primary: AppColor.primary, // Warna utama brand
    onPrimary: AppColor.background, // Teks/icon di atas warna primary

    secondary: AppColor.secondary, // Aksen / warna tombol sekunder
    onSecondary: AppColor.background, // Teks/icon di atas warna secondary

    surface: Colors.white, // Latar belakang page → sedikit redup dari #EAEAEA
    onSurface: AppColor.dark, // Warna teks utama di atas background

    error: AppColor.secondary, // Gunakan warna merah muda yang sama untuk error
    onError: AppColor.background, // Teks/icon di atas warna error

    // surface: Color(0xFFE0E0E0), // Latar belakang kartu/widget → lebih gelap dari background
    // onSurface: Color(0xFF252A34), // Teks/icon di atas surface

    // brightness: Brightness.light,
    // surface: AppColor.background,
    // onSurface: AppColor.backgroundVariant,
    // inverseSurface: AppColor.dark,
    // primary: AppColor.primary,
    // onPrimary: AppColor.primaryVariant,
    // secondary: AppColor.secondary,
    // onSecondary: AppColor.secondaryVariant,
    // error: AppColor.primary,
    // onError: Colors.white,
  );

  static ColorScheme darkSchema = const ColorScheme(
    brightness: Brightness.dark,
    surface: AppColor.dark,
    onSurface: AppColor.background,
    inverseSurface: AppColor.background,
    error: AppColor.primary,
    onError: Colors.white,
    primary: AppColor.primary,
    onPrimary: AppColor.primary,
    secondary: AppColor.secondary,
    onSecondary: AppColor.secondary,
  );
}
