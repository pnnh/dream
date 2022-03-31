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

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "/");
    if (uri.pathSegments.length == 2) {
      return BookRoutePath.details();
    }

    return BookRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(BookRoutePath path) {
    if (path.pathName == Pages.detail) {
      return RouteInformation(location: '/detail');
    }
    return RouteInformation(location: '/');
  }
}

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  BookRoutePath currentPath = BookRoutePath.home();

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>() {}

  static BookRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is BookRouterDelegate, 'Delegate type must match');
    return delegate as BookRouterDelegate;
  }

  BookRoutePath get currentConfiguration {
    return currentPath;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (currentPath.pathName == Pages.home) HomePage() else CalendarPage()
      ],
      onPopPage: (route, result) {
        print('onPopPage $route ');
        if (!route.didPop(result)) {
          return false;
        }
        currentPath = BookRoutePath.home();
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    print('setNewRoutePath ${path.pathName}');
    currentPath = path;
  }

  void handleBookTapped(String page) {
    switch (page) {
      case "detail":
        currentPath = BookRoutePath.details();
        break;
      default:
        currentPath = BookRoutePath.home();
    }
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
