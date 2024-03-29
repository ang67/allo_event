import 'package:allo_event/data/events_data.dart';
import 'package:allo_event/models/event_model.dart';
import 'package:allo_event/utils/ui_constantes.dart';
import 'package:allo_event/widgets/card/list_event_card.dart';
import 'package:allo_event/widgets/search/search_field.dart';

import 'package:flutter/material.dart';

Future<List<Event>> fetchEvent() async {
  return EVENTDATA.map((event) => Event.fromJson(event)).toList();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Event>> futureEvents;

  @override
  void initState() {
    super.initState();
    futureEvents = fetchEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('   $APP_NAME'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.notifications), onPressed: () => {}),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    height: 50,
                    child: ListTile(
                      //leading: Icon(Icons.help_outline),
                      title: Text('Aide'),
                      onTap: () => {Navigator.pushNamed(context, '/help')},
                    )),
                PopupMenuItem(
                  child: ListTile(
                      //leading: Icon(Icons.info_outline),
                      title: Text('A propos'),
                      onTap: () => {
                            Navigator.pushNamed(context, '/about'),
                          }),
                ),
              ];
            }),
          ],
        ),
        body: ListView(children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                SearchField(),
                SizedBox(height: 30),
                Text('Quel évènement organisez-vous ?',
                    style: Theme.of(context).textTheme.headline2),
                SizedBox(height: 10),
                FutureBuilder<List<Event>>(
                  future: futureEvents,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Event> events = snapshot.data;

                      return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            child: ListEventCard(events: events),
                          ));
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return CircularProgressIndicator();
                  },
                ),
                SizedBox(height: 20),
                Text('Offres promotionnelles !',
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
          ),
        ]));
  }
}
