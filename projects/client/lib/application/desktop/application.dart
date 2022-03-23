import 'package:dream/application/desktop/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/counter.dart';
import 'provider/home.dart';
import 'provider/todo.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

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
          home: Scaffold(
            body: WindowBorder(color: borderColor, width: 1, child: LeftSide()),
          )),
    );
  }
}

Future initApp() async {
  //await DesktopWindow.setWindowSize(Size(1200, 900));

  doWhenWindowReady(() {
    appWindow.minSize = Size(640, 480);
    appWindow.size = Size(1280, 960);
    appWindow.maxSize = Size(2560, 1920);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

const borderColor = Color(0xFF805306);

class LeftSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
                height: 40,
                color: Color.fromRGBO(231, 231, 231, 100),
                child: WindowTitleBarBox(
                    child: Row(children: [
                  Expanded(
                      child: MoveWindow(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("筑梦笔记")]))),
                  WindowButtons() // 似乎在macOS下不太需要
                ]))),
            HomePageWidget()
          ],
        ));
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: Color(0xFF805306),
    mouseOver: Color(0xFFF6A00C),
    mouseDown: Color(0xFF805306),
    iconMouseOver: Color(0xFF805306),
    iconMouseDown: Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: Color(0xFFD32F2F),
    mouseDown: Color(0xFFB71C1C),
    iconNormal: Color(0xFF805306),
    iconMouseOver: Colors.red);

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
