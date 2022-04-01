import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dream/application/desktop/pages/mypage.dart';
import 'package:dream/application/desktop/provider/home.dart';
import 'package:dream/application/desktop/provider/todo.dart';
import 'package:dream/application/desktop/route.dart';
import 'package:dream/services/store/hive.dart';
import 'package:flutter/foundation.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => TodoProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => HomeProvider(),
          )
        ],
        child: MaterialApp.router(
          title: 'Books App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.white),
          routerDelegate: _routerDelegate,
          routeInformationParser: _routeInformationParser,
        ));
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
  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final _stack = <BookRoutePath>[BookRoutePath.home()];

  List<String> get stack => List.unmodifiable(_stack);

  BookRouterDelegate() {}

  static BookRouterDelegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is BookRouterDelegate, 'Delegate type must match');
    return delegate as BookRouterDelegate;
  }

  @override
  BookRoutePath get currentConfiguration => _stack.last;

  void push(BookRoutePath newRoute) {
    _stack.add(newRoute);
    notifyListeners();
  }

  void pop() {
    if (_stack.isNotEmpty) {
      _stack.remove(_stack.last);
    }
    notifyListeners();
  }

  @override
  Future<void> setInitialRoutePath(BookRoutePath configuration) {
    return setNewRoutePath(configuration);
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) async {
    print('setNewRoutePath ${configuration.pathName}');
    _stack
      ..clear()
      ..add(configuration);
    return SynchronousFuture<void>(null);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (_stack.isNotEmpty) {
      if (_stack.last == route.settings.name) {
        _stack.remove(route.settings.name);
        notifyListeners();
      }
    }
    return route.didPop(result);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        for (final name in _stack) MyPage(name),
      ],
      onPopPage: _onPopPage,
    );
  }

  void handleBookTapped(String page) {
    switch (page) {
      case "detail":
        push(BookRoutePath.details());
        break;
      default:
        push(BookRoutePath.home());
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
