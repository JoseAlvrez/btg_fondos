// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BtgMobileBalanceChip extends StatelessWidget {
  final double balance;

  const BtgMobileBalanceChip({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    final formatter = NumberFormat('#,##0', 'es_CO');

    final paddingH = isMobile ? 8.0 : 10.0;
    final paddingV = isMobile ? 3.0 : 4.0;
    final marginV = isMobile ? 12.0 : 10.0;
    final borderRadius = isMobile ? 16.0 : 20.0;
    final iconSize = isMobile ? 11.0 : 13.0;
    final fontSize = isMobile ? 11.0 : 12.0;
    final spacing = isMobile ? 4.0 : 5.0;

    return Container(
      margin: EdgeInsets.symmetric(vertical: marginV),
      padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
      decoration: BoxDecoration(
        color: BtgColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: BtgColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.account_balance_wallet_outlined,
            size: iconSize,
            color: BtgColors.primary,
          ),
          SizedBox(width: spacing),
          BtgText(
            '\$${formatter.format(balance)}',
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: BtgColors.primary,
          ),
        ],
      ),
    );
  }
}
