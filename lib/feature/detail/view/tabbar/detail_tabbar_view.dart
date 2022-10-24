import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../viewmodel/detail_viewmodel.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/init/navigator/app_router.dart';

import '../../../../product/constants/enums/string_enum.dart';
import '../../../../product/constants/enums/svg_enum.dart';
import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/svg.dart';

class DetailTabBarView extends StatelessWidget {
  const DetailTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [DetailRoute(), ProverbRoute(), CompoundRoute()],
      builder: (context, child, tabController) {
        return Scaffold(
          appBar: _appBar(context, tabController),
          body: child,
        );
      },
    );
  }

  AppBar _appBar(BuildContext context, TabController tabController) {
    return AppBar(
      leading: TurkceSozlukIconButton(
        onPressed: () => context.pop(),
        child: SvgWidget(
          icon: SvgNameEnum.left.icon,
          color: context.colorScheme.background,
        ),
      ),
      title: Text(DetailViewModel.word ?? LocaleKeys.info_notFound.tr()),
      bottom: _tabBar(tabController),
    );
  }

  TabBar _tabBar(TabController tabController) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      tabs: [
        Tab(
          text: TabBarPageEnum.detail.name.tr(),
        ),
        Tab(
          text: TabBarPageEnum.proverb.name.tr(),
        ),
        Tab(
          text: TabBarPageEnum.compound.name.tr(),
        ),
      ],
    );
  }
}
