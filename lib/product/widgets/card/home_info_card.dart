import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/constants/enums/string/string_constants.dart';
import 'intrinsic_height_card.dart';
import '../shimmer/home_card_shimmer.dart';
import '../svg.dart';

import '../../../feature/home/viewmodel/home_viewmodel.dart';
import '../../constants/enums/svg_enum.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({super.key, required this.title, this.subtitle, this.isLink = false, this.onTap});
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
                          SvgWidget(
                            icon: SvgNameEnum.right.icon,
                            color: context.colorScheme.background,
                          )
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
