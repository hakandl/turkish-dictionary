import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/enums/size_enum.dart';

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
          height: SizeEnum.thirty.value,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }
}
