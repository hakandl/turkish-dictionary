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
    DetailTabBarRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const DetailTabBarView());
    },
    ProverbDetailRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProverbDetailView());
    },
    CompoundDetailRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CompoundDetailView());
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
/// [DetailTabBarView]
class DetailTabBarRoute extends PageRouteInfo<void> {
  const DetailTabBarRoute({List<PageRouteInfo>? children})
      : super(DetailTabBarRoute.name,
            path: 'detailTabBar', initialChildren: children);

  static const String name = 'DetailTabBarRoute';
}

/// generated route for
/// [ProverbDetailView]
class ProverbDetailRoute extends PageRouteInfo<void> {
  const ProverbDetailRoute()
      : super(ProverbDetailRoute.name, path: 'proverbDetail');

  static const String name = 'ProverbDetailRoute';
}

/// generated route for
/// [CompoundDetailView]
class CompoundDetailRoute extends PageRouteInfo<void> {
  const CompoundDetailRoute()
      : super(CompoundDetailRoute.name, path: 'compoundDetail');

  static const String name = 'CompoundDetailRoute';
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
