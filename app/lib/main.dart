// Material.dart Import
import 'package:flutter/material.dart';

// Flutter Packages
import 'package:flutter/services.dart';

// Pages Import
import 'package:app/pages/error.dart';
import 'package:app/pages/charts.dart';
import 'package:app/pages/travel.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(AnimatedCharts());
}

class AnimatedCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Charts",
      initialRoute: '/travel',
      routes: {
        '/charts': (context) => ChartsPage(),
        '/travel': (context) => TravelPage(),
        '/': (context) => Error(),
      },
      theme: ThemeData(fontFamily: "Cera Pro"),
    );
  }
}
