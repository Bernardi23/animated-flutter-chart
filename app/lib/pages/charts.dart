// Import Flutter/Dart Packages
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// Import 3rd Party Packages

class PageBody extends StatefulWidget {
  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  double _scrollSpeed = 0.0;

  Widget _pageViewItem(BuildContext ctx, int index) {
    // return Container(width: 150.0, height: 150.0, color: Colors.green);
    return Transform(
      transform: Matrix4.identity()..rotateY(_scrollSpeed * 1.1),
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 30, right: 30, bottom: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(_scrollSpeed * 20, 5.0),
              blurRadius: 10.0,
              color: Colors.blue[900].withAlpha(30),
              spreadRadius: 12.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 30.0),
              Text(
                "Hello Ethan",
                style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
              ),
              Container(height: 4.0),
              Text(
                "Welcome to your travel guide",
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.black54),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildChildren(BuildContext ctx, int amount) {
    List<Widget> childrenList = [];

    for (int i = 0; i < amount; i++) {
      childrenList.add(_pageViewItem(ctx, i));
    }

    return childrenList;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: 200.0,
            child: PageView(
              children: _buildChildren(context, 15),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(height: 15.0),
          Container(
            height: 400.0,
            margin: EdgeInsets.only(left: 30.0, right: 30.0, bottom: 150.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 10.0,
                  color: Colors.blueGrey[900].withAlpha(30),
                  spreadRadius: 15.0,
                )
              ],
              image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.pexels.com/photos/1010657/pexels-photo-1010657.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
              ),
            ),
          ),
        ],
      ),
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification &&
            notification.metrics.axis.index == 0) {
          setState(() {
            double newSpeed = notification.scrollDelta * 0.03;
            if (newSpeed.abs() < 0.8) {
              _scrollSpeed = newSpeed;
            }
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ChartsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interactive list App"),
      ),
      body: PageBody(),
      // backgroundColor: Colors.white,
    );
  }
}
