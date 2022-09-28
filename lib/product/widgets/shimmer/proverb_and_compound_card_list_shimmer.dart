import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

class ProverbAndCompoundCardListShimmer extends StatelessWidget {
  const ProverbAndCompoundCardListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.onlyTopPaddingMedium,
      color: context.colorScheme.primary,
      child: Shimmer.fromColors(
        baseColor: context.colorScheme.secondary,
        highlightColor: context.colorScheme.primary,
        child: Container(
          margin: context.paddingNormal,
          height: 30,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
