import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/core/components/button/normal_icon_button.dart';
import 'package:turkce_sozluk/feature/detail/viewmodel/detail_viewmodel.dart';
import 'package:turkce_sozluk/product/constants/enums/size_enum.dart';
import 'package:turkce_sozluk/product/init/navigator/app_router.dart';

import '../../../../product/widgets/input/textfield.dart';
import '../../../../product/widgets/svg.dart';
import '../../../product/constants/enums/string_enum.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/constants/enums/svg_enum.dart';
import '../../../product/widgets/button/text_button.dart';
import '../viewmodel/search_viewmodel.dart';

part '../module/widgets/word_card_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: context.onlyTopPaddingNormal,
              child: Row(
                children: [
                  Expanded(
                    child: _searchTextFieldContainer(context),
                  ),
                  NormalIconButton(
                    child: SvgWidget(
                      icon: SvgNameEnum.left.icon,
                      color: context.colorScheme.background,
                    ),
                    onPressed: () => context.pop(),
                  )
                  /* TurkceSozlukTextButton(
                    text: 'Vazgeç',
                    textStyle: context.textTheme.titleMedium,
                    onPressed: () => context.pop(),
                  ) */
                ],
              ),
            ),
            _specialWordContainer(context),
            Expanded(
              child: context.watch<SearchViewModel>().searchTextField.text.isNotEmpty &&
                      context.watch<SearchViewModel>().filteredData.isEmpty
                  ? _nonWord(context)
                  : context.watch<SearchViewModel>().searchTextField.text.isEmpty
                      ? _searchForSomething()
                      : const _WordCardList(),
            ),
          ],
        ),
      ),
    );
  }

  Container _searchTextFieldContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.transparent.withOpacity(0.2),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: SizeEnum.fifty.value,
      padding: context.onlyLeftPaddingNormal,
      child: NormalTextField(
        controller: context.watch<SearchViewModel>().searchTextField,
        // title: LocaleKeys.search_searchInTurkishDictionary.tr(),
        radius: context.lowRadius.x,
        icon: Padding(
          padding: context.paddingNormal,
          child: SvgWidget(
            icon: SvgNameEnum.search.icon,
            color: context.colorScheme.background,
          ),
        ),
        onChanged: (value) => context.read<SearchViewModel>().runFilter(value),
      ),
    );
  }

  Container _specialWordContainer(BuildContext context) {
    return Container(
      margin: context.onlyTopPaddingNormal,
      color: context.colorScheme.secondary,
      height: SizeEnum.fortyEight.value,
      child: Row(
        children: [
          for (int i = 0; i < SpecialWordEnum.values.length; i++) _specialWord(SpecialWordEnum.values[i].value),
        ],
      ),
    );
  }

  Expanded _specialWord(String word) {
    return Expanded(
      child: TurkceSozlukTextButton(
        text: word,
        textStyle: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        onPressed: () =>
            context.read<SearchViewModel>().insertSpecialWord(word, context.read<SearchViewModel>().searchTextField),
      ),
    );
  }

  Column _nonWord(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgWidget(
          icon: SvgNameEnum.confused.icon,
          height: SizeEnum.fortyEight.value,
          color: context.colorScheme.onSecondary,
        ),
        context.emptySizedHeightBoxLow3x,
        Text(
          LocaleKeys.search_wordNotFound.tr(),
          style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.background),
        ),
      ],
    );
  }

  Column _searchForSomething() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgWidget(
          icon: SvgNameEnum.search.icon,
          height: SizeEnum.fortyEight.value,
          color: context.colorScheme.onSecondary,
        ),
        context.emptySizedHeightBoxLow3x,
        Text(
          LocaleKeys.search_searchForSomething.tr(),
          style: context.textTheme.titleLarge?.copyWith(color: context.colorScheme.background),
        ),
      ],
    );
  }
}
