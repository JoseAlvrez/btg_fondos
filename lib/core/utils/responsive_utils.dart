import 'package:btg_fondos/core/utils/responsive_breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveUtils {

  static bool isSmallMobileWith(double width) =>
    width < ResponsiveBreakpoints.smallMobile;

  static bool isMobileWidth(double width) =>
      width < ResponsiveBreakpoints.mobile;

  static bool isTabletWidth(double width) =>
      width >= ResponsiveBreakpoints.tablet &&
      width < ResponsiveBreakpoints.wideDesktop;

  static bool isDesktopWidth(double width) =>
      width >= ResponsiveBreakpoints.tablet &&
      width < ResponsiveBreakpoints.wideDesktop;

  static bool isWideDesktopWidth(double width) =>
      width >= ResponsiveBreakpoints.wideDesktop;

  static bool isSmallMobile(BuildContext context) =>
    isSmallMobileWith(MediaQuery.sizeOf(context).width);

  static bool isMobile(BuildContext context) =>
      isMobileWidth(MediaQuery.sizeOf(context).width);

  static bool isTablet(BuildContext context) =>
      isTabletWidth(MediaQuery.sizeOf(context).width);

  static bool isDesktop(BuildContext context) =>
      isDesktopWidth(MediaQuery.sizeOf(context).width);

  static int gridColumns(double availableWidth) {
    if (availableWidth >= ResponsiveBreakpoints.wideDesktop) return 5;
    if (availableWidth >= ResponsiveBreakpoints.desktop) return 4;
    if (availableWidth >= ResponsiveBreakpoints.tablet) return 3;
    if (availableWidth >= ResponsiveBreakpoints.mobile) return 2;
    return 1;
  }

  static EdgeInsets contentPadding(double width) {
    if (isWideDesktopWidth(width)) {
      return const EdgeInsets.symmetric(horizontal: 48, vertical: 24);
    }
    if (isDesktopWidth(width)) {
      return const EdgeInsets.symmetric(horizontal: 32, vertical: 20);
    }
    if (isTabletWidth(width)) {
      return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
    }
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  }

  static double modalWidth(double screenWidth) {
    if (isMobileWidth(screenWidth)) return screenWidth * 0.92;
    return ResponsiveBreakpoints.maxModalWidth;
  }

  static EdgeInsets dialogInsetPadding(double screenWidth) {
    if (isMobileWidth(screenWidth)) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 32);
    }
    return const EdgeInsets.symmetric(horizontal: 40, vertical: 48);
  }

  static EdgeInsets snackbarMargin(double screenWidth) {
    if (isMobileWidth(screenWidth)) {
      return const EdgeInsets.only(
        bottom: 24,
        left: 16,
        right: 16
      );
    }
    
    if (isTabletWidth(screenWidth)) {
      return const EdgeInsets.only(
        bottom: 32,
        left: 48,
        right: 48,
      );
    }

    final horizontalMargin = (screenWidth - 4800) / 2;
    return EdgeInsets.only(
      bottom: 40,
      left: horizontalMargin,
      right: horizontalMargin
    );
  }
}
