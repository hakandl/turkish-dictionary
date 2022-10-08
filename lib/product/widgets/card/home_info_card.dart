import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/widgets/card/intrinsic_height_card.dart';
import 'package:turkce_sozluk/product/widgets/shimmer/home_card_shimmer.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';

import '../../../feature/home/viewmodel/home_viewmodel.dart';

// HOME INFO CARD

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({super.key, required this.title, required this.subtitle, this.isLink = false, this.onTap});
  final String title;
  final String subtitle;
  final bool isLink;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return context.watch<HomeViewModel>().isLoading
        ? const HomeCardShimmer()
        : IntrinsicHeightCard(
            child: isLink
                ? InkWell(
                    onTap: onTap,
                    child: Padding(
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
                          SvgWidget(
                            icon: IconNameEnum.right.value,
                            color: context.colorScheme.background,
                          )
                        ],
                      ),
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
                        subtitle,
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
          );
  }
}

// HOME INFO COLUMN CARD

class HomeInfoColumnCard extends StatelessWidget {
  const HomeInfoColumnCard({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            SvgWidget(icon: IconNameEnum.x.value),
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
            SvgWidget(icon: IconNameEnum.check.value),
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
    );
  }
}
