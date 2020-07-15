import 'package:allo_event/views/account/account.dart';
import 'package:allo_event/views/event/event.dart';
import 'package:allo_event/views/favorite/favorite.dart';
import 'package:allo_event/views/home/home.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      HomePage(),
      MyFavoritesPage(),
      MyEventPage(),
      MyAccountPage()
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        title: Text('Accueil'),
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border), title: Text('Favoris')),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_to_home_screen),
        title: Text('Publier'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        title: Text('Compte'),
      ),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 7,
      items: _kBottmonNavBarItems,
      selectedLabelStyle:
          TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 12),
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
