import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';
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
                icon: SvgNameEnum.favSolid.icon,
                color: context.colorScheme.background,
              ),
              label: LocaleKeys.saved_saved.tr(),
            ),
            BottomNavigationBarItem(
              icon: SvgWidget(
                icon: SvgNameEnum.home.icon,
                color: context.colorScheme.background,
              ),
              label: LocaleKeys.home_home.tr(),
            ),
            BottomNavigationBarItem(
              icon: SvgWidget(
                icon: SvgNameEnum.history.icon,
                color: context.colorScheme.background,
              ),
              label: LocaleKeys.history_history.tr(),
            )
          ],
        );
      },
    );
  }
}
