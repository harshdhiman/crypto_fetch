import 'dart:convert';

import 'package:flutter/foundation.dart';

class Coin {
  final String name;
  final String symbol;
  final double price;
  final double percentChange24h;
  final int rank;
  final DateTime priceLastUpdated;
  final List<String> tags;
  Coin({
    required this.name,
    required this.symbol,
    required this.price,
    required this.percentChange24h,
    required this.rank,
    required this.priceLastUpdated,
    required this.tags,
  });

  Coin copyWith({
    String? name,
    String? symbol,
    double? price,
    double? percentChange24h,
    int? rank,
    DateTime? priceLastUpdated,
    List<String>? tags,
  }) {
    return Coin(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      price: price ?? this.price,
      percentChange24h: percentChange24h ?? this.percentChange24h,
      rank: rank ?? this.rank,
      priceLastUpdated: priceLastUpdated ?? this.priceLastUpdated,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'symbol': symbol,
      'price': price,
      'percentChange24h': percentChange24h,
      'rank': rank,
      'priceLastUpdated': priceLastUpdated.millisecondsSinceEpoch,
      'tags': tags,
    };
  }

  factory Coin.fromMap(Map<String, dynamic> map) {
    return Coin(
      name: map['name'] ?? '',
      symbol: map['symbol'] ?? '',
      price: map['price'] ?? '',
      percentChange24h: map['percentChange24h'] ?? '',
      rank: map['rank'] ?? '',
      priceLastUpdated: DateTime.fromMillisecondsSinceEpoch(map['priceLastUpdated']),
      tags: List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Coin.fromJson(String source) => Coin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Coin(name: $name, symbol: $symbol, price: $price, percentChange24h: $percentChange24h, rank: $rank, priceLastUpdated: $priceLastUpdated, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Coin &&
        other.name == name &&
        other.symbol == symbol &&
        other.price == price &&
        other.percentChange24h == percentChange24h &&
        other.rank == rank &&
        other.priceLastUpdated == priceLastUpdated &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        symbol.hashCode ^
        price.hashCode ^
        percentChange24h.hashCode ^
        rank.hashCode ^
        priceLastUpdated.hashCode ^
        tags.hashCode;
  }
}
