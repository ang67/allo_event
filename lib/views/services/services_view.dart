import 'package:allo_event/data/event_data.dart';
import 'package:allo_event/widgets/expanded_list/entry_item.dart';
import 'package:flutter/material.dart';

class ServicesView extends StatefulWidget {
  final int id;
  final String title;
  final int numberOfItems;
  const ServicesView(
      {Key key, @required this.id, this.title, this.numberOfItems})
      : super(key: key);
  @override
  _ServicesViewState createState() => _ServicesViewState();
}

class _ServicesViewState extends State<ServicesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Services ${widget.title}')),
        body: Body(count: widget.numberOfItems));
  }
}

class Body extends StatefulWidget {
  final int count;

  const Body({Key key, this.count}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Column(
          children: <Widget>[
            Image(
              width: 50,
              height: 50,
              image: AssetImage('assets/icons/robot_assistant.png'),
              fit: BoxFit.cover,
            ),
            const Text("Hey ! Je m'appelle Marthe",
                textAlign: TextAlign.center),
          ],
        ),
        content:
            Text("As tu besoin d'assistance ?", textAlign: TextAlign.center),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context, 'Non'),
            child: Text("Non merci"),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context, 'Oui'),
            child: Text("Oui"),
          )
        ],
      ),
    ).then((returnVal) {
      if (returnVal != null && returnVal == 'Oui') {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Bon choix !', textAlign: TextAlign.center),
            action: SnackBarAction(label: 'OK', onPressed: () {}),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration.zero, () => showAlert(context));
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          EntryItem(servicesDtypeDATA[index]),
      itemCount: servicesDtypeDATA.length,
    );
  }
}
