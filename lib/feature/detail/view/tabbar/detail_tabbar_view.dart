import 'package:flutter/material.dart';
import 'package:turkce_sozluk/feature/detail/view/detail_view.dart';
import 'package:turkce_sozluk/product/widgets/button/icon_button.dart';

import '../../../../product/widgets/svg.dart';

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
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Açıklama',
              ),
              Tab(
                text: 'Atasözleri & Deyimler',
              ),
              Tab(
                text: 'Birleşik Kelimeler',
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
  detail(DetailView()),
  proverb(DetailView()),
  compound(DetailView());

  final Widget page;
  const TabBarPageEnum(this.page);
}
