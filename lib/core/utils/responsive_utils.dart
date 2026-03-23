import 'package:btg_fondos/core/utils/responsive_breakpoints.dart';
import 'package:flutter/material.dart';

class ResponsiveUtils {
  // ── Detección por ancho numérico (para LayoutBuilder) ──────────────────

  /// Retorna true si el ancho corresponde a un dispositivo móvil.
  static bool isMobileWidth(double width) =>
      width < ResponsiveBreakpoints.mobile;

  /// Retorna true si el ancho corresponde a una tablet.
  static bool isTabletWidth(double width) =>
      width >= ResponsiveBreakpoints.tablet &&
      width < ResponsiveBreakpoints.wideDesktop;

  /// Retorna true si el ancho corresponde a desktop estándar.
  static bool isDesktopWidth(double width) =>
      width >= ResponsiveBreakpoints.tablet &&
      width < ResponsiveBreakpoints.wideDesktop;

  /// Retorna true si el ancho corresponde a pantalla ancha.
  static bool isWideDesktopWidth(double width) =>
      width >= ResponsiveBreakpoints.wideDesktop;

  // ── Detección por BuildContext (para widgets sin constraints)
  /// Retorna true si la pantalla es móvil según MediaQuery.
  static bool isMobile(BuildContext context) =>
      isMobileWidth(MediaQuery.sizeOf(context).width);

  /// Retorna true si la pantalla es tablet según MediaQuery.
  static bool isTablet(BuildContext context) =>
      isTabletWidth(MediaQuery.sizeOf(context).width);

  /// Retorna true si la pantalla es desktop según MediaQuery.
  static bool isDesktop(BuildContext context) =>
      isDesktopWidth(MediaQuery.sizeOf(context).width);

  // ── Columnas para grids (recibe el ancho del LayoutBuilder)
  static int gridColumns(double availableWidth) {
    if (availableWidth >= ResponsiveBreakpoints.wideDesktop) return 5;
    if (availableWidth >= ResponsiveBreakpoints.desktop) return 4;
    if (availableWidth >= ResponsiveBreakpoints.tablet) return 3;
    if (availableWidth >= ResponsiveBreakpoints.mobile) return 2;
    return 1;
  }

  // ── Padding horizontal del contenido
  /// Padding horizontal adaptado al tamaño de pantalla.
  /// Da más respiración en pantallas grandes.
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

  // ── Ancho del modal
  /// Ancho del modal según la pantalla.
  /// En móvil ocupa el 92% del ancho disponible.
  /// En tablet y desktop respeta el máximo definido.
  static double modalWidth(double screenWidth) {
    if (isMobileWidth(screenWidth)) return screenWidth * 0.92;
    return ResponsiveBreakpoints.maxModalWidth;
  }

  // ── Inset padding para diálogos
  /// EdgeInsets para el insetPadding de Dialog.
  /// En móvil márgenes pequeños; en desktop más amplios.
  static EdgeInsets dialogInsetPadding(double screenWidth) {
    if (isMobileWidth(screenWidth)) {
      return const EdgeInsets.symmetric(horizontal: 16, vertical: 32);
    }
    return const EdgeInsets.symmetric(horizontal: 40, vertical: 48);
  }

/// Margin del snackbar centrado según el ancho de pantalla.
/// En móvil ocupa casi todo el ancho.
/// En desktop se centra con un ancho máximo definido
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
