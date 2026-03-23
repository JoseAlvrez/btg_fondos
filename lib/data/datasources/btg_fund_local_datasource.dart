import 'package:btg_fondos/data/models/fund_model.dart';

class BtgFundLocalDatasource {
  static const List<Map<String, dynamic>> _fundsJson = [
    {
      'id': '1',
      'name': 'FPV_BTG_PACTUAL_RECAUDADORA',
      'minimumAmount': 75000,
      'category': 'FPV',
    },
    {
      'id': '2',
      'name': 'FPV_BTG_PACTUAL_ECOPETROL',
      'minimumAmount': 125000,
      'category': 'FPV',
    },
    {
      'id': '3',
      'name': 'DEUDAPRIVADA',
      'minimumAmount': 50000,
      'category': 'FIC',
    },
    {
      'id': '4',
      'name': 'FDO-ACCIONES',
      'minimumAmount': 250000,
      'category': 'FIC',
    },
    {
      'id': '5',
      'name': 'FPV_BTG_PACTUAL_DINAMICA',
      'minimumAmount': 100000,
      'category': 'FPV',
    },
  ];

  Future<List<FundModel>> getFunds() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _fundsJson.map(FundModel.fromJson).toList();
  }
}
