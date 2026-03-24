// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:btg_fondos/presentation/atoms/enums/btg_button_variant.dart';
import 'package:flutter/material.dart';

class BtgButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final BtgButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  final bool fullWidth;
  final bool small;

  const BtgButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = BtgButtonVariant.primary,
    this.isLoading = false,
    this.icon,
    this.fullWidth = false,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    final isMobile = ResponsiveUtils.isMobileWidth(
      MediaQuery.sizeOf(context).width,
    );

    final padding = EdgeInsets.symmetric(
      horizontal: small ? (isMobile ? 16 : 24) : (isMobile ? 20 : 32),
      vertical: small ? (isMobile ? 8 : 12) : (isMobile ? 12 : 16),
    );

    final fontSize = small
        ? (isMobile ? 12.0 : 14.0)
        : (isMobile ? 14.0 : 16.0);

    final borderRadius = BorderRadius.circular(isMobile ? 10 : 12);

    Color getTextColor() {
      if (variant == BtgButtonVariant.outlined) return BtgColors.primary;
      if (variant == BtgButtonVariant.ghost) return BtgColors.primary;
      return isDisabled 
        ? BtgColors.onSurfaceVariant.withOpacity(0.38)
        : Colors.white;
    }

    final child = isLoading
        ? SizedBox(
            width: isMobile ? 16 : 18,
            height: isMobile ? 16 : 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: variant == BtgButtonVariant.outlined
                  ? BtgColors.primary
                  : Colors.white,
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: isMobile ? 16 : 18),
                SizedBox(width: isMobile ? 6 : 8),
              ],
              BtgText(
                label,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: getTextColor()
              ),
            ],
          );
    final button = switch (variant) {
      BtgButtonVariant.primary => ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: BtgColors.primary,
          foregroundColor: Colors.white,
          padding: padding,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
      BtgButtonVariant.outlined => OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          padding: padding,
          foregroundColor: BtgColors.onSurface,
          side: BorderSide(
            color: BtgColors.outlineVariant.withOpacity(0.20),
            width: 2,
          ),
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
      BtgButtonVariant.ghost => TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          padding: padding,
          foregroundColor: BtgColors.primary,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    };

    return fullWidth
      ? SizedBox(width: double.infinity, child: button)
      : button;
  }
}

