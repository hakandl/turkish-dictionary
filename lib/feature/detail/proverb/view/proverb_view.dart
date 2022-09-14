import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/feature/detail/proverb/view/proverb_detail_view.dart';
import 'package:turkce_sozluk/product/widgets/button/icon_text_button.dart';
import 'package:turkce_sozluk/product/widgets/button/material_button.dart';
import 'package:turkce_sozluk/product/widgets/card/detail_word_card.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';

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

class DetailTop extends StatelessWidget {
  const DetailTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'title',
          style: context.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          'subtitle',
          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: context.verticalPaddingMedium,
          child: Row(
            children: [
              TurkceSozlukMaterialButton(
                color: Colors.white,
                child: SvgWidget(
                  icon: IconNameEnum.voice.value,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              context.emptySizedWidthBoxLow3x,
              TurkceSozlukMaterialButton(
                color: Colors.white,
                child: SvgWidget(
                  icon: IconNameEnum.fav.value,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              const Spacer(),
              TurkceSozlukIconTextButton(
                text: 'Türk İşaret Dili',
                textStyle: const TextStyle(color: Colors.grey),
                icon: SvgWidget(
                  icon: IconNameEnum.hand.value,
                  color: Colors.grey,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
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
