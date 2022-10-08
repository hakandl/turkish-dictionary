/* import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/init/navigator/app_router.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';

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
                icon: IconNameEnum.search.value,
                color: context.colorScheme.background,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgWidget(
                icon: IconNameEnum.history.value,
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
 */