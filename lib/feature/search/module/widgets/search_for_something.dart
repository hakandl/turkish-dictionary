part of '../../view/search_view.dart';

class _SearchForSomething extends StatelessWidget {
  const _SearchForSomething();

  @override
  Widget build(BuildContext context) {
    return IconAndTextInfoWidget(
      text: LocaleKeys.search_searchForSomething.tr(),
      icon: SvgNameEnum.search.icon,
    );
  }
}
