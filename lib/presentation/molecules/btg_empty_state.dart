import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:flutter/material.dart';

class BtgEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const BtgEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final padding = isMobile ? 24.0 : 48.0;
    final iconSize = isMobile ? 52.0 : (isTablet ? 62.0 : 72.0);
    final spacingAfterIcon = isMobile ? 14.0 : 20.0;
    final titleFontSize = isMobile ? 15.0 : (isTablet ? 16.0 : 18.0);
    final subtitleFontSize = isMobile ? 12.0 : 14.0;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize, color: BtgColors.outlineVariant),
            SizedBox(height: spacingAfterIcon),
            BtgText(
              title,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w600,
              color: BtgColors.onSurfaceVariant,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            BtgText(
              subtitle,
              fontSize: subtitleFontSize,
              color: BtgColors.onSurfaceVariant,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
