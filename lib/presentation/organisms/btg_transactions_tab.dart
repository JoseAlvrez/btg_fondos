// ignore_for_file: deprecated_member_use

import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/molecules/btg_empty_state.dart';
import 'package:btg_fondos/presentation/molecules/btg_transaction_item.dart';
import 'package:btg_fondos/presentation/molecules/btg_transaction_metric_card.dart';
import 'package:btg_fondos/presentation/providers/user_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BtgTransactionsTab extends ConsumerWidget {
  const BtgTransactionsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(
      userAccountProvider.select((s) => s.transactions),
    );

    if (transactions.isEmpty) {
      return const BtgEmptyState(
        icon: Icons.receipt_long_outlined,
        title: 'Sin transacciones aún',
        subtitle: 'Las suscripciones y cancelaciones aparecerán aquí',
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;
        final isMobile = ResponsiveUtils.isMobileWidth(availableWidth);
        final isTablet = ResponsiveUtils.isTabletWidth(availableWidth);

        final padding = ResponsiveUtils.contentPadding(availableWidth);

        final metricsSpacing = isMobile ? 10.0 : 16.0;
        final sectionSpacing = isMobile ? 20.0 : 32.0;
        final titleFontSize = isMobile ? 16.0 : (isTablet ? 18.0 : 20.0);
        final spacingTitleList = isMobile ? 12.0 : 16.0;
        final listRadius = isMobile ? 16.0 : 24.0;

        final fmt = NumberFormat('#,##0', 'es_CO');
        final totalSub = transactions
            .where((t) => t.isSubscription)
            .fold(0.0, (s, t) => s + t.amount);
        final totalCan = transactions
            .where((t) => !t.isSubscription)
            .fold(0.0, (s, t) => s + t.amount);

        return SingleChildScrollView(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: BtgTransactionMetricCard(
                      label: 'Total inventario',
                      value: 'COP \$${fmt.format(totalSub)}',
                      iconData: Icons.account_balance_wallet_outlined,
                      iconColor: BtgColors.primary,
                    ),
                  ),
                  SizedBox(width: metricsSpacing),
                  Expanded(
                    child: BtgTransactionMetricCard(
                      label: 'Total reintegrado',
                      value: 'COP \$${fmt.format(totalCan)}',
                      iconData: Icons.payment_outlined,
                      iconColor: BtgColors.secondary,
                    ),
                  ),
                ],
              ),
               SizedBox(height: sectionSpacing),

              Text(
                'Historial de transacciones',
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: BtgColors.onSurface,
                ),
              ),
              SizedBox(height: spacingTitleList),

              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: BtgColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(listRadius),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BtgTransactionItem(transaction: transactions[index]);
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: BtgColors.outlineVariant.withOpacity(0.15),
                  ),
                  itemCount: transactions.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
