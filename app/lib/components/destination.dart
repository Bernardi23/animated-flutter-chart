import 'package:flutter/material.dart';
import 'dart:math';

// Model Import
import '../data/model.dart';

class Destination extends StatefulWidget {
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination>
    with SingleTickerProviderStateMixin {
  final _data = DestinationsData.data;
  UserDestination _currentDest;
  bool _stateIsAboutToChange;

  @override
  void initState() {
    _currentDest = _data[0];
    _stateIsAboutToChange = false;
    super.initState();
  }

  void _onPageChanged(int index) async {
    setState(() {
      _stateIsAboutToChange = true;
    });
    Future.delayed(Duration(milliseconds: 200)).then((_) {
      setState(() {
        _currentDest = _data[index];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        DestinationCard(data: _data, onPageChanged: _onPageChanged),
        DestinationInfoCard(
          currentDest: _currentDest,
          stateController: _stateIsAboutToChange,
        )
      ],
    );
  }
}

class DestinationInfoCard extends StatefulWidget {
  final UserDestination currentDest;
  final bool stateController;

  DestinationInfoCard(
      {@required this.currentDest, @required this.stateController});

  @override
  _DestinationInfoCardState createState() => _DestinationInfoCardState();
}

class _DestinationInfoCardState extends State<DestinationInfoCard>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _startingInfoOpacity;
  Animation<double> _startingInfoHeight;

  Animation<double> _endingInfoOpacity;
  Animation<double> _endingInfoHeight;

  bool _startingAnimationHasEnded;

  @override
  void initState() {
    super.initState();

    _startingAnimationHasEnded = false;

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _startingAnimationHasEnded = true;
              _animationController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _startingAnimationHasEnded = false;
            }
          });

    _startingInfoOpacity =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _startingInfoHeight =
        Tween<double>(begin: 10.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _endingInfoOpacity =
        Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _endingInfoHeight =
        Tween<double>(begin: 10.0, end: 20.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    // if (widget.stateController) _animationController.forward();
  }

  @override
  void didUpdateWidget(DestinationInfoCard infoCard) {
    super.didUpdateWidget(infoCard);
    if (_animationController.isDismissed) {
      _animationController.forward();
    }
  }

  Center pageIndicator() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 0, left: 0),
        height: 8,
        width: 8,
        decoration: BoxDecoration(
          // color: Colors.blue[300],
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Text destinationDescription() {
    return Text(
      widget.currentDest.description,
      style: TextStyle(
        color: Colors.black38,
        fontSize: 12,
      ),
    );
  }

  Text destinationName() {
    return Text(
      widget.currentDest.name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget child) {
              return Positioned(
                bottom: -50,
                left: MediaQuery.of(context).size.width * 0.13,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 3,
                        color: Colors.blue[900].withOpacity(0.1),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: (!_startingAnimationHasEnded)
                              ? _startingInfoHeight.value
                              : _endingInfoHeight.value,
                        ),
                        Opacity(
                          opacity: (!_startingAnimationHasEnded)
                              ? _startingInfoOpacity.value
                              : _endingInfoOpacity.value,
                          child: destinationName(),
                        ),
                        Container(height: 5),
                        Opacity(
                          opacity: (!_startingAnimationHasEnded)
                              ? _startingInfoOpacity.value
                              : _endingInfoOpacity.value,
                          child: destinationDescription(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 5,
            bottom: -40,
            child: pageIndicator(),
          )
        ],
      ),
    );
  }
}

class DestinationCard extends StatefulWidget {
  final List<UserDestination> data;
  final Function(int) onPageChanged;

  DestinationCard({@required this.data, @required this.onPageChanged});

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  double _rotationAngle = 0;

  Text destinationRating(int index) {
    return Text(
      "${widget.data[index].rating}",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Column userInfo(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${widget.data[index].author.username}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.location_on,
              size: 10,
              color: Colors.white,
            ),
            Container(width: 2.0),
            Text(
              "${widget.data[index].author.location}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }

  Container userAvatar(int index) {
    return Container(
      width: 35.0,
      height: 35.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.blue,
        image: DecorationImage(
          image: NetworkImage(widget.data[index].author.pictureUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container imageCard(int index) {
    return Container(
      margin: EdgeInsets.only(left: 0, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: NetworkImage(widget.data[index].url),
          fit: BoxFit.cover,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 7,
            spreadRadius: 3,
            color: Colors.blue[900].withOpacity(0.1),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          setState(() {
            double newSpeed = notification.scrollDelta * 0.03;
            double deltaSpeed = (newSpeed.abs() - _rotationAngle.abs()).abs();
            if (newSpeed.abs() < 0.8) {
              if (deltaSpeed <= 0.3) {
                _rotationAngle = -1 * newSpeed;
              }
              // print(deltaSpeed);
            }
          });
        }
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 240,
        child: PageView.builder(
          onPageChanged: widget.onPageChanged,
          controller: PageController(viewportFraction: 0.85),
          itemCount: widget.data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(_rotationAngle),
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    imageCard(index),
                    Container(
                      margin: EdgeInsets.only(right: 18),
                      padding: const EdgeInsets.only(
                        top: 18,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          userAvatar(index),
                          Container(width: 8),
                          userInfo(index),
                          Expanded(child: Container()),
                          destinationRating(index)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
