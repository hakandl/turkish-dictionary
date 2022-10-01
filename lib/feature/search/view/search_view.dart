import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/core/components/button/normal_icon_button.dart';
import 'package:turkce_sozluk/feature/detail/viewmodel/detail_viewmodel.dart';

import '../../../../product/widgets/input/textfield.dart';
import '../../../../product/widgets/svg.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/widgets/button/text_button.dart';
import '../../detail/view/tabbar/detail_tabbar_view.dart';
import '../viewmodel/search_viewmodel.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends SearchViewModel {
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
                      icon: IconNameEnum.left.value,
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
              child: searchTextField.text.isNotEmpty && filteredData.isEmpty
                  ? _nonWord(context)
                  : searchTextField.text.isEmpty
                      ? _lastSearchedWordList()
                      : _wordList(context),
            )
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
            color: Colors.black.withOpacity(0.1),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: 50,
      padding: context.onlyLeftPaddingNormal,
      child: NormalTextField(
        controller: searchTextField,
        title: LocaleKeys.search_searchInTurkishDictionary.tr(),
        radius: context.lowRadius.x,
        icon: Padding(
          padding: context.paddingNormal,
          child: SvgWidget(
            icon: IconNameEnum.search.value,
            color: context.colorScheme.background,
          ),
        ),
        onChanged: (value) => runFilter(value),
      ),
    );
  }

  Container _specialWordContainer(BuildContext context) {
    return Container(
      margin: context.onlyTopPaddingNormal,
      color: context.colorScheme.secondary,
      height: 48,
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
        onPressed: () => insertSpecialWord(word, searchTextField),
        text: word,
        textStyle: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  Column _nonWord(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgWidget(
          icon: IconNameEnum.confused.value,
          height: 48,
          color: context.colorScheme.onSecondary,
        ),
        context.emptySizedHeightBoxLow3x,
        Text(
          LocaleKeys.search_wordNotFound.tr(),
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }

  ListView _lastSearchedWordList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0 && searchTextField.text.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(
                left: context.onlyLeftPaddingNormal.left,
                top: context.onlyTopPaddingMedium.top,
                bottom: context.onlyBottomPaddingLow.bottom),
            child: Text(
              LocaleKeys.search_lastSearch.tr(),
              style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background),
            ),
          );
        }
        return const Card(
          child: ListTile(),
        );
      },
    );
  }

  ListView _wordList(BuildContext context) {
    return ListView.builder(
      padding: context.verticalPaddingMedium,
      shrinkWrap: true,
      itemCount: filteredData.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingLow.horizontal,
            vertical: context.paddingLow.top,
          ),
          child: Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              trailing: SvgWidget(icon: IconNameEnum.right.value, color: context.colorScheme.onSecondary),
              shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
              title: RichText(
                text: TextSpan(
                  text: filteredData[index].word!.substring(0, searchTextField.text.length),
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text: filteredData[index].word!.substring(searchTextField.text.length),
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.colorScheme.onSurface,
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                DetailViewModel.word = filteredData[index].word?.toLowerCase();
                context.navigateToPage(
                  const DetailTabBarView(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
