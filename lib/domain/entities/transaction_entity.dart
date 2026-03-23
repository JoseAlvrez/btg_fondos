import 'package:btg_fondos/domain/enums/notification_method.dart';
import 'package:btg_fondos/domain/enums/transaction_type.dart';
import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String id;
  final String fundId;
  final String fundName;
  final TransactionType type;
  final double amount;
  final DateTime date;
  final NotificationMethod? notificationMethod;

  const TransactionEntity({
    required this.id,
    required this.fundId,
    required this.fundName,
    required this.type,
    required this.amount,
    required this.date,
    this.notificationMethod,
  });

  bool get isSubscription => type == TransactionType.subscription;

  @override
  List<Object?> get props => [id, fundId, type, amount, date];
}
