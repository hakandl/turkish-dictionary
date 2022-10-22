part of '../../view/search_view.dart';

class _WordCardList extends StatelessWidget {
  const _WordCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: context.paddingLow,
      shrinkWrap: true,
      itemCount: context.watch<SearchViewModel>().filteredData.length,
      itemBuilder: (BuildContext context, int index) {
        return WordCard(
          child: RichText(
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
            context
                .read<HistoryViewModel>()
                .historyWordBox
                .put(index, DetailViewModel.word ?? TurkceSozlukStringConstants.empty);
          },
        );
      },
    );
  }
}
