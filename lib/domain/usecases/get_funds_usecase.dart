import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/repositories/fund_repository.dart';

class GetFundsUsecase {
  final FundRepository _repository;

  const GetFundsUsecase(this._repository);

  Future<List<FundEntity>> call() => _repository.getFunds();
}