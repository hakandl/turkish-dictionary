import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/widgets/button/icon_text_button.dart';
import '../../../product/widgets/button/circle_elevated_button.dart';
import '../../../product/widgets/card/detail_word_info_card.dart';
import '../../../product/widgets/svg.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
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
          style: context.textTheme.headlineLarge?.copyWith(
            color: context.colorScheme.background,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'subtitle',
          style: context.textTheme.bodyMedium
              ?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: context.verticalPaddingMedium,
          child: Row(
            children: [
              TurkceSozlukCircleElevatedButton(
                child: SvgWidget(
                  icon: IconNameEnum.voice.value,
                  color: context.colorScheme.onSecondary,
                ),
                onPressed: () {},
              ),
              TurkceSozlukCircleElevatedButton(
                child: SvgWidget(
                  icon: IconNameEnum.fav.value,
                  color: context.colorScheme.onSecondary,
                ),
                onPressed: () {},
              ),
              const Spacer(),
              TurkceSozlukIconTextButton(
                text: 'Türk İşaret Dili',
                textStyle: TextStyle(color: context.colorScheme.onSecondary),
                icon: SvgWidget(
                  icon: IconNameEnum.hand.value,
                  color: context.colorScheme.onSecondary,
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
    return ClipRRect(
      borderRadius: context.lowBorderRadius,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const DetailWordInfoCard();
        },
        separatorBuilder: (context, index) {
          return Container(color: context.colorScheme.primary, child: const Divider());
        },
      ),
    );
  }
}
