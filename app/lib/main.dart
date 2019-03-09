// Material.dart Import
import 'package:app/pages/charts.dart';

// Pages Import
import 'package:flutter/material.dart';

void main() => runApp(AnimatedCharts());

class AnimatedCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/charts',
        routes: {
          '/charts': (BuildContext context) => ChartsPage(),
        },
      );
}
