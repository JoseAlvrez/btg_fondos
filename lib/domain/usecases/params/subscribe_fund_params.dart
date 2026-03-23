import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/enums/notification_method.dart';

class SubscribeFundParams {
  final FundEntity fund;
  final double currentBalance;
  final NotificationMethod notificationMethod;

  const SubscribeFundParams({
    required this.fund,
    required this.currentBalance,
    required this.notificationMethod,
  });
}
