import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/history/viewmodel/history_viewmodel.dart';
import 'package:turkce_sozluk/product/widgets/button/circle_elevated_button.dart';
import 'package:turkce_sozluk/product/widgets/card/detail_word_card.dart';
import '../../detail/viewmodel/detail_viewmodel.dart';
import '../../../product/constants/enums/size_enum.dart';
import '../../../product/init/navigator/app_router.dart';

import '../../../../product/widgets/input/textfield.dart';
import '../../../../product/widgets/svg.dart';
import '../../../product/constants/enums/string_enum.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/constants/enums/svg_enum.dart';
import '../../../product/widgets/button/text_button.dart';
import '../viewmodel/search_viewmodel.dart';

part '../module/widgets/word_card_list.dart';
part '../module/widgets/last_search_list.dart';
part '../module/widgets/search_for_something.dart';

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
                  const Expanded(
                    child: SearchTextFieldContainer(),
                  ),
                  TurkceSozlukTextButton(
                    text: LocaleKeys.button_cancel.tr(),
                    textStyle: context.textTheme.titleMedium,
                    onPressed: () => context.pop(),
                  )
                ],
              ),
            ),
            _specialWordContainer(context),
            Expanded(
              child: context.watch<SearchViewModel>().searchTextField.text.isNotEmpty &&
                      context.watch<SearchViewModel>().filteredData.isEmpty
                  ? _nonWord(context)
                  : context.watch<SearchViewModel>().searchTextField.text.isEmpty
                      ? context.watch<HistoryViewModel>().historyWordBox.length >= 1
                          ? const _LastSearchList()
                          : const _SearchForSomething()
                      : const _WordCardList(),
            ),
          ],
        ),
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
        onPressed: () => context.read<SearchViewModel>().insertSpecialWord(word),
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
}

class SearchTextFieldContainer extends StatelessWidget {
  const SearchTextFieldContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeEnum.fifty.value,
      padding: context.onlyLeftPaddingNormal,
      child: NormalTextField(
        style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background),
        controller: context.watch<SearchViewModel>().searchTextField,
        title: LocaleKeys.search_searchInTurkishDictionary.tr(),
        radius: context.lowRadius.x,
        icon: _searchIcon(context),
        suffixIcon: context.watch<SearchViewModel>().searchTextField.text.isNotEmpty
            ? _textClearButton(context)
            : const SizedBox.shrink(),
        onChanged: (value) => context.read<SearchViewModel>().wordFilter(value),
      ),
    );
  }

  Padding _searchIcon(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: SvgWidget(
        icon: SvgNameEnum.search.icon,
        color: context.colorScheme.background,
      ),
    );
  }

  TurkceSozlukCircleElevatedButton _textClearButton(BuildContext context) {
    return TurkceSozlukCircleElevatedButton(
      backgroundColor: Colors.transparent,
      elevation: SizeEnum.zero.value,
      child: SvgWidget(
        icon: SvgNameEnum.x.icon,
        color: context.colorScheme.background,
      ),
      onPressed: () => context.read<SearchViewModel>().clearText(),
    );
  }
}
