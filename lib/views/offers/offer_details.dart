import 'package:flutter/material.dart';

class OfferDetailsView extends StatefulWidget {
  @override
  _OfferDetailsViewState createState() => _OfferDetailsViewState();
}

class _OfferDetailsViewState extends State<OfferDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Détails')),
        body: Center(child: Text('Détails')));
  }
}
