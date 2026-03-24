// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/core/widgets/enums/btg_text_variant.dart';
import 'package:btg_fondos/presentation/atoms/btg_mobile_balance_chip.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:btg_fondos/presentation/providers/user_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BtgHeader extends ConsumerWidget implements PreferredSizeWidget {
  const BtgHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final balance = isMobile
        ? ref.watch(userAccountProvider.select((s) => s.balance))
        : null;

    final titleFontSize = isMobile ? 15.0 : (isTablet ? 16.0 : 18.0);
    final logoFontSize = isMobile ? 11.0 : 13.0;
    final logoPaddingH = isMobile ? 6.0 : 8.0;
    final logoPaddingV = isMobile ? 4.0 : 5.0;
    final logoRadius = isMobile ? 12.0 : 16.0;
    final spacingLogoTitle = isMobile ? 8.0 : 10.0;
    final actionsEndSpacing = isMobile ? 8.0 : 16.0;

    return AppBar(
      backgroundColor: BtgColors.surfaceContainerLowest,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: logoPaddingH,
              vertical: logoPaddingV,
            ),
            decoration: BoxDecoration(
              color: BtgColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(logoRadius),
            ),
            child: BtgText(
              'BTG', 
              color: BtgColors.primary,
              fontSize: logoFontSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(width: spacingLogoTitle),
          Flexible(
            child: BtgText(
              'Gestión de Fondos',
              color: BtgColors.onSurface,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w700,
              overflow: TextOverflow.ellipsis,
            ) 
          ),

        ],
      ),
      actions: [
        if(isMobile && balance != null)
          BtgMobileBalanceChip(balance: balance),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle_outlined),
          iconSize: isMobile ? 20.0 : 24.0,
          color: BtgColors.onSurfaceVariant,
        ),
        SizedBox(width: actionsEndSpacing),
      ],
    );
  }
}
