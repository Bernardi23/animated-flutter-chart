// Flutter/Dart packages
import 'package:flutter/material.dart';

// Components
import '../components/header.dart';
import '../components/destination.dart';
import '../components/recommended.dart';

class TravelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Header(),
            ),
            Container(height: 5),
            Destination(),
            Container(height: 53),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Recommended",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              ),
            ),
            Recommended()
          ],
        ),
      ),
    );
  }
}
