import 'package:crypto_fetch/screens/coins_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _searchCoinController = useTextEditingController();

    _onSearchClick() {
      if (_searchCoinController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a coin name'),
          ),
        );
        return;
      }

      final _coinList =
          _searchCoinController.text.split(',').map((e) => e.trim().toUpperCase()).toList();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CoinsPage(symbols: _coinList)));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("CoinRich"),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _searchCoinController,
                decoration: InputDecoration(
                  hintText: "Enter Coin Symbol",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _onSearchClick,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(),
                      Text(
                        "Search",
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
