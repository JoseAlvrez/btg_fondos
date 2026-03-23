import 'package:btg_fondos/domain/usecases/cancel_fund_usecase.dart';
import 'package:btg_fondos/domain/usecases/subscribe_fund_usecase.dart';
import 'package:btg_fondos/presentation/notifiers/user_account_notifier.dart';
import 'package:btg_fondos/presentation/state/user_account_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final _subscribeFundUseCaseProvider = Provider<SubscribeFundUsecase>(
  (_) => const SubscribeFundUsecase(),
);

final _cancelFundUseCaseProvider = Provider<CancelFundUsecase>(
  (_) => const CancelFundUsecase(),
);

final userAccountProvider =
    StateNotifierProvider<UserAccountNotifier, UserAccountState>(
      (ref) => UserAccountNotifier(
        subscribeFundUseCase: ref.watch(_subscribeFundUseCaseProvider),
        cancelFundUseCase: ref.watch(_cancelFundUseCaseProvider),
      ),
    );
