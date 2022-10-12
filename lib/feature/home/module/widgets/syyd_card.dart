part of '../../../home/view/home_view.dart';

class _SyydCard extends StatelessWidget {
  const _SyydCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeightCard(
      child: SizedBox(
        height: context.dynamicHeight(SizeEnum.zTen.value),
        child: Scrollbar(
          controller: HomeViewModel.pageController,
          thumbVisibility: true,
          trackVisibility: true,
          interactive: true,
          child: PageView.builder(
            controller: HomeViewModel.pageController,
            scrollDirection: Axis.horizontal,
            itemCount: context.watch<HomeViewModel>().syyd?.length ?? 0,
            itemBuilder: (context, index) {
              return HomeInfoColumnCard(
                title: context.watch<HomeViewModel>().syyd?[index].wrongWord ?? LocaleKeys.not_found.tr(),
                subtitle: context.watch<HomeViewModel>().syyd?[index].correctWord ?? LocaleKeys.not_found.tr(),
              );
            },
          ),
        ),
      ),
    );
  }
}
