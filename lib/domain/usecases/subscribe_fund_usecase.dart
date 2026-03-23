import 'package:btg_fondos/domain/entities/transaction_entity.dart';
import 'package:btg_fondos/domain/enums/transaction_type.dart';
import 'package:btg_fondos/domain/exceptions/insufficient_balance_exception.dart';
import 'package:btg_fondos/domain/usecases/params/subscribe_fund_params.dart';
import 'package:btg_fondos/domain/usecases/results/subscribe_fund_result.dart';
import 'package:uuid/uuid.dart';

class SubscribeFundUsecase {
  const SubscribeFundUsecase();

  static const _uuid = Uuid();

  SubscribeFundResult call(SubscribeFundParams params) {
    if (params.currentBalance < params.fund.minimumAmount) {
      throw InsufficientBalanceException(
        message:
            'No tiene saldo suficiente. '
            'Necesita \$${params.fund.minimumAmount.toStringAsFixed(0)} '
            'y dispone de \$${params.currentBalance.toStringAsFixed(0)}.',
      );
    }

    return SubscribeFundResult(
      newBalance: params.currentBalance - params.fund.minimumAmount,
      transaction: TransactionEntity(
        id: _uuid.v4(),
        fundId: params.fund.id,
        fundName: params.fund.name,
        type: TransactionType.subscription,
        amount: params.fund.minimumAmount,
        date: DateTime.now(),
        notificationMethod: params.notificationMethod,
      ),
    );
  }
}
