import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/molecules/btg_nav_item.dart';
import 'package:btg_fondos/presentation/molecules/btg_sidebar_balance.dart';
import 'package:flutter/material.dart';

class BtgSidebar extends StatelessWidget {
  final double balance;
  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;

  const BtgSidebar({
    super.key,
    required this.balance,
    required this.selectedIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final sidebarWidth = isMobile ? 200.0 : (isTablet ? 220.0 : 250.0);
    final paddingH = isMobile ? 12.0 : 16.0;
    final paddingV = isMobile ? 16.0 : 24.0;
    final spacingAfterBalance = isMobile ? 20.0 : 32.0;
    final spacingBetweenItems = isMobile ? 4.0 : 8.0;

    return Container(
      width: sidebarWidth,
      color: BtgColors.surfaceContainerLow,
      padding: EdgeInsets.symmetric(vertical: paddingH, horizontal: paddingV),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BtgSidebarBalance(balance: balance),
          SizedBox(height: spacingAfterBalance),
          BtgNavItem(
            icon: Icons.account_balance_wallet_outlined, 
            label: 'Fondos', 
            isSelected: selectedIndex == 0, 
            onTap: () => onIndexChanged(0)
          ),
          SizedBox(height: spacingBetweenItems),
          BtgNavItem(
            icon: Icons.swap_horiz_rounded, 
            label: 'Transacciones', 
            isSelected: selectedIndex == 1, 
            onTap: () => onIndexChanged(1)
          ),
        ],
      ),
    );
  }
}
