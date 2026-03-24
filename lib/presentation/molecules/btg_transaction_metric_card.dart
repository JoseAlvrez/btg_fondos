// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/core/widgets/enums/btg_text_variant.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:flutter/material.dart';

class BtgTransactionMetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData iconData;
  final Color iconColor;

  const BtgTransactionMetricCard({
    super.key,
    required this.label,
    required this.value,
    required this.iconData,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final cardPadding = isMobile ? 16.0 : 24.0;
    final cardRadius = isMobile ? 14.0 : 20.0;
    final labelFontSize = isMobile ? 11.0 : 13.0;
    final iconSize = isMobile ? 16.0 : 20.0;
    final spacingLabelValue = isMobile ? 10.0 : 16.0;
    final valueFontSize = isMobile ? 20.0 : (isTablet ? 24.0 : 28.0);
    final valueLetterSpacing = isMobile ? -0.2 : -0.5;

    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: BtgColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: BtgColors.outlineVariant.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: BtgColors.onSurface.withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BtgText(
                label,
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.w600,
                  color: BtgColors.secondary,

              ),
              Icon(iconData, color: iconColor, size: iconSize),
            ],
          ),
          SizedBox(height: spacingLabelValue),
          BtgText(
            value,
            variant: BtgTextVariant.display,
            fontSize: valueFontSize,
            fontWeight: FontWeight.w900,
            color: BtgColors.onSurface,
            letterSpacing: valueLetterSpacing,
          )
        ],
      ),
    );
  }
}
