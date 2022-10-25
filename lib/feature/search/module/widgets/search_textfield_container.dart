part of '../../view/search_view.dart';

class _SearchTextFieldContainer extends StatelessWidget {
  const _SearchTextFieldContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeEnum.fifty.value,
      padding: context.onlyLeftPaddingNormal,
      child: NormalTextField(
        title: LocaleKeys.search_searchInTurkishDictionary.tr(),
        fillColor: context.colorScheme.secondary,
        style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background),
        controller: context.watch<SearchViewModel>().searchTextField,
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
      ),
    );
  }

  TurkishDictionaryCircleElevatedButton _textClearButton(BuildContext context) {
    return TurkishDictionaryCircleElevatedButton(
      backgroundColor: Colors.transparent,
      elevation: SizeEnum.zero.value,
      child: SvgWidget(
        icon: SvgNameEnum.x.icon,
      ),
      onPressed: () => context.read<SearchViewModel>().clearText(),
    );
  }
}
