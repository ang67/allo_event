import 'package:allo_event/widgets/offer/offer_item.dart';
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
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          title: Text('${widget.typeService}'),
          floating: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.tune),
              onPressed: () {},
            )
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            // The builder function returns a ListTile with a title that
            // displays the index of the current item.
            (context, i) {
              if (i.isOdd) return Divider();
              final index = i ~/ 2 + 1;
              return OfferItemView(name: 'TSnono Pro $index');
            },
            // Builds 1000 ListTiles
            childCount: 10 * 2,
          ),
        )
      ]),
    );
  }
}
