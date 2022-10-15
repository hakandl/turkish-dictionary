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
      child: detailsList(context),
    );
  }

  ListView detailsList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.watch<DetailViewModel>().detailList?.length,
      itemBuilder: (_, detailIndex) {
        return Column(
          children: [detailsListWord(context, detailIndex), meaningsList(context, detailIndex)],
        );
      },
    );
  }

  Container detailsListWord(BuildContext context, int detailIndex) {
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

  ListView meaningsList(BuildContext context, int detailIndex) {
    return ListView.separated(
      padding: context.onlyBottomPaddingNormal,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:
          context.watch<DetailViewModel>().detailList?[detailIndex].meaningsList?.length ?? SizeEnum.zero.value.toInt(),
      itemBuilder: (_, meaningsIndex) {
        final detail = context.watch<DetailViewModel>().detailList?[detailIndex].meaningsList?[meaningsIndex];
        return meaningsDetailCard(detail);
      },
      separatorBuilder: (context, index) {
        return Container(color: context.colorScheme.primary, child: const Divider());
      },
    );
  }

  DetailWordInfoCard meaningsDetailCard(MeaningsList? detail) {
    return DetailWordInfoCard(
      anlamSira: detail?.orderMeaning ?? TurkceSozlukStringConstants.empty,
      ozellikAdi: detail?.featuresList?.map((e) => e.fullName).join(TurkceSozlukStringConstants.comma) ??
          TurkceSozlukStringConstants.detailListDefaultExample,
      anlam: detail?.meaning ?? TurkceSozlukStringConstants.empty,
      ornekAdi: detail?.examplesList?.map((e) => e.example).join(TurkceSozlukStringConstants.separator) ??
          TurkceSozlukStringConstants.empty,
      yazarAdi: detail?.examplesList?[0].authorId == null
          ? TurkceSozlukStringConstants.empty
          : ' ${detail?.examplesList?[0].author?[0].fullName ?? TurkceSozlukStringConstants.empty}',
    );
  }
}
