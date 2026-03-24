// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/domain/enums/fund_category.dart';
import 'package:btg_fondos/presentation/atoms/btg_text.dart';
import 'package:btg_fondos/presentation/utils/fund_ui_mapper.dart';
import 'package:flutter/material.dart';

class BtgCategoryBadge extends StatelessWidget {

  final FundCategory category;

  const BtgCategoryBadge({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    
    final color = FundUiMapper.categoryColor(category);

    final padding = isMobile
        ? const EdgeInsets.symmetric(horizontal: 7, vertical: 2)
        : const EdgeInsets.symmetric(horizontal: 9, vertical: 3);

    final fontSize = isMobile ? 10.0 : 11.0;
    final borderRadius = isMobile ? 16.0 : 20.0;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: FundUiMapper.categoryBgColor(category),
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: BtgText(
        FundUiMapper.categoryLabel(category),
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
        letterSpacing: 0.5,
      )
    );
  }
}
