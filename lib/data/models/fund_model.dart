import 'package:btg_fondos/domain/entities/fund_entity.dart';
import 'package:btg_fondos/domain/enums/fund_category.dart';

class FundModel {
  final String id;
  final String name;
  final double minimumAmount;
  final String category;

  const FundModel({
    required this.id,
    required this.name,
    required this.minimumAmount,
    required this.category,
  });

  factory FundModel.fromJson(Map<String, dynamic> json) {
    return FundModel(
      id: json['id'] as String,
      name: json['name'] as String,
      minimumAmount: (json['minimumAmount'] as num).toDouble(),
      category: json['category'] as String,
    );
  }

  FundEntity toEntity() {
    return FundEntity(
      id: id,
      name: name,
      minimumAmount: minimumAmount,
      category: category == 'FPV' ? FundCategory.fpv : FundCategory.fic,
    );
  }
}
