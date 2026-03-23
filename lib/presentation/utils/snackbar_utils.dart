import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/molecules/btg_snackbar.dart';
import 'package:flutter/material.dart';

class SnackbarUtils {
  SnackbarUtils._();

  static void showError(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: BtgColors.error,
      iconData: Icons.error_outline_outlined,
    );
  }

  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: BtgColors.primary,
      iconData: Icons.check_circle_outline_outlined,
    );
  }

  static void _showSnackBar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    required IconData iconData,
  }) {
    
    final isMobile = ResponsiveUtils.isMobileWidth(MediaQuery.sizeOf(context).width);

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        BtgSnackbar(
          message: message,
          backgroundColor: backgroundColor,
          iconData: Icons.check_circle_outline,
          isMobile: isMobile,
        ),
      );
  }
}
