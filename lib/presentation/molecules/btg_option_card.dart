import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/atoms/btg_option_icon.dart';
import 'package:btg_fondos/presentation/molecules/btg_option_text.dart';
import 'package:btg_fondos/presentation/molecules/models/btg_selection_option.dart';
import 'package:flutter/material.dart';

class BtgOptionCard<T> extends StatelessWidget {
  final BtgSelectionOption<T> option;
  final VoidCallback onTap;

  const BtgOptionCard({super.key, required this.option, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    final cardPadding = isMobile
      ? const EdgeInsets.all(14)
      : const EdgeInsets.all(20);
    final borderRadius = isMobile ? 12.0 : 16.0;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: cardPadding,
        decoration: BoxDecoration(
          color: BtgColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            BtgOptionIcon(icon: option.icon),
            const SizedBox(width: 16),
            Expanded(
              child: BtgOptionText(
                label: option.label, 
                subtitle: option.subtitle
              ), 
            ),
            const Icon(
              Icons.chevron_right_outlined,
              color: BtgColors.outlineVariant,
            )
          ],
        ),
      ),
    );
  }
}
