import 'package:btg_fondos/domain/entities/transaction_entity.dart';

class SubscribeFundResult {
  final double newBalance;
  final TransactionEntity transaction;

  const SubscribeFundResult({
    required this.newBalance,
    required this.transaction,
  });
}
