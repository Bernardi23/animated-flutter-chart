// Flutter/Dart packages
import 'package:flutter/material.dart';

// Components
import '../components/header.dart';
import '../components/recommended.dart';

class TravelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Header(),
            ),
            Container(height: 18),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/1533729/pexels-photo-1533729.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Recommended",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
              ),
            ),
            Container(height: 8),
            Recommended()
          ],
        ),
      ),
    );
  }
}
