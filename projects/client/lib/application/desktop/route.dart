import 'package:dream/application/desktop/pages/mypage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute(WidgetBuilder builder, {RouteSettings? settings})
      : super(settings: settings, builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

class BookRoutePath {
  late Uri uri;

  BookRoutePath(String location) {
    uri = Uri.parse(location);
  }

  BookRoutePath.home() : this("/");

  BookRoutePath.calendar() : this("/calendar");

  BookRoutePath.other() : this("/other");
}

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  @override
  Future<BookRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    print('BookRouteInformationParser ${routeInformation.location}');
    return routeInformation.location != null
        ? BookRoutePath(routeInformation.location!)
        : BookRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(BookRoutePath path) {
    return RouteInformation(location: path.uri.toString());
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
    if (_stack.length > 1) {
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
    print('setNewRoutePath ${configuration.uri}');
    _stack
      ..clear()
      ..add(configuration);
    return SynchronousFuture<void>(null);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    print('_onPopPage ${route.settings}');
    if (_stack.length > 1) {
      _stack.removeLast();
      notifyListeners();
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

  void handleBookTapped(String location) {
    push(BookRoutePath(location));
    notifyListeners();
  }
}
