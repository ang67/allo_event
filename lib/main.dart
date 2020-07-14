import 'package:allo_event/views/base.dart';
import 'package:allo_event/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  final String title = "AlloEvent";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: buildBaseTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => BaseScreen(),

        //
      },
    );
  }
}
