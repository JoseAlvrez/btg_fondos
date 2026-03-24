import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/widgets/enums/btg_text_variant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BtgText extends StatelessWidget {
  final String text;
  final BtgTextVariant variant;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;

  const BtgText(
    this.text, {
    super.key,
    this.variant = BtgTextVariant.standard,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.height,
  });

  @override
  Widget build(BuildContext context) {

    final Color finalColor = color ?? BtgColors.onSurface;

    final TextStyle finalStyle = variant == BtgTextVariant.display
        ? GoogleFonts.barlow(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: finalColor,
            letterSpacing: letterSpacing,
            height: height,
          )
        : TextStyle(
            fontFamily: 'Public Sans',
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: finalColor,
            letterSpacing: letterSpacing,
            height: height,
          );

    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: finalStyle,
    );
  }
}
