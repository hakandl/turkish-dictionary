part of '../../view/search_view.dart';

class _WordCardList extends StatelessWidget {
  const _WordCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: context.verticalPaddingMedium,
      shrinkWrap: true,
      itemCount: context.watch<SearchViewModel>().filteredData.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingLow.horizontal,
            vertical: context.paddingLow.top,
          ),
          child: _wordCard(context, index),
        );
      },
    );
  }

  Card _wordCard(BuildContext context, int index) {
    return Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        trailing: SvgWidget(icon: SvgNameEnum.right.icon, color: context.colorScheme.onSecondary),
        shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
        title: RichText(
          text: TextSpan(
            text: context
                .watch<SearchViewModel>()
                .filteredData[index]
                .word!
                .substring(0, context.watch<SearchViewModel>().searchTextField.text.length),
            style: context.textTheme.titleMedium
                ?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
            children: [
              TextSpan(
                text: context
                    .watch<SearchViewModel>()
                    .filteredData[index]
                    .word!
                    .substring(context.watch<SearchViewModel>().searchTextField.text.length),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.colorScheme.onSurface,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          DetailViewModel.word = context.read<SearchViewModel>().filteredData[index].word?.toLowerCase();
          context.router.navigate(
            const DetailTabBarRoute(),
          );
        },
      ),
    );
  }
}
