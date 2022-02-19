import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../entity/coin.dart';
import '../widgets/coin_list_tile.dart';

class CoinsListView extends HookWidget {
  final List<Coin> coins;
  const CoinsListView({Key? key, required this.coins}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coins.length,
      itemBuilder: (context, index) {
        final coin = coins[index];
        return CoinListItem(
          coin: coin,
        );
      },
    );
  }
}
