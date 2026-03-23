

import 'package:btg_fondos/data/datasources/btg_fund_local_datasource.dart';
import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/repositories/fund_repository.dart';

class FundRepositoryImpl implements FundRepository {
  final BtgFundLocalDatasource _dataSource;

  const FundRepositoryImpl(this._dataSource);

  @override
  Future<List<FundEntity>> getFunds() async {
    final models = await _dataSource.getFunds();
    return models.map((model) => model.toEntity()).toList();
  }
}