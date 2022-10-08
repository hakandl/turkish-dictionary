import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

class DetailTopViewShimmer extends StatelessWidget {
  const DetailTopViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.secondary,
      highlightColor: context.colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width / 3,
            color: context.colorScheme.primary,
          ),
          context.emptySizedHeightBoxLow,
          Container(
            height: 20,
            width: MediaQuery.of(context).size.width / 5,
            color: context.colorScheme.primary,
          ),
          context.emptySizedHeightBoxNormal,
          Row(
            children: [
              CircleAvatar(
                backgroundColor: context.colorScheme.primary,
                radius: 24,
              ),
              const Spacer(),
              Container(
                height: 48,
                width: context.dynamicWidth(0.35),
                decoration: BoxDecoration(color: context.colorScheme.primary, borderRadius: context.highBorderRadius),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
