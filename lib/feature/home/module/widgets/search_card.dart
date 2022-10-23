part of '../../../home/view/home_view.dart';

class _SearchCard extends StatelessWidget {
  const _SearchCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainerWidget(
      closedElevation: SizeEnum.four.value,
      openBuilder: (_, VoidCallback openContainer) {
        return const SearchView();
      },
      closedBuilder: (_, VoidCallback openContainer) {
        return _card(context);
      },
    );
  }

  Card _card(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: SizedBox(
        width: context.dynamicWidth(SizeEnum.zNine.value),
        height: SizeEnum.fifty.value,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _searchIcon(context),
            _searchInTurkishDictionaryText(context),
          ],
        ),
      ),
    );
  }

  Padding _searchIcon(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingNormal,
      child: SvgWidget(icon: SvgNameEnum.search.icon),
    );
  }

  Text _searchInTurkishDictionaryText(BuildContext context) {
    return Text(
      LocaleKeys.search_searchInTurkishDictionary.tr(),
      style: context.textTheme.titleMedium?.copyWith(
        color: context.colorScheme.background,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
