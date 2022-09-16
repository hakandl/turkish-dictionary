import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/feature/detail/proverb/view/proverb_detail_view.dart';
import 'package:turkce_sozluk/product/widgets/card/detail_word_card.dart';

import '../../view/detail_view.dart';

class ProverbView extends StatefulWidget {
  const ProverbView({super.key});

  @override
  State<ProverbView> createState() => _ProverbViewState();
}

class _ProverbViewState extends State<ProverbView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.paddingNormal,
      children: const [
        DetailTop(),
        DetailWordList(),
      ],
    );
  }
}

class DetailWordList extends StatelessWidget {
  const DetailWordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return DetailWordCard(
          text: 'data',
          onTap: () => context.navigateToPage(const ProverbDetailView()),
        );
      },
    );
  }
}
