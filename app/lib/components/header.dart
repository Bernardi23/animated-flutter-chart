import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Search for a place",
              style: TextStyle(fontSize: 12, color: Colors.black38),
            ),
            Row(
              children: <Widget>[
                Text(
                  "Destination",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.black26)
              ],
            ),
          ],
        ),
        Expanded(child: Container()),
        Stack(
          children: <Widget>[
            Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: Container(
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.pinkAccent,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
