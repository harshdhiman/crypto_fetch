import 'dart:ffi';

import 'package:crypto_fetch/controllers/coins_list_controller.dart';
import 'package:crypto_fetch/pages/coins_graph_view.dart';
import 'package:crypto_fetch/pages/coins_list_view.dart';
import 'package:crypto_fetch/widgets/coin_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/coin.dart';
import '../widgets/coin_list_tile.dart';

enum ViewMode {
  list,
  graph,
}

class CoinsPage extends HookConsumerWidget {
  final List<String> symbols;
  const CoinsPage({
    Key? key,
    required this.symbols,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final coinsController = ref.watch(coinsListingController);

    final viewMode = useState<ViewMode>(ViewMode.list);

    _fetchCoins() {
      coinsController.searchCoins(symbols);
    }

    useEffect(() {
      Future.microtask(() {
        _fetchCoins();
      });
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CoinRich"),
      ),
      body: coinsController.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : coinsController.error != null
              ? Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(coinsController.error.toString()),
                    ElevatedButton(onPressed: _fetchCoins, child: Text("Retry"))
                  ],
                ))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              viewMode.value =
                                  viewMode.value == ViewMode.list ? ViewMode.graph : ViewMode.list;
                            },
                            icon: Icon(Icons.bar_chart),
                            label: Text(
                              viewMode.value == ViewMode.list ? 'Show Graph' : 'Show List',
                            ),
                          ),
                          Text('Count: ${coinsController.coins.length}'),
                        ],
                      ),
                      Expanded(
                        child: viewMode.value == ViewMode.list
                            ? CoinsListView(coins: coinsController.coins)
                            : CoinsGraphView(coins: coinsController.coins),
                      ),
                    ],
                  ),
                ),
    );
  }
}
