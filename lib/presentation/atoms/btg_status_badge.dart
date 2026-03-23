// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class BtgStatusBadge extends StatelessWidget {
  final bool isSubscribed;

  const BtgStatusBadge({super.key, required this.isSubscribed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    final bgColor = isSubscribed
        ? BtgColors.primary.withOpacity(0.15)
        : BtgColors.secondary.withOpacity(0.10);

    final textColor = isSubscribed ? BtgColors.primary : BtgColors.secondary;

    final icon = isSubscribed
        ? Icons.check_circle
        : Icons.radio_button_unchecked;

    final label = isSubscribed ? 'Suscrito' : 'Disponible';

    final padding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 3)
        : const EdgeInsets.symmetric(horizontal: 12, vertical: 4);

    final fontSize = isMobile ? 11.0 : 12.0;
    final iconSize = isMobile ? 12.0 : 14.0;
    final spacing = isMobile ? 4.0 : 6.0;
    final borderRadius = isMobile ? 16.0 : 999.0;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: textColor),
          SizedBox(width: spacing),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
