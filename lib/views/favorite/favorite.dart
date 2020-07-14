import 'package:allo_event/utils/ui_constantes.dart';
import 'package:flutter/material.dart';

class MyFavoritesPage extends StatefulWidget {
  @override
  _MyFavoritesPageState createState() => _MyFavoritesPageState();
}

class _MyFavoritesPageState extends State<MyFavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('   $APP_NAME'),
        ),
        body: Center(child: Icon(Icons.favorite)));
  }
}
