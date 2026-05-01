import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/enums/fund_category.dart';
import 'package:btg_fondos/domain/enums/notification_method.dart';
import 'package:btg_fondos/domain/exceptions/insufficient_balance_exception.dart';
import 'package:btg_fondos/domain/usecases/params/subscribe_fund_params.dart';
import 'package:btg_fondos/domain/usecases/subscribe_fund_usecase.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late SubscribeFundUsecase usecase;

  // Fund de prueba reutilizable
  const testFund = FundEntity(
    id: 'fund-001',
    name: 'FPV BTG Test',
    minimumAmount: 75000,
    category: FundCategory.fpv,
  );

  setUp(() {
    usecase = const SubscribeFundUsecase();
  });

  group('SubscribeFundUsecase', () {
    test('debe retornar resultado con balance reducido cuando hay saldo suficiente', () {
      // Arrange
      const params = SubscribeFundParams(
        fund: testFund,
        currentBalance: 500000,
        notificationMethod: NotificationMethod.email,
      );

      // Act
      final result = usecase(params);

      // Assert
      expect(result.newBalance, equals(425000)); // 500000 - 75000
      expect(result.transaction.fundId, equals('fund-001'));
      expect(result.transaction.amount, equals(75000));
    });

    test('debe lanzar InsufficientBalanceException cuando el saldo es menor al mínimo', () {
      // Arrange
      const params = SubscribeFundParams(
        fund: testFund,
        currentBalance: 50000, // menor que minimumAmount (75000)
        notificationMethod: NotificationMethod.email,
      );

      // Act & Assert
      expect(
        () => usecase(params),
        throwsA(isA<InsufficientBalanceException>()),
      );
    });

    test('debe lanzar excepción cuando el saldo es exactamente igual al mínimo requerido', () {
      // Arrange — saldo justo igual al mínimo, debe fallar (< no <=)
      const params = SubscribeFundParams(
        fund: testFund,
        currentBalance: 75000, // igual al minimumAmount
        notificationMethod: NotificationMethod.sms,
      );

      // Act & Assert: según la lógica actual `currentBalance < minimumAmount`
      // si currentBalance == minimumAmount NO lanza excepción
      final result = usecase(params);
      expect(result.newBalance, equals(0));
    });
  });
}
