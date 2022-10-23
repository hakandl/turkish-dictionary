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
              child: isLink ? _LinkCard(title: title) : _TextCard(title: title, subtitle: subtitle),
            ),
          );
  }
}

class _LinkCard extends StatelessWidget {
  const _LinkCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _title(context),
          ),
          SvgWidget(icon: SvgNameEnum.right.icon)
        ],
      ),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      title,
      style:
          context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
    );
  }
}

class _TextCard extends StatelessWidget {
  const _TextCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(context),
        _subtitle(context),
      ],
    );
  }

  Widget _title(BuildContext context) {
    return Padding(
      padding: context.onlyBottomPaddingLow,
      child: Text(
        title,
        style:
            context.textTheme.titleMedium?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
      ),
    );
  }

  Text _subtitle(BuildContext context) {
    return Text(
      subtitle ?? TurkceSozlukStringConstants.empty,
      style:
          context.textTheme.titleMedium?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w400),
    );
  }
}
