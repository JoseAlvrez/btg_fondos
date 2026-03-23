// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class BtgSnackbarContent extends StatelessWidget {
  final String message;
  final IconData iconData;
  final bool isMobile;

  const BtgSnackbarContent({
    super.key,
    required this.message,
    required this.iconData,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final iconContainerSize = isMobile ? 28.0 : 32.0;
    final iconSize = isMobile ? 15.0 : 18.0;
    final fontSize = isMobile ? 13.0 : 14.0;
    final paddingH = isMobile ? 12.0 : 16.0;
    final paddingV = isMobile ? 10.0 : 14.0;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: isMobile ? double.infinity : 480.0,
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: paddingH,
          vertical: paddingV,
        ),
        child: Row(
          children: [
            Container(
              width: iconContainerSize,
              height: iconContainerSize,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white, size: iconSize),
            ),
            SizedBox(width: isMobile ? 10 : 14),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
