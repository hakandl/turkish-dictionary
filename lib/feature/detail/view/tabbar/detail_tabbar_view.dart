import 'package:flutter/material.dart';
import 'package:turkce_sozluk/feature/detail/view/detail_view.dart';
import 'package:turkce_sozluk/product/widgets/button/icon_button.dart';

import '../../../../product/widgets/svg.dart';
import '../../compound/view/compound_view.dart';
import '../../proverb/view/proverb_view.dart';

class DetailTabBarView extends StatelessWidget {
  const DetailTabBarView({super.key, required this.word});
  final String word;

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
              color: Colors.black,
            ),
          ),
          title: Text(word),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: TabBarPageEnum.detail.name,
              ),
              Tab(
                text: TabBarPageEnum.proverb.name,
              ),
              Tab(
                text: TabBarPageEnum.compound.name,
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
  detail(DetailView(), 'Açıklama'),
  proverb(ProverbView(), 'Atasözleri & Deyimler'),
  compound(CompoundView(), 'Birleşik Kelimeler');

  final Widget page;
  final String name;
  const TabBarPageEnum(this.page, this.name);
}
