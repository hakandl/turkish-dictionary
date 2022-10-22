part of '../../../home/view/home_view.dart';

class _HomeInfoCard extends StatelessWidget {
  const _HomeInfoCard({required this.title, this.subtitle, this.isLink = false, this.onTap});
  final String title;
  final String? subtitle;
  final bool isLink;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return context.watch<HomeViewModel>().isLoading
        ? const HomeCardShimmer()
        : IntrinsicHeightCard(
            child: InkWell(
              onTap: onTap,
              child: isLink
                  ? Padding(
                      padding: context.paddingLow,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: context.textTheme.titleMedium
                                  ?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SvgWidget(icon: SvgNameEnum.right.icon)
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: context.onlyBottomPaddingLow,
                          child: Text(
                            title,
                            style: context.textTheme.titleMedium
                                ?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          subtitle ?? TurkceSozlukStringConstants.empty,
                          style: context.textTheme.titleMedium
                              ?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
            ),
          );
  }
}
