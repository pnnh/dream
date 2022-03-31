import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/application/desktop/pages/home.dart';
import 'package:dream/application/desktop/provider/home.dart';
import 'package:dream/application/desktop/provider/todo.dart';
import 'package:dream/services/store/hive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  BookRouterDelegate _routerDelegate = BookRouterDelegate();
  BookRouteInformationParser _routeInformationParser =
  BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "/");
    // Handle '/'
    // Handle '/book/:id'
    if (uri.pathSegments.length == 2) {
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      return BookRoutePath.details(id ?? 1);
    }

    return BookRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(BookRoutePath path) {
    if (path.isDetailsPage) {
      return RouteInformation(location: '/book/${path.id}');
    }
    //if (path.isHomePage) {
    return RouteInformation(location: '/');
    //}
  }
}

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  String _selectedBook = "";

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {}

  static BookRouterDelegate of(BuildContext context) {
    final delegate = Router
        .of(context)
        .routerDelegate;
    assert(delegate is BookRouterDelegate, 'Delegate type must match');
    return delegate as BookRouterDelegate;
  }

  BookRoutePath get currentConfiguration {
    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(0);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (_selectedBook.isEmpty)
          MaterialPage(
            key: ValueKey('BooksListPage'),
            child: BooksListScreen(),
          )
        else
          BookDetailsPage()
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _selectedBook = "";
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path.isDetailsPage) {
      _selectedBook = "detail";
    } else {
      _selectedBook = "";
    }
  }

  void handleBookTapped() {
    _selectedBook = "detail";
    notifyListeners();
  }
}

class BookDetailsPage extends Page {
  BookDetailsPage() : super(key: ValueKey(""));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookDetailsScreen();
      },
    );
  }
}

class BookRoutePath {
  final int id;

  BookRoutePath.home() : id = 0;

  BookRoutePath.details(this.id);

  bool get isHomePage => id == 0;

  bool get isDetailsPage => id != 0;
}

class BooksListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
// Provider<Counter>.value(value: foo),
          ChangeNotifierProvider(
            create: (_) => TodoProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeProvider(),
          )
        ],
        child: Scaffold(
          body: WindowBorder(color: borderColor, width: 1, child: LeftSide()),
        ));
  }
}

class BookDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("哈哈哈 book", style: Theme
                .of(context)
                .textTheme
                .headline6),
          ],
        ),
      ),
    );
  }
}

Future<void> initApp() async {
  await HiveStore.init();
  doWhenWindowReady(() {
    print("doWhenWindowReady");
    appWindow.minSize = Size(640, 480);
    appWindow.size = Size(1280, 900);
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
