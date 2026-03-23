import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/entities/transaction_entity.dart';
import 'package:btg_fondos/domain/enums/transaction_type.dart';
import 'package:btg_fondos/domain/usecases/results/cancel_fund_result.dart';
import 'package:uuid/uuid.dart';

class CancelFundUsecase {
  const CancelFundUsecase();

  static const _uuid = Uuid();

  CancelFundResult call({
    required FundEntity fund,
    required double currentBalance,
  }) {
    return CancelFundResult(
      newBalance: currentBalance + fund.minimumAmount, 
      transaction: TransactionEntity(
        id: _uuid.v4(), 
        fundId: fund.id, 
        fundName: fund.name, 
        type: TransactionType.cancellation, 
        amount: fund.minimumAmount, 
        date: DateTime.now()
      )
    );
  }

}