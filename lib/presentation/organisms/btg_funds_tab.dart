import 'package:btg_fondos/core/theme/btg_colors.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/domain/enums/notification_method.dart';
import 'package:btg_fondos/presentation/molecules/bgt_fund_card.dart';
import 'package:btg_fondos/presentation/molecules/btg_selection_dialog.dart';
import 'package:btg_fondos/presentation/molecules/models/btg_selection_option.dart';
import 'package:btg_fondos/presentation/organisms/btg_summary_row.dart';
import 'package:btg_fondos/presentation/providers/funds_provider.dart';
import 'package:btg_fondos/presentation/providers/user_account_provider.dart';
import 'package:btg_fondos/presentation/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BtgFundsTab extends ConsumerWidget {
  const BtgFundsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fundsAsync = ref.watch(fundsProvider);
    final accountState = ref.watch(userAccountProvider);

    return fundsAsync.when(
      loading: () => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: BtgColors.primary),
            SizedBox(height: 16),
            Text(
              'Cargando fondos...',
              style: TextStyle(color: BtgColors.onSurfaceVariant),
            ),
          ],
        ),
      ),
      error: (e, _) => Center(
        child: Text(
          'Error: $e',
          style: const TextStyle(color: BtgColors.error),
        ),
      ),
      data: (funds) => LayoutBuilder(
        builder: (context, constraints) {
          final availableWidth = constraints.maxWidth;
          final isMobile = ResponsiveUtils.isMobileWidth(availableWidth);
          final isTablet = ResponsiveUtils.isTabletWidth(availableWidth);

          final columns = ResponsiveUtils.gridColumns(constraints.maxWidth);
          final padding = ResponsiveUtils.contentPadding(constraints.maxWidth);

          final cardExtent = isMobile ? 320.0 : (isTablet ? 380.0 : 360.0);
          final gridSpacing = isMobile ? 12.0 : 16.0;
          final sectionSpacing = isMobile ? 14.0 : 20.0;
          final titleFontSize = isMobile ? 15.0 : 18.0;

          return SingleChildScrollView(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BtgSummaryRow(
                  total: funds.length,
                  subscribed: accountState.subscribedFundIds.length,
                ),
                SizedBox(height: sectionSpacing),
                Text(
                  'Fondos disponibles',
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w700,
                    color: BtgColors.onSurface,
                  ),
                ),
                SizedBox(height: isMobile ? 10.0 : 12.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: gridSpacing,
                    mainAxisSpacing: gridSpacing,
                    mainAxisExtent: cardExtent,
                  ),
                  itemCount: funds.length,
                  itemBuilder: (_, i) {
                    final fund = funds[i];
                    return BgtFundCard(
                      fund: fund,
                      isSubscribed: accountState.isFundSubscribed(fund.id),
                      canAfford: accountState.balance >= fund.minimumAmount,
                      onSubscribe: () async {
                        final method = await BtgSelectionDialog.show<NotificationMethod>(
                              context: context,
                              title: 'Método de notificación',
                              content: '¿Cómo deseas recibir la notificación?',
                              options: [
                                BtgSelectionOption(
                                  label: 'Email', 
                                  subtitle: 'Reciba un correo detallado', 
                                  icon: Icons.email_outlined, 
                                  value: NotificationMethod.email
                                ),
                                BtgSelectionOption(
                                  label: 'SMS', 
                                  subtitle: 'Notificación rápida al móvil', 
                                  icon: Icons.sms_outlined, 
                                  value: NotificationMethod.sms
                                )
                              ] 
                            );

                        if (method != null) {
                          final sucess = await ref
                              .read(userAccountProvider.notifier)
                              .subscribeFund(fund, method);
                          if (sucess && context.mounted) {
                            SnackbarUtils.showSuccess(
                              context,
                              'Suscripción exitosa a ${fund.name}',
                            );
                          }
                        }
                      },
                      onCancel: () {
                        ref.read(userAccountProvider.notifier).cancelFund(fund);
                        SnackbarUtils.showSuccess(
                          context,
                          'Fondos liberados de ${fund.name}',
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
