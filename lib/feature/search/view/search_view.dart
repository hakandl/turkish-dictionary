import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/widgets/button/icon_button.dart';

import '../../../../product/widgets/input/textfield.dart';
import '../../../../product/widgets/svg.dart';
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
                    child: Container(
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
                        title: 'Türkçe Sözlükte Ara',
                        radius: context.lowRadius.x,
                        icon: Padding(
                          padding: context.paddingNormal,
                          child: SvgWidget(
                            icon: IconNameEnum.search.value,
                            color: context.colorScheme.background,
                          ),
                        ),
                        suffixIcon: searchTextField.text.isNotEmpty
                            ? TurkceSozlukIconButton(
                                child: SvgWidget(
                                  icon: IconNameEnum.x.value,
                                  color: context.colorScheme.background,
                                ),
                                onPressed: () => setState(() => searchTextField.clear()),
                              )
                            : const SizedBox.shrink(),
                        onChanged: (value) => runFilter(value),
                      ),
                    ),
                  ),
                  TurkceSozlukTextButton(
                    text: 'Vazgeç',
                    textStyle: context.textTheme.titleMedium,
                    onPressed: () => context.pop(),
                  )
                ],
              ),
            ),
            Container(
              margin: context.onlyTopPaddingNormal,
              color: context.colorScheme.secondary,
              height: 48,
              child: Row(
                children: [
                  for (int i = 0; i < SpecialWordEnum.values.length; i++) specialWord(SpecialWordEnum.values[i].value),
                ],
              ),
            ),
            Expanded(
              child: searchTextField.text.isNotEmpty && filteredData.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgWidget(
                          icon: IconNameEnum.book.value,
                          height: 48,
                          color: context.colorScheme.background,
                        ),
                        context.emptySizedHeightBoxLow3x,
                        Text(
                          'Aradığınız sözcük bulunamadı.',
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    )
                  : searchTextField.text.isEmpty
                      ? ListView.builder(
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
                                  'Son Aramalar',
                                  style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background),
                                ),
                              );
                            }
                            return const Card(
                              child: ListTile(),
                            );
                          },
                        )
                      : ListView.builder(
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
                                  trailing:
                                      SvgWidget(icon: IconNameEnum.right.value, color: context.colorScheme.onSecondary),
                                  shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
                                  title: RichText(
                                    text: TextSpan(
                                      text: filteredData[index].madde!.substring(0, searchTextField.text.length),
                                      style: context.textTheme.titleMedium?.copyWith(
                                          color: context.colorScheme.background, fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                          text: filteredData[index].madde!.substring(searchTextField.text.length),
                                          style: context.textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: context.colorScheme.onSurface,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () => context.navigateToPage(
                                    DetailTabBarView(
                                      word: filteredData[index].madde ?? '',
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            )
          ],
        ),
      ),
    );
  }

  Expanded specialWord(String word) {
    return Expanded(
      child: TurkceSozlukTextButton(
        onPressed: () => insertSpecialWord(word, searchTextField),
        text: word,
        textStyle: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
