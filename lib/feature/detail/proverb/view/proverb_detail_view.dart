import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/feature/detail/view/tabbar/detail_tabbar_view.dart';

import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/card/detail_word_card.dart';
import '../../../../product/widgets/svg.dart';
import '../../compound/view/compound_view.dart';

class ProverbDetailView extends StatefulWidget {
  const ProverbDetailView({super.key});

  @override
  State<ProverbDetailView> createState() => _ProverbDetailViewState();
}

class _ProverbDetailViewState extends State<ProverbDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: TurkceSozlukIconButton(
            onPressed: () => Navigator.pop(context),
            child: SvgWidget(
              icon: IconNameEnum.left.value,
              color: Colors.black,
            ),
          ),
          title: Text(TabBarPageEnum.proverb.name),
        ),
        body: Padding(
          padding: context.paddingNormal,
          child: Column(
            children: const [
              DetailTop(),
              DetailWordCard(text: 'text', isRight: false),
            ],
          ),
        ));
  }
}
