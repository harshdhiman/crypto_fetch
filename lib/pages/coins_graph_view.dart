import 'package:charts_flutter/flutter.dart';
import 'package:crypto_fetch/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../entity/coin.dart';

class CoinsGraphView extends HookWidget {
  final List<Coin> coins;
  const CoinsGraphView({Key? key, required this.coins}) : super(key: key);

  Series<dynamic, String> _makeChartData() {
    return Series<Coin, String>(
      id: 'Price',
      data: coins,
      domainFn: (point, _) => point.symbol,
      measureFn: (point, _) => point.price,
      colorFn: (_, __) => ColorUtil.fromDartColor(kAppColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      [_makeChartData()],
      domainAxis: OrdinalAxisSpec(
        renderSpec: SmallTickRendererSpec(
          labelStyle: TextStyleSpec(
            fontSize: 12,
            color: ColorUtil.fromDartColor(kAppColor),
          ),
        ),
      ),
      primaryMeasureAxis: NumericAxisSpec(
        renderSpec: SmallTickRendererSpec(
          labelStyle: TextStyleSpec(
            fontSize: 12,
            color: ColorUtil.fromDartColor(kAppColor),
          ),
        ),
      ),
    );
  }
}
