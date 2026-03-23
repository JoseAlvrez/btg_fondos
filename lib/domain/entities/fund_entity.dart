import 'package:btg_fondos/domain/enums/fund_category.dart';
import 'package:equatable/equatable.dart';

class FundEntity extends Equatable {
  final String id;
  final String name;
  final double minimumAmount;
  final FundCategory category;

  const FundEntity({
    required this.id,
    required this.name,
    required this.minimumAmount,
    required this.category,
  });

  String get categoryLabel => category == FundCategory.fpv ? 'FPV' : 'FIC';

  @override
  List<Object?> get props => [id, minimumAmount, category];
}
