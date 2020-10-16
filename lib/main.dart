import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '诉记',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: '诉记'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _list = ["aa", "bbb", "XXX"];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _list.add("jjjjj");
    });
  }

  ListView buildList(BuildContext context) {
    return new ListView(
      // shrinkWrap: true,
      children: _list
          .map((e) => new ListTile(
              leading: new Icon(Icons.map), title: new SelectableText(e)))
          .toList(),
      //
      // [
      //   new ListTile(
      //       leading: new Icon(Icons.map), title: new SelectableText("33333")),
      //   new ListTile(
      //       leading: new Icon(Icons.photo_album),
      //       title: new SelectableText("Album")),
      //   new ListTile(
      //     leading: new Icon(Icons.photo),
      //     title: new Text('Phone'),
      //   ),
      //   new ListTile(leading: new Icon(Icons.map), title: new Text("Maps")),
      //   new ListTile(
      //       leading: new Icon(Icons.photo_album), title: new Text("Album")),
      //   new ListTile(
      //     leading: new Icon(Icons.photo),
      //     title: new Text('Phone'),
      //   ),
      //   new ListTile(leading: new Icon(Icons.map), title: new Text("Maps")),
      //   new ListTile(
      //       leading: new Icon(Icons.photo_album), title: new Text("Album")),
      //   new ListTile(
      //     leading: new Icon(Icons.photo),
      //     title: new Text('Phone'),
      //   ),
      //   new ListTile(leading: new Icon(Icons.map), title: new Text("Maps")),
      //   new ListTile(
      //       leading: new Icon(Icons.photo_album), title: new Text("Album")),
      //   new ListTile(
      //     leading: new Icon(Icons.photo),
      //     title: new Text('Phone'),
      //   ),
      //   new ListTile(leading: new Icon(Icons.map), title: new Text("Maps")),
      //   new ListTile(
      //       leading: new Icon(Icons.photo_album), title: new Text("Album")),
      //   new ListTile(
      //     leading: new Icon(Icons.photo),
      //     title: new Text('Phone'),
      //   ),
      //   new ListTile(leading: new Icon(Icons.map), title: new Text("Maps")),
      //   new ListTile(
      //       leading: new Icon(Icons.photo_album), title: new Text("Album")),
      //   new ListTile(
      //     leading: new Icon(Icons.photo),
      //     title: new Text('Phone'),
      //   ),
      // ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
        // backgroundColor: Colors.green,
        body: Container(
      //color: Colors.amber,
      child: Row(
        children: [
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    //color: Colors.blue,
                    height: 100.0,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: SelectableText(
                      '诉记',
                      style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 28),
                    )
                    // Row(
                    //   mainAxisSize: MainAxisSize.max,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //
                    //   ],
                    // ),
                    ),

                // Expanded(
                //   child:
                Container(
                  //color: Colors.purpleAccent,
                  //height: double.infinity,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            //color: Colors.lime,
                            // child: FlatButton(
                            //   child: Text("normal"),
                            //   onPressed: () {},
                            // ),
                            // alignment: Alignment.centerLeft,
                            ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                            //color: Colors.teal,
                            child: OutlineButton(
                              child: Text("写文章"),
                              onPressed: () {
                                _incrementCounter();
                              },
                            ),
                            alignment: Alignment.centerRight),
                        flex: 2,
                      ),
                    ],
                  ),
                ),
                //   flex: 1,
                // ),

                Expanded(
                  child: Container(
                      //  color: Colors.black54,
                      child: Scrollbar(
                    child: buildList(context),
                  )
                      //  alignment: Alignment.topRight,
                      ),
                  flex: 3,
                )

                // Row(
                //   children: [
                //     Container(
                //       child: new ListView(
                //         shrinkWrap: true,
                //         children: [
                //           new ListTile(
                //               leading: new Icon(Icons.map),
                //               title: new Text("Maps")),
                //           new ListTile(
                //               leading: new Icon(Icons.photo_album),
                //               title: new Text("Album")),
                //           new ListTile(
                //             leading: new Icon(Icons.photo),
                //             title: new Text('Phone'),
                //           )
                //         ],
                //       ),
                //     )
                //   ],
                // )
              ],
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
        ],
      ),
    ));

    // return Scaffold(
    //   appBar: AppBar(
    //     // Here we take the value from the MyHomePage object that was created by
    //     // the App.build method, and use it to set our appbar title.
    //     title: Text(widget.title),
    //   ),
    //   body: Center(
    //       // Center is a layout widget. It takes a single child and positions it
    //       // in the middle of the parent.
    //       child:
    //           // Column(
    //           //   mainAxisAlignment: MainAxisAlignment.center,
    //           //   children: <Widget>[
    //           // Text(
    //           //   'You have pushed the button this many times:',
    //           // ),
    //           // Text(
    //           //   '$_counter',
    //           //   style: Theme.of(context).textTheme.headline4,
    //           // ),
    //           new Row(
    //     children: [
    //       new ListView(
    //         children: [
    //           new ListTile(
    //               leading: new Icon(Icons.map), title: new Text("Maps")),
    //           new ListTile(
    //               leading: new Icon(Icons.photo_album),
    //               title: new Text("Album")),
    //           new ListTile(
    //             leading: new Icon(Icons.photo),
    //             title: new Text('Phone'),
    //           )
    //         ],
    //       )
    //     ],
    //   )
    //       //   ],
    //       // ),
    //       ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
