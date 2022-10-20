// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashView());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    HistoryRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HistoryView());
    },
    WrapperRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const WrapperView());
    },
    DetailTabBarRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DetailTabBarView());
    },
    ProverbDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProverbDetailRouteArgs>(
          orElse: () => const ProverbDetailRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: ProverbDetailView(key: args.key, title: args.title));
    },
    CompoundDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CompoundDetailRouteArgs>(
          orElse: () => const CompoundDetailRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: CompoundDetailView(key: args.key, title: args.title));
    },
    SavedRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SavedView());
    },
    DetailRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DetailView());
    },
    ProverbRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProverbView());
    },
    CompoundRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CompoundView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: 'home'),
        RouteConfig(HistoryRoute.name, path: 'history'),
        RouteConfig(WrapperRoute.name, path: 'wrapper', children: [
          RouteConfig('#redirect',
              path: '',
              parent: WrapperRoute.name,
              redirectTo: 'home',
              fullMatch: true),
          RouteConfig(SavedRoute.name,
              path: 'saved', parent: WrapperRoute.name),
          RouteConfig(HomeRoute.name, path: 'home', parent: WrapperRoute.name),
          RouteConfig(HistoryRoute.name,
              path: 'history', parent: WrapperRoute.name)
        ]),
        RouteConfig(DetailTabBarRoute.name, path: 'detailTabBar', children: [
          RouteConfig('#redirect',
              path: '',
              parent: DetailTabBarRoute.name,
              redirectTo: 'detail',
              fullMatch: true),
          RouteConfig(DetailRoute.name,
              path: 'detail', parent: DetailTabBarRoute.name),
          RouteConfig(ProverbRoute.name,
              path: 'proverb', parent: DetailTabBarRoute.name),
          RouteConfig(CompoundRoute.name,
              path: 'compound', parent: DetailTabBarRoute.name)
        ]),
        RouteConfig(ProverbDetailRoute.name, path: 'proverbDetail'),
        RouteConfig(CompoundDetailRoute.name, path: 'compoundDetail')
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [HistoryView]
class HistoryRoute extends PageRouteInfo<void> {
  const HistoryRoute() : super(HistoryRoute.name, path: 'history');

  static const String name = 'HistoryRoute';
}

/// generated route for
/// [WrapperView]
class WrapperRoute extends PageRouteInfo<void> {
  const WrapperRoute({List<PageRouteInfo>? children})
      : super(WrapperRoute.name, path: 'wrapper', initialChildren: children);

  static const String name = 'WrapperRoute';
}

/// generated route for
/// [DetailTabBarView]
class DetailTabBarRoute extends PageRouteInfo<void> {
  const DetailTabBarRoute({List<PageRouteInfo>? children})
      : super(DetailTabBarRoute.name,
            path: 'detailTabBar', initialChildren: children);

  static const String name = 'DetailTabBarRoute';
}

/// generated route for
/// [ProverbDetailView]
class ProverbDetailRoute extends PageRouteInfo<ProverbDetailRouteArgs> {
  ProverbDetailRoute({Key? key, String? title})
      : super(ProverbDetailRoute.name,
            path: 'proverbDetail',
            args: ProverbDetailRouteArgs(key: key, title: title));

  static const String name = 'ProverbDetailRoute';
}

class ProverbDetailRouteArgs {
  const ProverbDetailRouteArgs({this.key, this.title});

  final Key? key;

  final String? title;

  @override
  String toString() {
    return 'ProverbDetailRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [CompoundDetailView]
class CompoundDetailRoute extends PageRouteInfo<CompoundDetailRouteArgs> {
  CompoundDetailRoute({Key? key, String? title})
      : super(CompoundDetailRoute.name,
            path: 'compoundDetail',
            args: CompoundDetailRouteArgs(key: key, title: title));

  static const String name = 'CompoundDetailRoute';
}

class CompoundDetailRouteArgs {
  const CompoundDetailRouteArgs({this.key, this.title});

  final Key? key;

  final String? title;

  @override
  String toString() {
    return 'CompoundDetailRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [SavedView]
class SavedRoute extends PageRouteInfo<void> {
  const SavedRoute() : super(SavedRoute.name, path: 'saved');

  static const String name = 'SavedRoute';
}

/// generated route for
/// [DetailView]
class DetailRoute extends PageRouteInfo<void> {
  const DetailRoute() : super(DetailRoute.name, path: 'detail');

  static const String name = 'DetailRoute';
}

/// generated route for
/// [ProverbView]
class ProverbRoute extends PageRouteInfo<void> {
  const ProverbRoute() : super(ProverbRoute.name, path: 'proverb');

  static const String name = 'ProverbRoute';
}

/// generated route for
/// [CompoundView]
class CompoundRoute extends PageRouteInfo<void> {
  const CompoundRoute() : super(CompoundRoute.name, path: 'compound');

  static const String name = 'CompoundRoute';
}
