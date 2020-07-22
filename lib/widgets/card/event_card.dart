import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final int id;
  final String eventName;
  final int numberOfItems;
  final String imagePath;

  EventCard({
    this.id,
    this.eventName,
    this.imagePath,
    this.numberOfItems,
  });

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  var cardText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 150.0,
              width: 200.0,
              child: Image(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0.0,
              top: 100.0,
              width: 200.0,
              height: 50.0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black12])),
              ),
            ),
            Positioned(
              left: 10.0,
              top: 120,
              right: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.eventName,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("${widget.numberOfItems} Services",
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
