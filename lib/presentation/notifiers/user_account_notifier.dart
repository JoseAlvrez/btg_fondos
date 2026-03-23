import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/enums/notification_method.dart';
import 'package:btg_fondos/domain/exceptions/insufficient_balance_exception.dart';
import 'package:btg_fondos/domain/usecases/cancel_fund_usecase.dart';
import 'package:btg_fondos/domain/usecases/params/subscribe_fund_params.dart';
import 'package:btg_fondos/domain/usecases/subscribe_fund_usecase.dart';
import 'package:btg_fondos/presentation/state/user_account_state.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserAccountNotifier extends StateNotifier<UserAccountState> {
  final SubscribeFundUsecase _subscribeFundUsecase;
  final CancelFundUsecase _cancelFundUsecase;

  UserAccountNotifier({
    required SubscribeFundUsecase subscribeFundUseCase,
    required CancelFundUsecase cancelFundUseCase,
  }) : _subscribeFundUsecase = subscribeFundUseCase,
       _cancelFundUsecase = cancelFundUseCase,
       super(const UserAccountState());

  Future<bool> subscribeFund(
    FundEntity fund,
    NotificationMethod notificationMethod,
  ) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = _subscribeFundUsecase(
        SubscribeFundParams(
          fund: fund,
          currentBalance: state.balance,
          notificationMethod: notificationMethod,
        ),
      );

      state = state.copyWith(
        balance: result.newBalance,
        subscribedFundIds: {...state.subscribedFundIds, fund.id},
        transactions: [result.transaction, ...state.transactions],
        isLoading: false,
      );

      return true;
    } on InsufficientBalanceException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
      return false;
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error inesperado. Por favor intente nuevamente',
      );
      return false;
    }
  }

  Future<void> cancelFund(FundEntity fund) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final result = _cancelFundUsecase(
        fund: fund,
        currentBalance: state.balance,
      );

      final updateIds = Set<String>.from(state.subscribedFundIds)
        ..remove(fund.id);
      
      state = state.copyWith(
        balance: result.newBalance,
        subscribedFundIds: updateIds,
        transactions: [result.transaction, ...state.transactions],
        isLoading: false
      );

    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Error al cancelar la suscripción',
      );
    }
  }

  void clearError() => state = state.copyWith(clearError: true);
}
