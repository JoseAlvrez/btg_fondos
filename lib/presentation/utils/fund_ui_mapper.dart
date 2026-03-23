// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/domain/enums/fund_category.dart';
import 'package:btg_fondos/domain/enums/notification_method.dart';
import 'package:btg_fondos/domain/enums/transaction_type.dart';
import 'package:flutter/material.dart';

abstract class FundUiMapper {
  static String categoryLabel(FundCategory category) =>
      category == FundCategory.fpv ? 'FPV' : 'FIC';

  static Color categoryColor(FundCategory category) =>
      category == FundCategory.fpv ? BtgColors.primary : BtgColors.secondary;

  static Color categoryBgColor(FundCategory category) =>
      category == FundCategory.fpv ? BtgColors.primary.withOpacity(0.15) : BtgColors.secondary.withOpacity(0.10);

  static String transactionLabel(TransactionType type) =>
      type == TransactionType.subscription ? 'Suscripción' : 'Cancelación';

  static String notificationLabel(NotificationMethod method) =>
      method == NotificationMethod.email
      ? 'Notif. por email'
      : 'Notif. por SMS';

  static IconData notificationIcon(NotificationMethod method) =>
      method == NotificationMethod.email
      ? Icons.email_outlined
      : Icons.sms_outlined;
}
