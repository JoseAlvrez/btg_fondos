import 'package:btg_fondos/data/datasources/btg_fund_local_datasource.dart';
import 'package:btg_fondos/data/repositories/fund_repository_impl.dart';
import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/repositories/fund_repository.dart';
import 'package:btg_fondos/domain/usecases/get_funds_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fundLocalDataSourceProvider = Provider<BtgFundLocalDatasource>(
  (_) => BtgFundLocalDatasource(),
);

final fundRepositoryProvider = Provider<FundRepository>(
  (ref) => FundRepositoryImpl(ref.watch(fundLocalDataSourceProvider))
);

final getFundsUseCaseProvider = Provider<GetFundsUsecase>(
  (ref) => GetFundsUsecase(ref.watch(fundRepositoryProvider))
);

final fundsProvider = FutureProvider<List<FundEntity>>((ref) {
  return ref.watch(getFundsUseCaseProvider).call();
});
