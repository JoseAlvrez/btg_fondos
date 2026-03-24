import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/atoms/btg_notification_icon.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:flutter/material.dart';

class BtgDialogHeaderSection extends StatelessWidget {
  final String title;
  final String content;

  const BtgDialogHeaderSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    final padding = isMobile
        ? const EdgeInsets.only(top: 28, left: 20, right: 20, bottom: 16)
        : const EdgeInsets.only(top: 40, left: 23, right: 23, bottom: 20);

    final titleFontSize = isMobile ? 20.0 : 24.0;
    final contentFontSize = isMobile ? 13.0 : 14.0;
    final spacingAfterIcon = isMobile ? 16.0 : 24.0;

    return Padding(
      padding: padding,
      child: Column(
        children: [
          const BtgNotificationIcon(),
          SizedBox(height: spacingAfterIcon),
          BtgText(
            title,
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: BtgColors.onSurface,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          BtgText(
            content,
            fontSize: contentFontSize,
            fontWeight: FontWeight.w500,
            color: BtgColors.secondary,
            height: 1.5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
