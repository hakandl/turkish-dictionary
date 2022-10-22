import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/enums/size_enum.dart';

class DetailTopViewShimmer extends StatelessWidget {
  const DetailTopViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const double radius = 24;
    return Shimmer.fromColors(
      baseColor: context.colorScheme.secondary,
      highlightColor: context.colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeEnum.twentyFive.value,
            width: context.width / SizeEnum.three.value,
            color: context.colorScheme.primary,
          ),
          context.emptySizedHeightBoxLow,
          Container(
            height: SizeEnum.twenty.value,
            width: context.width / SizeEnum.five.value,
            color: context.colorScheme.primary,
          ),
          context.emptySizedHeightBoxNormal,
          Row(
            children: [
              CircleAvatar(
                backgroundColor: context.colorScheme.primary,
                radius: radius,
              ),
              context.emptySizedWidthBoxLow3x,
              CircleAvatar(
                backgroundColor: context.colorScheme.primary,
                radius: radius,
              ),
              const Spacer(),
              Container(
                height: SizeEnum.fortyEight.value,
                width: context.dynamicWidth(SizeEnum.zThirtyFive.value),
                decoration: BoxDecoration(color: context.colorScheme.primary, borderRadius: context.highBorderRadius),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
