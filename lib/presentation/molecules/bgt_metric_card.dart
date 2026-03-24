// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/core/widgets/enums/btg_text_variant.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:flutter/material.dart';

class BgtMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  final Color bgColor;
  final String? badgeText;
  final Color? badgeTextColor;
  final Color? badgeBgColor;

  const BgtMetricCard({
    super.key,
    required this.title,
    required this.value,
    this.valueColor = BtgColors.onSurface,
    this.bgColor = BtgColors.surfaceContainerLowest,
    this.badgeText,
    this.badgeTextColor,
    this.badgeBgColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final cardPadding = isMobile ? 16.0 : 24.0;
    final cardRadius = isMobile ? 16.0 : 24.0;

    final badgePaddingH = isMobile ? 8.0 : 10.0;
    final badgePaddingV = isMobile ? 3.0 : 4.0;
    final badgeFontSize = isMobile ? 8.0 : 9.0;
    final badgeSpacing = isMobile ? 12.0 : 16.0;
    final badgePlaceholderHeight = isMobile ? 24.0 : 36.0;

    final titleFontSize = isMobile ? 11.0 : 13.0;

    final valueFontSize = isMobile ? 32.0 : (isTablet ? 40.0 : 48.0);
    final valueLetterSpacing = isMobile ? -0.5 : -1.5;

    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: BtgColors.outlineVariant.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (badgeText != null) ...[
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: badgePaddingH,
                vertical: badgePaddingV,
              ),
              decoration: BoxDecoration(
                color: badgeBgColor,
                borderRadius: BorderRadius.circular(999),
              ),
              child: BtgText(
                badgeText!.toUpperCase(),
                fontSize: badgeFontSize,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: badgeTextColor,
              )
            ),
            SizedBox(height: badgeSpacing),
          ] else ...[
            SizedBox(height: badgePlaceholderHeight),
          ],

          BtgText(
            title,
            fontSize: titleFontSize,
            fontWeight: FontWeight.w600,
            color: BtgColors.onSurfaceVariant,
          ),
          const SizedBox(height: 6),
          BtgText(
            value,
            variant: BtgTextVariant.display,
            fontSize: valueFontSize,
            fontWeight: FontWeight.w900,
            letterSpacing: valueLetterSpacing,
            height: 1,
            color: valueColor,
          ),
        ],
      ),
    );
  }
}
