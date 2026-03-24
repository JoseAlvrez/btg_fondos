//import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/core/utils/responsive_utils.dart';
import 'package:btg_fondos/presentation/atoms/btg_bottom_nav.dart';
import 'package:btg_fondos/presentation/organisms/btg_header.dart';
import 'package:btg_fondos/presentation/organisms/btg_funds_tab.dart';
import 'package:btg_fondos/presentation/organisms/btg_sidebar.dart';
import 'package:btg_fondos/presentation/organisms/btg_transactions_tab.dart';
import 'package:btg_fondos/presentation/providers/user_account_provider.dart';
import 'package:btg_fondos/presentation/state/user_account_state.dart';
import 'package:btg_fondos/presentation/utils/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(userAccountProvider.select((s) => s.balance));
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = ResponsiveUtils.isMobileWidth(screenWidth);

    // Escucha errores disparados por Casos de Uso (ej: Saldo insuficiente)
    ref.listen<UserAccountState>(userAccountProvider, (_, next) {
      if (next.errorMessage != null) {
        SnackbarUtils.showError(context, next.errorMessage!);
        ref.read(userAccountProvider.notifier).clearError();
      }
    });

    return Scaffold(
      appBar: const BtgHeader(),
      bottomNavigationBar: isMobile
          ? BtgBottomNav(
              selectedIndex: _selectedIndex,
              onIndexChanged: (index) => setState(() {
                _selectedIndex = index;
              }),
            )
          : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobile)
            BtgSidebar(
              balance: balance,
              selectedIndex: _selectedIndex,
              onIndexChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: [BtgFundsTab(), BtgTransactionsTab()],
            ),
          ),
        ],
      ),
    );
  }
}
