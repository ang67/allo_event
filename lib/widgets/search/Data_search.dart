import 'package:flutter/material.dart';

typedef OnSearchChanged = Future<List<String>> Function(String);

class DataSearch extends SearchDelegate<String> {
  ///[onSearchChanged] gets the [query] as an argument. Then this callback
  ///should process [query] then return an [List<String>] as suggestions.
  ///Since its returns a [Future] you get suggestions from server too.
  final OnSearchChanged onSearchChanged;

  ///This [_oldFilters] used to store the previous suggestions. While waiting
  ///for [onSearchChanged] to completed, [_oldFilters] are displayed.
  List<String> _oldFilters = const [];

  DataSearch({String searchFieldLabel, this.onSearchChanged})
      : super(searchFieldLabel: searchFieldLabel);

  ///
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      ),
    ];
  }

  ///OnSubmit in the keyboard, returns the [query]
  // @override
  // void showResults(BuildContext context) {
  //   close(context, query);
  // }

  ///Since [showResults] is overridden we can don't have to build the results.
  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.blueAccent,
          child: FlatButton(
              onPressed: () {
                close(context, query);
              },
              child: Center(child: Text(query))),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: onSearchChanged != null ? onSearchChanged(query) : null,
      builder: (context, snapshot) {
        if (snapshot.hasData) _oldFilters = snapshot.data;
        return ListView.builder(
          
          itemCount: _oldFilters.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Icon(Icons.restore),
                trailing: IconButton(icon: Icon(Icons.clear), onPressed: () { _oldFilters.removeAt(index); },),
                title: RichText(
                  text: TextSpan(
                      text: _oldFilters[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: _oldFilters[index].substring(query.length),
                            style: TextStyle(color: Colors.grey))
                      ]),
                ),
                onTap: () {
                  query = _oldFilters[index];
                });
          },
        );
      },
    );
  }
}
