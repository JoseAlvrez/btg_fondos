import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:flutter/material.dart';

class BtgOptionText extends StatelessWidget {
  final String label;
  final String subtitle;

  const BtgOptionText({super.key, required this.label, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BtgText(
          label, 
          fontWeight: FontWeight.bold,
          fontSize: isMobile ? 14.0 : 16.0,
          color: BtgColors.onSurface,
        ),
        const SizedBox(height: 2),
        BtgText(
          subtitle, 
          fontWeight: FontWeight.w500,
          fontSize: isMobile ? 11.0 : 12.0,
          color: BtgColors.secondary,
          
        ),
      ],
    );
  }
}
