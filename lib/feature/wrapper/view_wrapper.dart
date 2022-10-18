import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/navigator/app_router.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';

import '../../product/constants/enums/svg_enum.dart';

class WrapperView extends StatefulWidget {
  const WrapperView({super.key});

  @override
  State<WrapperView> createState() => _WrapperViewState();
}

class _WrapperViewState extends State<WrapperView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        FavoritesRoute(),
        HomeRoute(),
        HistoryRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          selectedItemColor: context.colorScheme.background,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: SvgWidget(
                icon: SvgNameEnum.favSolid.icon,
                color: context.colorScheme.background,
              ),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: SvgWidget(
                icon: SvgNameEnum.splash.icon,
                color: context.colorScheme.background,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgWidget(
                icon: SvgNameEnum.sun.icon,
                color: context.colorScheme.background,
              ),
              label: 'History',
            )
          ],
        );
      },
    );
  }
}
