import 'package:crypto_fetch/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../entity/coin.dart';
import 'coin_bottom_sheet.dart';

class CoinListItem extends HookWidget {
  final Coin coin;
  const CoinListItem({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => CoinBottomSheet(coin: coin),
            backgroundColor: Colors.transparent,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: kAppBackgroundColor2,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    coin.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: kAppColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        coin.percentChange24h > 0 ? Icons.arrow_upward : Icons.arrow_downward,
                        color: coin.percentChange24h > 0 ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      Text(
                        '${coin.percentChange24h.abs().toStringAsFixed(2)}%',
                        style: TextStyle(
                          color: coin.percentChange24h > 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: kAppBackgroundColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(coin.symbol),
                  )
                ],
              ),

              //

              const SizedBox(height: 8),

              //

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price : ${coin.price.toStringAsFixed(2)}'),
                  Text('Rank : ${coin.rank}'),
                  Icon(Icons.arrow_forward),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
