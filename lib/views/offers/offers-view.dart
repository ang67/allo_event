import 'package:flutter/material.dart';

class OffersView extends StatefulWidget {
  final String typeService;

  const OffersView({Key key, this.typeService}) : super(key: key);

  @override
  _OffersViewState createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.typeService)),
        body: Center(child: Text(widget.typeService)));
  }
}
