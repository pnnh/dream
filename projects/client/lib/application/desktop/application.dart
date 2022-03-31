import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/application/desktop/pages/calendar.dart';
import 'package:dream/application/desktop/pages/home.dart';
import 'package:dream/application/desktop/provider/home.dart';
import 'package:dream/application/desktop/provider/todo.dart';
import 'package:dream/application/desktop/route.dart';
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
    final delegate = Router.of(context).routerDelegate;
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
      pages: [if (_selectedBook.isEmpty) HomePage() else CalendarPage()],
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

  void handleBookTapped(String page) {
    _selectedBook = page;
    notifyListeners();
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
