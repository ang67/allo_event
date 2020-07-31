import 'package:allo_event/views/offers/offers-view.dart';
import 'package:flutter/material.dart';

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(BuildContext context, Entry root) {
    if (root.children.isEmpty)
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return OffersView(
                  typeService: root.title,
                );
              },
            ),
          );
        },
        child: ListTile(
          leading: root.leading,
          title: Text('${root.title}'),
          //trailing: Icon(Icons.keyboard_arrow_right)
        ),
      );

    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      leading: root.leading,
      title: Text(root.title),
      children: root.children.map((entry) {
        return _buildTiles(context, entry);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context, entry);
  }
}

class Entry {
  Entry(this.leading, this.title, [this.children = const <Entry>[]]);

  final Widget leading;
  final String title;
  final List<Entry> children;
}
