import 'package:crypto_fetch/entity/coin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class CoinBottomSheet extends HookWidget {
  final Coin coin;
  const CoinBottomSheet({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                coin.name,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 24),
            Text('Tags'),
            SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: coin.tags.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(coin.tags[index]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            Text('Price Last Updated'),
            SizedBox(height: 8),
            Text(
              DateFormat('dd-MM-yyyy h:mm a').format(coin.priceLastUpdated),
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
