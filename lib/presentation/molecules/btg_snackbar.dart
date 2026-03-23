// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/presentation/atoms/btg_snackbar_content.dart';
import 'package:flutter/material.dart';

class BtgSnackbar extends SnackBar {
  BtgSnackbar({
    super.key,
    required String message,
    required Color backgroundColor,
    required IconData iconData,
    required bool isMobile,
  }) : super(
         behavior: SnackBarBehavior.floating,
         margin: EdgeInsets.only(
          bottom: isMobile ? 6.0 : 24.0,
          left: isMobile ? 12.0 : 16.0,
          right: isMobile ? 12.0 : 16.0,
         ),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(isMobile ? 12 : 16),
         ),
         backgroundColor: backgroundColor,
         elevation: 10,
         padding: EdgeInsets.zero,
         duration: const Duration(seconds: 3),
         content: BtgSnackbarContent(
           message: message,
           iconData: iconData,
           isMobile: isMobile,
         ),
       );
}
