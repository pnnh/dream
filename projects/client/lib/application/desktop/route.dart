import 'package:dream/application/desktop/pages/mypage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute(WidgetBuilder builder, {RouteSettings? settings})
      : super(settings: settings, builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}

enum Pages { home, detail, other }

class BookRoutePath {
  Pages pathName = Pages.home;
  String location = "/";

  BookRoutePath(this.pathName, this.location);

  BookRoutePath.home();

  BookRoutePath.details()
      : pathName = Pages.detail,
        location = "/detail";
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
      return const RouteInformation(location: '/detail');
    }
    return const RouteInformation(location: '/');
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
    print('setNewRoutePath ${configuration.pathName}');
    _stack
      ..clear()
      ..add(configuration);
    return SynchronousFuture<void>(null);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    print('_onPopPage ${route.settings}');
    if (_stack.length > 1) {
      if (_stack.last.pathName.toString() == route.settings.name) {
        _stack.removeLast();
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

  void handleBookTapped(Pages page) {
    String location = "";
    switch (page) {
      case Pages.detail:
        location = "/detail";
        break;
      case Pages.other:
        location = "/other";
        break;
      default:
        location = "/";
        break;
    }
    push(BookRoutePath(page, location));
    notifyListeners();
  }
}
