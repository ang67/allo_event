import 'package:allo_event/models/event_model.dart';
import 'package:allo_event/widgets/card/event_card.dart';
import 'package:flutter/material.dart';

class ListEventCard extends StatelessWidget {
  List<Event> events;
  ListEventCard({this.events});
  @override
  Widget build(BuildContext context) {
    var x = events.map((event) {
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
