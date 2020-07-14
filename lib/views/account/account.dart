import 'package:allo_event/utils/ui_constantes.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('   $APP_NAME'),
        ),
        body: Center(child: Icon(Icons.person)));
  }
}
