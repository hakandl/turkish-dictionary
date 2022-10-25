part of '../../view/search_view.dart';

class _WordCardList extends StatelessWidget {
  const _WordCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<SearchViewModel>().searchTextField.text.isNotEmpty &&
            context.watch<SearchViewModel>().filteredData.isNotEmpty
        ? _list(context)
        : _nonWord(context);
  }

  ListView _list(BuildContext context) {
    return ListView.builder(
      padding: context.paddingLow,
      shrinkWrap: true,
      itemCount: context.watch<SearchViewModel>().filteredData.length,
      itemBuilder: (BuildContext context, int index) {
        return WordCard(
          child: _richText(context, index),
          onTap: () {
            DetailViewModel.word = context.read<SearchViewModel>().filteredData[index].word?.toLowerCase();
            context.router.navigate(
              const DetailTabBarRoute(),
            );
            context
                .read<HistoryViewModel>()
                .historyWordBox
                .put(DetailViewModel.word, DetailViewModel.word ?? TurkceSozlukStringConstants.empty);
          },
        );
      },
    );
  }

  RichText _richText(BuildContext context, int index) {
    return RichText(
      text: TextSpan(
        text: context
            .watch<SearchViewModel>()
            .filteredData[index]
            .word!
            .substring(0, context.watch<SearchViewModel>().searchTextField.text.length),
        style:
            context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
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
    );
  }

  Widget _nonWord(BuildContext context) {
    return IconAndTextInfoWidget(text: LocaleKeys.search_wordNotFound.tr());
  }
}
