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
              child: const _SyydCardHorizontalList(),
            ),
          );
  }
}

class _SyydCardHorizontalList extends StatelessWidget {
  const _SyydCardHorizontalList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: HomeViewModel.pageController,
      thumbVisibility: true,
      trackVisibility: true,
      interactive: true,
      child: _list(context),
    );
  }

  PageView _list(BuildContext context) {
    return PageView.builder(
      controller: HomeViewModel.pageController,
      scrollDirection: Axis.horizontal,
      itemCount: context.watch<HomeViewModel>().syyd?.length ?? 0,
      itemBuilder: (context, index) {
        return _SyydCardBody(
          title: context.watch<HomeViewModel>().syyd?[index].wrongWord ?? LocaleKeys.info_notFound.tr(),
          subtitle: context.watch<HomeViewModel>().syyd?[index].correctWord ?? LocaleKeys.info_notFound.tr(),
          onTap: () {
            DetailViewModel.word = context.read<HomeViewModel>().syyd?[index].correctWord?.detailWordColon();
            context.router.navigate(const DetailTabBarRoute());
          },
        );
      },
    );
  }
}

class _SyydCardBody extends StatelessWidget {
  const _SyydCardBody({required this.title, required this.subtitle, this.onTap});
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
          _wrongWord(context),
          _correctWord(context),
        ],
      ),
    );
  }

  Row _wrongWord(BuildContext context) {
    return Row(
      children: [
        SvgWidget(icon: SvgNameEnum.x.icon),
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
    );
  }

  Row _correctWord(BuildContext context) {
    return Row(
      children: [
        SvgWidget(icon: SvgNameEnum.check.icon),
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
    );
  }
}
