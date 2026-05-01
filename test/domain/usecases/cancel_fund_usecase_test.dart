import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/enums/fund_category.dart';
import 'package:btg_fondos/domain/enums/transaction_type.dart';
import 'package:btg_fondos/domain/usecases/cancel_fund_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CancelFundUsecase usecase;

  const testFund = FundEntity(
    id: 'fund-001',
    name: 'FPV BTG Test',
    minimumAmount: 75000,
    category: FundCategory.fpv,
  );

  setUp(() {
    usecase = const CancelFundUsecase();
  });

  group('CancelFundUsecase', () {
    test('debe retonar le balance restaurado al cancelar', () {
      //Arrange
      const currentBalance = 425000.0;  // balance luego de haber suscrito

      //Act
      final result = usecase(fund: testFund,  currentBalance: currentBalance);

      //Assert
      expect(result.newBalance, equals(500000));  //425000 + 75000 -> 500000
    });

    test('la transacción generada debe ser de tipo cancellation', () {
      //Arrange
      const currentBalance = 425000.0;

      //Act
      final result = usecase(fund: testFund, currentBalance: currentBalance);

      //Assert
      expect(result.transaction.type, equals(TransactionType.cancellation));
      expect(result.transaction.fundId, equals('fund-001'));
      expect(result.transaction.amount, equals(75000));
    });

    test('no debe lanzar excepción con balance en  cero', () {
      //Arrange
      const currentBalance = 0.0;

      //Act
      final result = usecase(fund:  testFund, currentBalance: currentBalance);

      //Assert
      expect(result.newBalance, equals(75000));  //0 + 75000 -> 75000
    });
  });
}
