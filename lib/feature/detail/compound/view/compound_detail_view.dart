import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/feature/detail/view/detail_view.dart';
import 'package:turkce_sozluk/feature/detail/view/tabbar/detail_tabbar_view.dart';
import 'package:turkce_sozluk/product/widgets/card/detail_word_card.dart';

import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/svg.dart';

class CompoundDetailView extends StatefulWidget {
  const CompoundDetailView({super.key});

  @override
  State<CompoundDetailView> createState() => _CompoundDetailViewState();
}

class _CompoundDetailViewState extends State<CompoundDetailView> {
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
          title: Text(TabBarPageEnum.compound.name),
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
