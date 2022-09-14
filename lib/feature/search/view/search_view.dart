import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/feature/detail/view/tabbar/detail_tabbar_view.dart';
import 'package:turkce_sozluk/product/widgets/button/text_button.dart';

import '../../../../product/widgets/input/textfield.dart';
import '../../../../product/widgets/svg.dart';
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
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                        radius: context.lowRadius.x,
                        icon: Padding(
                          padding: context.paddingNormal,
                          child: SvgWidget(
                            icon: IconNameEnum.search.value,
                            color: Colors.red,
                          ),
                        ),
                        suffixIcon: searchTextField.text.isNotEmpty
                            ? Padding(
                                padding: context.paddingNormal,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    setState(() => searchTextField.clear());
                                  },
                                  icon: SvgWidget(
                                    icon: IconNameEnum.x.value,
                                    color: Colors.red,
                                  ),
                                ))
                            : const SizedBox.shrink(),
                        onChanged: (value) => runFilter(value),
                      ),
                    ),
                  ),
                  const TurkceSozlukTextButton(
                    text: 'Vazgeç',
                  )
                  /* TextButton(
                    onPressed: () => context.pop(),
                    child: Padding(
                      padding: context.horizontalPaddingLow,
                      child: const Text('Vazgeç'),
                    ),
                  ) */
                ],
              ),
            ),
            Container(
              margin: context.onlyTopPaddingNormal,
              color: Colors.grey.shade300,
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
                          color: Colors.grey,
                        ),
                        context.emptySizedHeightBoxLow3x,
                        const Text('Aradığınız sözcük bulunamadı.'),
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
                                child: const Text('Son Aramalar'),
                              );
                            }
                            return const Card(
                              child: ListTile(),
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: filteredData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: context.paddingLow.horizontal,
                                vertical: context.paddingLow.top,
                              ),
                              child: Card(
                                color: Colors.white,
                                margin: EdgeInsets.zero,
                                elevation: 0,
                                child: ListTile(
                                  trailing: SvgWidget(
                                    icon: IconNameEnum.right.value,
                                    color: searchTextField.text == filteredData[index].madde ? Colors.red : Colors.grey,
                                  ),
                                  shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
                                  title: RichText(
                                    text: TextSpan(
                                      text: filteredData[index].madde!.substring(0, searchTextField.text.length),
                                      style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                                      children: [
                                        TextSpan(
                                          text: filteredData[index].madde!.substring(searchTextField.text.length),
                                          style: context.textTheme.titleMedium
                                              ?.copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () => context.navigateToPage(DetailTabBarView(
                                    word: filteredData[index].madde ?? '',
                                  )),
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
      child: TextButton(
        onPressed: () => insertSpecialWord(word, searchTextField),
        child: Text(
          word,
          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
