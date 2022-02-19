import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/coin.dart';
import 'package:http/http.dart' as http;

final coinsRepo = Provider((ref) => _CoinsRepo());

class _CoinsRepo {
  ///
  ///
  ///
  Future<List<Coin>> fetchCoins(List<String> symbols) async {
    final response = await http.get(
      Uri(
        scheme: "https",
        host: "pro-api.coinmarketcap.com",
        path: "/v1/cryptocurrency/quotes/latest",
        queryParameters: {
          "symbol": symbols.join(","),
        },
      ),
      headers: {
        "X-CMC_PRO_API_KEY": "27ab17d1-215f-49e5-9ca4-afd48810c149",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      final errorCode = data["status"]["error_code"];
      final errorMessage = data["status"]["error_message"];
      if (errorCode != 0) {
        throw Exception("Error : $errorMessage");
      }

      //
      final List<Coin> coins = [];
      for (final symbol in symbols) {
        final coinData = data["data"][symbol];
        final coin = Coin(
          name: coinData["name"],
          symbol: coinData["symbol"],
          price: coinData["quote"]["USD"]["price"],
          percentChange24h: coinData["quote"]["USD"]["percent_change_24h"],
          rank: coinData["cmc_rank"],
          priceLastUpdated: DateTime.parse(coinData["quote"]["USD"]["last_updated"]),
          tags: List.from(coinData["tags"]),
        );
        coins.add(coin);
      }
      return coins;
      //
    } else {
      throw Exception("Failed to fetch coins");
    }
  }
}
