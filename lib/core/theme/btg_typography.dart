import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/widgets/enums/btg_text_variant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtgTypography {
  static TextStyle getStyle(BtgTextVariant variant) {
    switch (variant) {
      case BtgTextVariant.displayLarge:
        return GoogleFonts.barlow(
          fontSize: 48,
          fontWeight: FontWeight.w900,
          letterSpacing: -1.5,
          height: 1,
          color: BtgColors.onSurface,
        );
      case BtgTextVariant.displayMedium:
        return GoogleFonts.barlow(
          fontSize: 32,
          fontWeight: FontWeight.w900,
          letterSpacing: -1.0,
          height: 1,
          color: BtgColors.onSurface,
        );
      case BtgTextVariant.displaySmall:
        return GoogleFonts.barlow(
          fontSize: 20,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
          height: 1,
          color: BtgColors.onSurface,
        );

      case BtgTextVariant.headlineLarge:
        return GoogleFonts.publicSans(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: BtgColors.onSurface,
        );
      case BtgTextVariant.headlineMedium:
        return GoogleFonts.publicSans(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: BtgColors.onSurface,
        );
      case BtgTextVariant.headlineSmall:
        return GoogleFonts.publicSans(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: BtgColors.onSurface,
        );

      case BtgTextVariant.titleLarge:
        return GoogleFonts.publicSans(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          height: 1.2,
          color: BtgColors.onSurface,
        );
      case BtgTextVariant.titleMedium:
        return GoogleFonts.publicSans(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: BtgColors.onSurface,
        );
      case BtgTextVariant.titleSmall:
        return GoogleFonts.publicSans(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: BtgColors.onSurface,
        );

      case BtgTextVariant.bodyLarge:
        return GoogleFonts.publicSans(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: BtgColors.onSurface,
        );
      case BtgTextVariant.bodyMedium:
        return GoogleFonts.publicSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: BtgColors.onSurface,
        );
      case BtgTextVariant.bodySmall:
        return GoogleFonts.publicSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: BtgColors.onSurfaceVariant,
        );

      case BtgTextVariant.labelLarge:
        return GoogleFonts.publicSans(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: BtgColors.onSurfaceVariant,
        );
      case BtgTextVariant.labelMedium:
        return GoogleFonts.publicSans(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          color: BtgColors.onSurfaceVariant,
        );
      case BtgTextVariant.labelSmall:
        return GoogleFonts.publicSans(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 1,
          color: BtgColors.onSurfaceVariant,
        );

      case BtgTextVariant.amountLarge:
        return GoogleFonts.barlow(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: BtgColors.onSurface,
        );
      case BtgTextVariant.amountMedium:
        return GoogleFonts.barlow(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          letterSpacing: -0.5,
          color: BtgColors.onSurface,
        );

      case BtgTextVariant.navLabel:
        return GoogleFonts.publicSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: BtgColors.onSurfaceVariant,
        );
      case BtgTextVariant.navLabelSelected:
        return GoogleFonts.publicSans(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: BtgColors.primary,
        );
    }
  }
}