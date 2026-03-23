// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/presentation/atoms/btg_button.dart';
import 'package:btg_fondos/presentation/atoms/btg_category_badge.dart';
import 'package:btg_fondos/presentation/atoms/btg_status_badge.dart';
import 'package:btg_fondos/presentation/atoms/enums/btg_button_variant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BgtFundCard extends StatelessWidget {
  final FundEntity fund;
  final bool isSubscribed;
  final bool canAfford;
  final VoidCallback onSubscribe;
  final VoidCallback onCancel;

  const BgtFundCard({
    super.key,
    required this.fund,
    required this.isSubscribed,
    required this.canAfford,
    required this.onSubscribe,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final cardPadding = isMobile ? 16.0 : 24.0;
    final cardRadius = isMobile ? 16.0 : 24.0;

    final iconContainerSize = isMobile ? 40.0 : 48.0;
    final iconContainerRadius = isMobile ? 12.0 : 16.0;
    final iconSize = isMobile ? 20.0 : 26.0;

    final fundNameFontSize = isMobile ? 14.0 : (isTablet ? 15.0 : 17.0);
    final amountFontSize = isMobile ? 16.0 : (isTablet ? 18.0 : 20.0);
    final amountLabelFontSize = isMobile ? 9.0 : 10.0;

    final amountContainerPadding = isMobile ? 12.0 : 16.0;
    final amountContainerRadius = isMobile ? 12.0 : 16.0;

    final spacingAfterIcon = isMobile ? 14.0 : 20.0;
    final spacingAfterAmount = isMobile ? 14.0 : 20.0;

    final formatter = NumberFormat('#,##0', 'es_CO');
  
    return Container(
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: BtgColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: BtgColors.outlineVariant.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: BtgColors.onSurface.withOpacity(0.04),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: iconContainerSize,
                height: iconContainerSize,
                decoration: BoxDecoration(
                  color: isSubscribed
                      ? BtgColors.primary.withOpacity(0.08)
                      : BtgColors.secondary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(iconContainerRadius),
                ),
                child: Icon(
                  Icons.energy_savings_leaf,
                  color: isSubscribed ? BtgColors.primary : BtgColors.secondary,
                  size: iconSize,
                ),
              ),
              BtgStatusBadge(isSubscribed: isSubscribed),
            ],
          ),
          SizedBox(height: spacingAfterIcon),

          Text(
            fund.name,
            style: TextStyle(
              fontSize: fundNameFontSize,
              fontWeight: FontWeight.w800,
              height: 1.2,
              color: BtgColors.onSurface,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          BtgCategoryBadge(category: fund.category),

          const Spacer(),
          //const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(amountContainerPadding),
            decoration: BoxDecoration(
              color: BtgColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(amountContainerRadius),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MONTO MÍNIMO',
                  style: TextStyle(
                    fontSize: amountLabelFontSize,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: BtgColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'COP \$${formatter.format(fund.minimumAmount)}',
                  style: GoogleFonts.barlow(
                    fontSize: amountFontSize,
                    fontWeight: FontWeight.w900,
                    color: BtgColors.onSurface,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: spacingAfterAmount),

          if (isSubscribed)
            BtgButton(
              label: 'Cancelar suscripción',
              onPressed: onCancel,
              variant: BtgButtonVariant.outlined,
              fullWidth: true,
              small: true,
            )
          else
            BtgButton(
              label: canAfford ? 'Suscribirse' : 'Saldo insuficiente',
              onPressed: canAfford ? onSubscribe : null,
              variant: BtgButtonVariant.primary,
              fullWidth: true,
            ),
        ],
      ),
    );
  }
}
