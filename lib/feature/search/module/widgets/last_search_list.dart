part of '../../view/search_view.dart';

class _LastSearchList extends StatelessWidget {
  const _LastSearchList();

  @override
  Widget build(BuildContext context) {
    return BaseView<HistoryViewModel>(
      viewModel: HistoryViewModel(),
      onPageBuilder: (context, value) {
        return ListView.builder(
          shrinkWrap: true,
          padding: context.paddingLow,
          itemCount: context.watch<HistoryViewModel>().historyWordBox.length + 1,
          itemBuilder: (BuildContext context, int index) {
            return index == 0 ? _lastSearchText(context) : _wordCard(context, index, value);
          },
        );
      },
    );
  }

  Padding _lastSearchText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.paddingNormal.top, left: context.paddingLow.left, bottom: context.paddingLow.bottom),
      child: Text(
        LocaleKeys.search_lastSearch.tr(),
        style: context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background),
      ),
    );
  }

  WordCard _wordCard(BuildContext context, int index, HistoryViewModel value) {
    return WordCard(
      title: value.historyWordBox.getAt(index - 1),
      onTap: () {
        DetailViewModel.word = value.historyWordBox.getAt(index - 1)?.toLowerCase();
        context.router.navigate(
          const DetailTabBarRoute(),
        );
      },
    );
  }
}
