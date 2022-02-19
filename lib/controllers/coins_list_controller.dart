import 'package:crypto_fetch/datarepos/coins_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entity/coin.dart';

final coinsListingController = ChangeNotifierProvider((_) => CoinsListingController(_.read));

class CoinsListingController extends ChangeNotifier {
  final Reader _reader;
  CoinsListingController(this._reader);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  List<Coin> _coins = [];
  List<Coin> get coins => _coins;

  //

  void searchCoins(List<String> symbols) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final coins = await _reader(coinsRepo).fetchCoins(symbols);
      _coins = coins;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
