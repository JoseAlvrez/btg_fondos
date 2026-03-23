// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/molecules/bgt_metric_card.dart';
import 'package:flutter/material.dart';

class BtgSummaryRow extends StatelessWidget {
  final int total;
  final int subscribed;

  const BtgSummaryRow({super.key, required this.total, required this.subscribed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    final spacing = isMobile ? 10.0 : 16.0;

    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: BgtMetricCard(
              title: 'Total fondos', 
              value: '$total',
              valueColor: BtgColors.onSurface,
              bgColor: BtgColors.surfaceContainerLowest,
            ) 
          ),
          SizedBox(width: spacing),
          Expanded(
            child: BgtMetricCard(
              title: 'Portafolio Activo', 
              value: '$subscribed',
              valueColor: BtgColors.primary,
              bgColor: BtgColors.surfaceContainerLow,
              badgeText: 'Suscritos',
              badgeTextColor: BtgColors.primary,
              badgeBgColor: BtgColors.primary.withOpacity(0.15),
            )
          ),
          SizedBox(width: spacing),
          Expanded(
            child: BgtMetricCard(
              title: 'Oportunidades', 
              value: '${total -subscribed}',
              valueColor: BtgColors.secondary,
              bgColor: BtgColors.surfaceContainerLow,
              badgeText: 'Disponibles',
              badgeTextColor: BtgColors.secondary,
              badgeBgColor: BtgColors.secondary.withOpacity(0.15),
            )
          ),
        ],
      ),
    );
  }
}
