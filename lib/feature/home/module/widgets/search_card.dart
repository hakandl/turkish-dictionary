part of '../../../home/view/home_view.dart';

class _SearchCard extends StatelessWidget {
  const _SearchCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainerWidget(
      closedElevation: SizeEnum.four.value,
      openBuilder: (BuildContext context, VoidCallback openContainer) {
        return const SearchView();
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
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
            Padding(
              padding: context.horizontalPaddingNormal,
              child: SvgWidget(icon: SvgNameEnum.search.icon),
            ),
            Text(
              LocaleKeys.search_searchInTurkishDictionary.tr(),
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.background,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
