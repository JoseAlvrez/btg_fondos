// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/core/widgets/enums/btg_text_variant.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BtgSidebarBalance extends StatelessWidget {
  final double balance;

  const BtgSidebarBalance({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final formatter = NumberFormat('#,##0.00', 'es_CO');

    final paddingH = isMobile ? 12.0 : 16.0;
    final paddingV = isMobile ? 14.0 : 20.0;
    final borderRadius = isMobile ? 12.0 : 16.0;
    final labelFontSize = isMobile ? 9.0 : 10.0;
    final balanceFontSize = isMobile ? 18.0 : (isTablet ? 20.0 : 24.0);
    final balanceLetterSpacing = isMobile ? -0.5 : 1.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
      decoration: BoxDecoration(
        color: BtgColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: BtgColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BtgText(
            'SALDO DISPONIBLE',
            fontSize: labelFontSize,
            fontWeight: FontWeight.w600,
            letterSpacing: balanceLetterSpacing,
            color: BtgColors.onSurfaceVariant,
          ),
          const SizedBox(height: 6),
          BtgText(
            '\$${formatter.format(balance)}',
            variant: BtgTextVariant.display,
            fontSize: balanceFontSize,
            fontWeight: FontWeight.bold,
            letterSpacing: balanceLetterSpacing,
            color: BtgColors.primary,
          ),
        ],
      ),
    );
  }
}
