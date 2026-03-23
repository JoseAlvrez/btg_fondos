import 'package:btg_fondos/core/theme/btg_typography.dart';
import 'package:btg_fondos/core/widgets/enums/btg_text_variant.dart';
import 'package:flutter/material.dart';

class BtgText extends StatelessWidget {
  final String text;
  final BtgTextVariant variant;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final double? height;

  const BtgText(
    this.text,{
    super.key,
    required this.variant,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.height, this.letterSpacing, this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = BtgTypography.getStyle(variant);

    final resolvedStyle = baseStyle.copyWith(
      color: color ?? baseStyle.color,
      letterSpacing: letterSpacing,
      height: height ?? baseStyle.height,
      fontWeight: fontWeight
    );

    return Text(
      text,
      style: resolvedStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

