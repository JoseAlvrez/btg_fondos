// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class BtgNotificationIcon extends StatelessWidget {
  const BtgNotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    final containerSize = isMobile ? 52.0 : 64.0;
    final iconSize = isMobile ? 26.0 : 32.0;
    
    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: BtgColors.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.notifications_active_outlined,
        color: BtgColors.primary,
        size: iconSize,
      ),
    );
  }
}
