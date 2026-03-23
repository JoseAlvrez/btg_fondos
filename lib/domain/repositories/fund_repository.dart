import 'package:btg_fondos/domain/entities/fund_entity.dart';

abstract class FundRepository {
  Future<List<FundEntity>> getFunds();
}