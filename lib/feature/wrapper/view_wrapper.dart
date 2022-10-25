import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../product/init/language/locale_keys.g.dart';
import '../../product/init/navigator/app_router.dart';
import '../../product/widgets/svg.dart';

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
        SavedRoute(),
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
                icon: tabsRouter.activeIndex == 0 ? SvgNameEnum.savedSolid.icon : SvgNameEnum.saved.icon,
              ),
              label: LocaleKeys.saved_saved.tr(),
            ),
            BottomNavigationBarItem(
              icon: SvgWidget(
                icon: tabsRouter.activeIndex == 1 ? SvgNameEnum.homeSolid.icon : SvgNameEnum.home.icon,
              ),
              label: LocaleKeys.home_home.tr(),
            ),
            BottomNavigationBarItem(
              icon: SvgWidget(
                icon: SvgNameEnum.history.icon,
              ),
              label: LocaleKeys.history_history.tr(),
            )
          ],
        );
      },
    );
  }
}
