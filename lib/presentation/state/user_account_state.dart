import 'package:btg_fondos/core/constants/app_constants.dart';
import 'package:btg_fondos/domain/entities/transaction_entity.dart';
import 'package:equatable/equatable.dart';

class UserAccountState extends Equatable {
  final double balance;
  final Set<String> subscribedFundIds;
  final List<TransactionEntity> transactions;
  final bool isLoading;
  final String? errorMessage;

  const UserAccountState({
    this.balance = AppConstants.initialBalance,
    this.subscribedFundIds = const {},
    this.transactions = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  bool isFundSubscribed(String fundId) => subscribedFundIds.contains(fundId);

  UserAccountState copyWith({
    double? balance,
    Set<String>? subscribedFundIds,
    List<TransactionEntity>? transactions,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false
  }) {
    return UserAccountState(
      balance: balance ?? this.balance,
      subscribedFundIds: subscribedFundIds ?? this.subscribedFundIds,
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => 
    [ balance, subscribedFundIds, transactions, isLoading, errorMessage];
}