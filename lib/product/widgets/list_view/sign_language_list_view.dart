import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/constants/enums/service_enum.dart';
import 'package:turkce_sozluk/product/constants/enums/string/string_constants.dart';
import 'package:turkce_sozluk/product/extensions/string_extension.dart';

import '../card/sign_language_card.dart';

class SignLanguageListView extends StatelessWidget {
  const SignLanguageListView({
    Key? key,
    required this.itemCount,
    required this.word,
  }) : super(key: key);
  final int itemCount;
  final String word;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: context.horizontalPaddingMedium,
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignLanguageCard(
                word:
                    TurkceSozlukStringConstants.signLanguageUrl + word[index].signLanguage() + ServiceEnum.gif.withDot),
            context.emptySizedHeightBoxLow3x,
            Text(
              word[index],
              style: context.textTheme.headline5?.copyWith(color: context.colorScheme.background),
            )
          ],
        );
      },
    );
  }
}
