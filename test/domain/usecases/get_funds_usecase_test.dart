import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/enums/fund_category.dart';
import 'package:btg_fondos/domain/repositories/fund_repository.dart';
import 'package:btg_fondos/domain/usecases/get_funds_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_funds_usecase_test.mocks.dart';

@GenerateMocks([FundRepository])
void main() {
  late GetFundsUsecase usecase;
  late MockFundRepository mockRepository;

  setUp(() {
    mockRepository = MockFundRepository();
    usecase = GetFundsUsecase(mockRepository);
  });

  group('GetFundsUsecase', () {
    final testFunds = [
      const FundEntity(
        id: 'fund-001',
        name: 'FPV BTG Test',
        minimumAmount: 75000,
        category: FundCategory.fpv,
      ),
      const FundEntity(
        id: 'fund-002',
        name: 'FIC BTG Test',
        minimumAmount: 100000,
        category: FundCategory.fic,
      ),
    ];

    test('debe retornar la lista de fondos del repositorio', () async {
      // Arrange: le dices al mock qué retornar cuando se llame getFunds()
      when(mockRepository.getFunds()).thenAnswer((_) async => testFunds);

      // Act
      final result = await usecase();

      // Assert
      expect(result, equals(testFunds));
      expect(result.length, equals(2));
      verify(mockRepository.getFunds()).called(1); // se llamó exactamente 1 vez
    });

    test('debe retornar lista vacía si el repositorio no tiene fondos', () async {
      // Arrange
      when(mockRepository.getFunds()).thenAnswer((_) async => []);

      // Act
      final result = await usecase();

      // Assert
      expect(result, isEmpty);
      verify(mockRepository.getFunds()).called(1);
    });

    test('debe propagar la excepción si el repositorio falla', () async {
      // Arrange
      when(mockRepository.getFunds()).thenThrow(Exception('Error de red'));

      // Act & Assert
      expect(() => usecase(), throwsException);
    });
  });
}
