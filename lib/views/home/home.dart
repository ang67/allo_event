import 'package:allo_event/utils/ui_constantes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Do something with searchText. Note: This is not a result.

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
        body: Center(child: Icon(Icons.home)));
  }
}
