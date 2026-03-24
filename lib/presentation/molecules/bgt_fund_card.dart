// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/core/widgets/enums/btg_text_variant.dart';
import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/presentation/atoms/btg_button.dart';
import 'package:btg_fondos/presentation/atoms/btg_category_badge.dart';
import 'package:btg_fondos/presentation/atoms/btg_status_badge.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:btg_fondos/presentation/atoms/enums/btg_button_variant.dart';
import 'package:flutter/material.dart';
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
    final isSmallMobile = ResponsiveUtils.isSmallMobileWith(screenWidth);
    final isMobileNor = ResponsiveUtils.isMobileWidth(screenWidth) && !isSmallMobile;
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final cardRadius = isSmallMobile ? 12.0 : (isMobileNor ? 16.0 : 24.0);
    final cardPadding = isSmallMobile ? 10.0 : (isMobileNor ? 16.0 : 24.0);
  
    final iconContainerSize = isSmallMobile ? 36.0 : (isMobileNor ? 40.0 : 48.0);
    final iconContainerRadius = isSmallMobile ? 10.0 : (isMobileNor ? 12.0 : 16.0);
    final iconSize = isSmallMobile ? 18.0 : (isMobileNor ? 20.0 : 26.0);

    final fundNameFontSize = isSmallMobile ? 11.0 : (isMobileNor ? 14.0 : (isTablet ? 15.0 : 17.0));
    final amountFontSize = isSmallMobile ? 14.0 : (isMobileNor ? 16.0 : (isTablet ? 18.0 : 20.0));
    final amountLabelFontSize = isMobileNor ? 9.0 : 10.0;
    final fundNameFontWeight = isSmallMobile ? FontWeight.w700 : FontWeight.w800;

    final amountContainerPadding = isSmallMobile ? 8.0 : (isMobileNor ? 12.0 : 16.0);
    final amountContainerRadius = isSmallMobile ? 10.0 : (isMobileNor ? 12.0 : 16.0);

    final spacingAfterIcon = isSmallMobile ? 8.0 : (isMobileNor ? 14.0 : 20.0);
    final spacingAfterAmount = isSmallMobile ? 8.0 : (isMobileNor ? 14.0 : 20.0);

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

          BtgText(
            fund.name,
            fontSize: fundNameFontSize,
            fontWeight: fundNameFontWeight,
            height: isSmallMobile ? 1.0 : (isMobileNor ? 1.1 : 1.2),
            color: BtgColors.onSurface,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),

          BtgCategoryBadge(category: fund.category),
          
          const Spacer(),

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

                BtgText(
                  'MONTO MÍNIMO',
                  fontSize: amountLabelFontSize,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  color: BtgColors.onSurfaceVariant,
                ),

                const SizedBox(height: 4),

                BtgText(
                  'COP \$${formatter.format(fund.minimumAmount)}',
                  variant: BtgTextVariant.display,
                  fontSize: amountFontSize,
                  fontWeight: FontWeight.w900,
                  color: BtgColors.onSurface,
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
              small: isSmallMobile || isMobileNor,
            ),
        ],
      ),
    );
  }
}
