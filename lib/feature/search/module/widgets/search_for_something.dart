part of '../../view/search_view.dart';

class _SearchForSomething extends StatelessWidget {
  const _SearchForSomething();

  @override
  Widget build(BuildContext context) {
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
