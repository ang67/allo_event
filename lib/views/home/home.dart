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
        ),
        body: Center(child: Icon(Icons.home)));
  }
}
