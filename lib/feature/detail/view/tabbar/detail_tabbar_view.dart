import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/feature/detail/viewmodel/detail_viewmodel.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';

import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/svg.dart';
import '../../compound/view/compound_view.dart';
import '../../proverb/view/proverb_view.dart';
import '../detail_view.dart';

class DetailTabBarView extends StatelessWidget {
  const DetailTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabBarPageEnum.values.length,
      child: Scaffold(
        appBar: AppBar(
          leading: TurkceSozlukIconButton(
            onPressed: () => Navigator.pop(context),
            child: SvgWidget(
              icon: IconNameEnum.left.value,
              color: context.colorScheme.background,
            ),
          ),
          title: Text(DetailViewModel.word ?? LocaleKeys.not_found.tr()),
          bottom: TabBar(
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
          ),
        ),
        body: TabBarView(
          children: [
            TabBarPageEnum.detail.page,
            TabBarPageEnum.proverb.page,
            TabBarPageEnum.compound.page,
          ],
        ),
      ),
    );
  }
}

enum TabBarPageEnum {
  detail(DetailView(), LocaleKeys.detail_detailTitle_explanation),
  proverb(ProverbView(), LocaleKeys.detail_detailTitle_proverbAndIdioms),
  compound(CompoundView(), LocaleKeys.detail_detailTitle_compoundWord);

  final Widget page;
  final String name;
  const TabBarPageEnum(this.page, this.name);
}
