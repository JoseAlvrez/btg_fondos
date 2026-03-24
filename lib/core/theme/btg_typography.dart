import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtgTypography {
  static double getResponsiveSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    final width = MediaQuery.sizeOf(context).width;
    if (ResponsiveUtils.isMobileWidth(width)) return mobile;
    if (ResponsiveUtils.isTabletWidth(width)) return tablet;
    return desktop;
  }

  static TextStyle getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
    bool useGoogleFonts = false,
  }) {
    final baseStyle = TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? BtgColors.onSurface,
      letterSpacing: letterSpacing,
      height: height,
    );

    return useGoogleFonts ? GoogleFonts.barlow(textStyle: baseStyle) : baseStyle;
  }
}
