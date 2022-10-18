import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:turkce_sozluk/feature/favorites/view/favorites_view.dart';

import '../../../feature/detail/compound/view/compound_detail_view.dart';
import '../../../feature/detail/compound/view/compound_view.dart';
import '../../../feature/detail/proverb/view/proverb_detail_view.dart';
import '../../../feature/detail/proverb/view/proverb_view.dart';
import '../../../feature/detail/view/detail_view.dart';
import '../../../feature/detail/view/tabbar/detail_tabbar_view.dart';
import '../../../feature/history/view/history_view.dart';
import '../../../feature/home/view/home_view.dart';
import '../../../feature/splash/view/splash_view.dart';
import '../../../feature/wrapper/view_wrapper.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, path: '/', initial: true),
    AutoRoute(page: HomeView, path: 'home', initial: true),
    AutoRoute(page: HistoryView, path: 'history'),
    AutoRoute(page: WrapperView, path: 'wrapper', children: [
      AutoRoute(page: FavoritesView, path: 'favorites'),
      AutoRoute(page: HomeView, path: 'home', initial: true),
      AutoRoute(page: HistoryView, path: 'history'),
    ]),
    AutoRoute(page: DetailTabBarView, path: 'detailTabBar', children: [
      AutoRoute(page: DetailView, path: 'detail', initial: true),
      AutoRoute(page: ProverbView, path: 'proverb'),
      AutoRoute(page: CompoundView, path: 'compound'),
    ]),
    AutoRoute(page: ProverbDetailView, path: 'proverbDetail'),
    AutoRoute(page: CompoundDetailView, path: 'compoundDetail'),
  ],
)
class AppRouter extends _$AppRouter {}
