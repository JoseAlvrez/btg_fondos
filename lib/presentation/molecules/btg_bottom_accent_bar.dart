// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class BtgBottomAccentBar extends StatelessWidget {
  const BtgBottomAccentBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    return Container(
      height: isMobile ? 4.0 : 6.0,
      decoration: BoxDecoration(
        color: BtgColors.primary.withOpacity(0.2)
      ),
    );
  }
}