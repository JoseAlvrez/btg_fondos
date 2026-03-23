import 'package:btg_fondos/domain/entities/transaction_entity.dart';

class CancelFundResult {
  final double newBalance;
  final TransactionEntity transaction;

  const CancelFundResult({
    required this.newBalance,
    required this.transaction
  });

}