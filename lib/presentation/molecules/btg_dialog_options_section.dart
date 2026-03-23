import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/molecules/btg_option_card.dart';
import 'package:btg_fondos/presentation/molecules/models/btg_selection_option.dart';
import 'package:flutter/material.dart';

class BtgDialogOptionsSection<T> extends StatelessWidget {
  
  final List<BtgSelectionOption<T>> options;
  final VoidCallback onCancel;
  final void Function(T value) onSelect;

  const BtgDialogOptionsSection({
    super.key,
    required this.options,
    required this.onCancel,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    final sectionPadding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
        : const EdgeInsets.symmetric(horizontal: 32, vertical: 16);

    final spacingBetweenOptions = isMobile ? 10.0 : 16.0;

    return Padding(
      padding: sectionPadding,
      child: Column(
        children: [
          ...options.map(
            (option) => Padding(
              padding: EdgeInsetsGeometry.only(bottom: spacingBetweenOptions),
              child: BtgOptionCard<T>(
                option: option,
                onTap: () => onSelect(option.value),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: onCancel,
            child: const Text(
              'Cancelar',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: BtgColors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
