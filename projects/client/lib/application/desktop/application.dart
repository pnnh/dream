import 'package:dream/application/desktop/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/counter.dart';
import 'provider/home.dart';
import 'provider/todo.dart';

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
        ChangeNotifierProvider(
          create: (_) => TodoProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        )
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
