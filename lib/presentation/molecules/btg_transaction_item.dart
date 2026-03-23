// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/domain/entities/transaction_entity.dart';
import 'package:btg_fondos/presentation/utils/fund_ui_mapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BtgTransactionItem extends StatelessWidget {
  final TransactionEntity transaction;

  const BtgTransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);
    final isTablet = ResponsiveUtils.isTabletWidth(screenWidth);

    final isSub = transaction.isSubscription;
    final amountFmt = NumberFormat('#,##0', 'es_CO');
    final dateFmt = DateFormat("dd 'de' MM yyyy, HH:mm", 'es_CO');

    final itemPadding = isMobile ? 12.0 : 24.0;
    final iconContainerSize = isMobile ? 34.0 : 48.0;
    final iconContainerRadius = isMobile ? 8.0 : 12.0;
    final iconSize = isMobile ? 16.0 : 24.0;
    final spacingIconText = isMobile ? 10.0 : 16.0;
    final fundNameFontSize = isMobile ? 23.0 : (isTablet ? 14.0 : 15.0);
    final badgeFontSize = isMobile ? 7.0 : 9.0;
    final dateFontSize = isMobile ? 10.0 : 12.0;
    final notifIconSize = isMobile ? 9.0 : 11.0;
    final notifFontSize = isMobile ? 9.0 : 11.0;
    final amountFontSize = isMobile ? 11.0 : (isTablet ? 15.0 : 18.0);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: BtgColors.surfaceContainerLowest,
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(itemPadding),
          child: Row(
            children: [
              Container(
                width: iconContainerSize,
                height: iconContainerSize,
                decoration: BoxDecoration(
                  color: isSub
                      ? BtgColors.error.withOpacity(0.1)
                      : BtgColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(iconContainerRadius),
                ),
                child: Icon(
                  isSub
                      ? Icons.trending_down_rounded
                      : Icons.trending_up_rounded,
                  color: isSub ? BtgColors.error : BtgColors.primary,
                  size: iconSize,
                ),
              ),
              SizedBox(width: spacingIconText),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.fundName,
                      style: TextStyle(
                        fontSize: fundNameFontSize,
                        fontWeight: FontWeight.w700,
                        color: BtgColors.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 5.0 : 8.0,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: isSub
                                ? BtgColors.error.withOpacity(0.1)
                                : BtgColors.secondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            FundUiMapper.transactionLabel(
                              transaction.type,
                            ).toLowerCase(),
                            style: TextStyle(
                              fontSize: badgeFontSize,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                              color: isSub
                                  ? BtgColors.error
                                  : BtgColors.secondary,
                            ),
                          ),
                        ),
                        SizedBox(width: isMobile ? 6.0 : 12.0),
                        Flexible(
                          child: Text(
                            dateFmt.format(transaction.date),
                            style: TextStyle(
                              fontSize: dateFontSize,
                              fontWeight: FontWeight.w500,
                              color: BtgColors.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    if (transaction.notificationMethod != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Row(
                          children: [
                            Icon(
                              FundUiMapper.notificationIcon(
                                transaction.notificationMethod!,
                              ),
                              size: notifIconSize,
                              color: BtgColors.onSurfaceVariant,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              FundUiMapper.notificationLabel(
                                transaction.notificationMethod!,
                              ),
                              style: TextStyle(
                                fontSize: notifFontSize,
                                color: BtgColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(width: isMobile ? 8.0 : 12.0),
              SizedBox(
                width: isMobile ? 100.0 : (isTablet ? 130.0 : 160.0),
                child: Text(
                  '${isSub ? '-' : '+'} COP \$${amountFmt.format(transaction.amount)}',
                  style: GoogleFonts.barlow(
                    fontSize: amountFontSize,
                    fontWeight: FontWeight.bold,
                    color: isSub ? BtgColors.error : BtgColors.primary,
                  ),
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
