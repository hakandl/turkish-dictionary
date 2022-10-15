part of '../../../home/view/home_view.dart';

class _SyydCard extends StatelessWidget {
  const _SyydCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<HomeViewModel>().isLoading
        ? const HomeCardShimmer()
        : IntrinsicHeightCard(
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
                      onTap: () {
                        DetailViewModel.word =
                            context.read<HomeViewModel>().syyd?[index].correctWord?.detailWordColon();
                        context.router.navigate(const DetailTabBarRoute());
                      },
                    );
                  },
                ),
              ),
            ),
          );
  }
}

class HomeInfoColumnCard extends StatelessWidget {
  const HomeInfoColumnCard({super.key, required this.title, required this.subtitle, this.onTap});
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              SvgWidget(icon: SvgNameEnum.x.icon, color: context.colorScheme.background),
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SvgWidget(icon: SvgNameEnum.check.icon, color: context.colorScheme.background),
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  subtitle,
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
