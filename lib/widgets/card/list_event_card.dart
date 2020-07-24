import 'package:allo_event/models/event_model.dart';
import 'package:allo_event/widgets/card/event_card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListEventCard extends StatefulWidget {
  List<Event> events;
  ListEventCard({this.events});

  @override
  _ListEventCardState createState() => _ListEventCardState();
}

class _ListEventCardState extends State<ListEventCard> {
  @override
  Widget build(BuildContext context) {
    var x = widget.events.map((event) {
      return EventCard(
          id: event.id,
          eventName: event.eventName,
          numberOfItems: event.numberOfItems,
          imagePath: event.imagePath);
    }).toList();
    return Row(
      children: <Widget>[...x],
    );
  }
}
