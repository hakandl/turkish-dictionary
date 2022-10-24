import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/core/base/view/base_view.dart';
import 'package:turkce_sozluk/feature/history/viewmodel/history_viewmodel.dart';
import 'package:turkce_sozluk/product/widgets/button/circle_elevated_button.dart';
import 'package:turkce_sozluk/product/widgets/card/word_card.dart';
import 'package:turkce_sozluk/product/widgets/container/icon_text_info_widget.dart';
import '../../../product/constants/enums/string/string_constants.dart';
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

part '../module/widgets/search_textfield_container.dart';
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
    return BaseView<SearchViewModel>(
      viewModel: SearchViewModel(),
      onPageBuilder: (context, value) {
        return SafeArea(
          child: Scaffold(
            body: _body(context, value),
          ),
        );
      },
    );
  }

  Column _body(BuildContext context, SearchViewModel value) {
    return Column(
      children: [
        _textFieldAndCancelButton(context),
        _specialWordContainer(context, value),
        Expanded(
          child: _textFieldEmpty(context)
              ? _historyWordBoxLengthOneAndOver(context)
                  ? const _LastSearchList()
                  : const _SearchForSomething()
              : const _WordCardList(),
        ),
      ],
    );
  }

  Padding _textFieldAndCancelButton(BuildContext context) {
    return Padding(
      padding: context.onlyTopPaddingNormal,
      child: Row(
        children: [
          const Expanded(
            child: _SearchTextFieldContainer(),
          ),
          TurkceSozlukTextButton(
            text: LocaleKeys.button_cancel.tr(),
            textStyle: context.textTheme.titleMedium,
            onPressed: () => context.pop(),
          )
        ],
      ),
    );
  }

  Container _specialWordContainer(BuildContext context, SearchViewModel value) {
    return Container(
      margin: context.onlyTopPaddingNormal,
      color: context.colorScheme.secondary,
      height: SizeEnum.fortyEight.value,
      child: Row(
        children: [
          for (int i = 0; i < SpecialWordEnum.values.length; i++) _specialWord(SpecialWordEnum.values[i].value, value),
        ],
      ),
    );
  }

  Expanded _specialWord(String word, SearchViewModel value) {
    return Expanded(
      child: TurkceSozlukTextButton(
        text: word,
        textStyle: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
        onPressed: () => value.insertSpecialWord(word),
      ),
    );
  }

  bool _textFieldEmpty(BuildContext context) => context.watch<SearchViewModel>().searchTextField.text.isEmpty;

  bool _historyWordBoxLengthOneAndOver(BuildContext context) =>
      context.watch<HistoryViewModel>().historyWordBox.length >= 1;
}
