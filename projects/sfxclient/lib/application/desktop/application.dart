import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sfxui/application/desktop/pages/home.dart';

import 'provider/Counter.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
// Provider<Counter>.value(value: foo),
        ChangeNotifierProvider(
          create: (_) => Counter(),
        ),
      ],
      child: MaterialApp(
          title: '桌面应用',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.white),
          home: const Scaffold(
            body: HomePageWidget(),
          )),
    );
  }
}

Future initApp() async {
  //await DesktopWindow.setWindowSize(Size(1200, 900));
}
