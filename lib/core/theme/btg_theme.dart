// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class BtgTheme {
  BtgTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: BtgColors.surface,
      colorScheme: const ColorScheme.light(
        primary: BtgColors.primary,
        secondary: BtgColors.secondary,
        surface: BtgColors.surface,
        onSurface: BtgColors.onSurface,
        error: BtgColors.error,
      ),

      // Tipografía principal: Public Sans
      textTheme: GoogleFonts.publicSansTextTheme().copyWith(
        displayLarge: GoogleFonts.publicSans(
          letterSpacing: -0.02,
          color: BtgColors.onSurface,
          fontWeight: FontWeight.w700
        ),
        headlineMedium: GoogleFonts.publicSans(
          color: BtgColors.onSurface,
          fontWeight: FontWeight.w700
        ),
        titleMedium: GoogleFonts.publicSans(
          color: BtgColors.onSurface,
          fontWeight: FontWeight.w600, //Semibold
        ),
        bodyMedium: GoogleFonts.publicSans(
          color: BtgColors.onSurface,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: GoogleFonts.publicSans(
          color: BtgColors.onSurface,
          fontWeight: FontWeight.w500, // Medium
        ),
      ),
      cardTheme: CardThemeData(
        color: BtgColors.surfaceContainerLowest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: BtgColors.outlineVariant.withOpacity(0.15),
            width: 1
          )
        )
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: BtgColors.surface,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: BtgColors.onSurface),
        titleTextStyle: TextStyle(
          color: BtgColors.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          fontFamily: 'Public Sans'
        ), 
      ),
    );
  }
}
