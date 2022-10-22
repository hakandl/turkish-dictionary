part of '../../view/detail_view.dart';

class DetailWordList extends StatelessWidget {
  const DetailWordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<DetailViewModel>().isLoading ? const DetailMeaningsListShimmer() : detailMeaningsList(context);
  }

  ClipRRect detailMeaningsList(BuildContext context) {
    return ClipRRect(
      borderRadius: context.lowBorderRadius,
      child: _detailsList(context),
    );
  }

  ListView _detailsList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.watch<DetailViewModel>().detailList?.length,
      itemBuilder: (_, detailIndex) {
        return Column(
          children: [_detailsListWord(context, detailIndex), _meaningsList(context, detailIndex)],
        );
      },
    );
  }

  Container _detailsListWord(BuildContext context, int detailIndex) {
    return Container(
      margin: context.onlyBottomPaddingNormal,
      alignment: Alignment.centerLeft,
      child: context.watch<DetailViewModel>().detailList!.length > SizeEnum.one.value.toInt()
          ? Text(
              '${context.watch<DetailViewModel>().detailList?[detailIndex].word} (${detailIndex + SizeEnum.one.value.toInt()})',
              style: context.textTheme.headlineSmall?.copyWith(
                color: context.colorScheme.background,
                fontWeight: FontWeight.w700,
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  ListView _meaningsList(BuildContext context, int detailIndex) {
    return ListView.separated(
      padding: context.onlyBottomPaddingNormal,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:
          context.watch<DetailViewModel>().detailList?[detailIndex].meaningsList?.length ?? SizeEnum.zero.value.toInt(),
      itemBuilder: (_, meaningsIndex) {
        final detail = context.watch<DetailViewModel>().detailList?[detailIndex].meaningsList?[meaningsIndex];
        return _meaningsDetailCard(detail);
      },
      separatorBuilder: (context, index) {
        return Container(color: context.colorScheme.primary, child: const Divider());
      },
    );
  }

  _DetailWordInfoCard _meaningsDetailCard(MeaningsList? detail) {
    return _DetailWordInfoCard(
      meaningOrder: detail?.orderMeaning ?? TurkceSozlukStringConstants.empty,
      featuresName: detail?.featuresList?.map((e) => e.fullName).join(TurkceSozlukStringConstants.comma) ??
          TurkceSozlukStringConstants.detailListDefaultExample,
      meaning: detail?.meaning ?? TurkceSozlukStringConstants.empty,
      exampleName: detail?.examplesList?.map((e) => e.example).join(TurkceSozlukStringConstants.separator) ??
          TurkceSozlukStringConstants.empty,
      authorName: detail?.examplesList == null
          ? TurkceSozlukStringConstants.empty
          : detail?.examplesList?[0].authorId == '0'
              ? TurkceSozlukStringConstants.empty
              : '${TurkceSozlukStringConstants.dash} ${detail?.examplesList?[0].author?[0].fullName}',
    );
  }
}
