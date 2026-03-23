// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/molecules/btg_bottom_accent_bar.dart';
import 'package:btg_fondos/presentation/molecules/btg_dialog_header_section.dart';
import 'package:btg_fondos/presentation/molecules/btg_dialog_options_section.dart';
import 'package:btg_fondos/presentation/molecules/models/btg_selection_option.dart';
import 'package:flutter/material.dart';

class BtgSelectionDialog<T> extends StatelessWidget {
  final String title;
  final String content;
  final List<BtgSelectionOption<T>> options;

  const BtgSelectionDialog({
    super.key,
    required this.title,
    required this.content,
    required this.options,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String content,
    required List<BtgSelectionOption<T>> options,
  }) {
    return showDialog<T>(
      context: context,
      barrierColor: BtgColors.onSurface.withOpacity(0.4),
      builder: (_) => BtgSelectionDialog<T>(
        title: title,
        content: content,
        options: options,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final borderRadius = isMobile ? 20.0 : (isTablet ? 28.0 : 32.0);

    return Dialog(
      insetPadding: ResponsiveUtils.dialogInsetPadding(screenWidth),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      backgroundColor: BtgColors.surfaceContainerLowest,
      clipBehavior: Clip.hardEdge,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ResponsiveUtils.modalWidth(screenWidth),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BtgDialogHeaderSection(title: title, content: content),
            BtgDialogOptionsSection<T>(
              options: options,
              onCancel: () => Navigator.pop(context),
              onSelect: (value) => Navigator.pop(context, value),
            ),
            const BtgBottomAccentBar()
          ],
        ),
      ),
    );
  }
}
