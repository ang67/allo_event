import 'package:allo_event/utils/ui_constantes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key key}) : super(key: key);

  // These tiles are also used as drawer nav items in home route.
  static final List<Widget> kAboutListTiles = <Widget>[
    ListTile(
      title: Text(APP_DESCRIPTION),
    ),
    Divider(),
    ListTile(
      leading: Icon(Icons.shop),
      title: Text("Noter l'appli sur Google play"),
      onTap: () => _launchURL(GOOGLEPLAY_URL),
    ),
    ListTile(
      leading: Icon(Icons.info_outline),
      title: Text("Informations légales"),
      onTap: () => null,
    ),
    ListTile(
      leading: Icon(Icons.bug_report),
      title: Text("Signaler un bug"),
      onTap: () => null,
    ),
    ListTile(
      leading: Icon(Icons.open_in_new),
      title: Text("Visiter notre site web"),
      onTap: () => _launchURL(WEBSITE_URL),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final header = ListTile(
      leading: FlutterLogo(),
      title: Text(APP_NAME),
      subtitle: Text(APP_VERSION),
      trailing: IconButton(
        icon: Icon(Icons.info),
        onPressed: () {
          showAboutDialog(
              context: context,
              applicationName: APP_NAME,
              applicationVersion: APP_VERSION,
              applicationIcon: FlutterLogo(),
              children: <Widget>[Text(APP_DESCRIPTION)]);
        },
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('A propos'),
      ),
      body: ListView(
        children: <Widget>[
          header,
          ...kAboutListTiles,
        ],
      ),
    );
  }
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
