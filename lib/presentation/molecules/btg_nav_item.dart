// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class BtgNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isDestructive;
  final VoidCallback onTap;

  const BtgNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    this.isDestructive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);
    
    final color = isDestructive
        ? BtgColors.error
        : (isSelected ? BtgColors.primary : BtgColors.onSurfaceVariant);
    
    final paddingH = isMobile ? 12.0 : 16.0;
    final paddingV = isMobile ? 10.0 : 12.0;
    final borderRadius = isMobile ? 8.0 : 10.0;
    final iconSize = isMobile ? 18.0 : (isTablet ? 19.0 : 20.0);
    final spacing = isMobile ? 10.0 : 12.0;
    final fontSize = isMobile ? 13.0 : 14.0;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        decoration: BoxDecoration(
          color: isSelected
              ? BtgColors.surfaceContainerLowest
              : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: iconSize),
            SizedBox(width: spacing),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: fontSize,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
