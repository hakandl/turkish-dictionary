import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/enums/size_enum.dart';

class HomeCardShimmer extends StatelessWidget {
  const HomeCardShimmer({super.key, this.isLine = true});
  final bool isLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.primary,
      child: Shimmer.fromColors(
        baseColor: context.colorScheme.secondary,
        highlightColor: context.colorScheme.primary,
        child: IntrinsicHeight(
          child: Row(
            children: [
              isLine
                  ? Container(
                      width: SizeEnum.three.value,
                      height: double.infinity,
                      color: context.colorScheme.primary,
                      margin: EdgeInsets.only(
                          right: context.paddingLow.right,
                          left: context.paddingNormal.left,
                          top: context.paddingNormal.top,
                          bottom: context.paddingNormal.bottom),
                    )
                  : const SizedBox.shrink(),
              Expanded(
                child: Padding(
                  padding: context.paddingNormal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: context.onlyBottomPaddingLow,
                        child: Container(
                          height: SizeEnum.twenty.value,
                          width: context.width / SizeEnum.three.value,
                          color: context.colorScheme.primary,
                        ),
                      ),
                      Container(
                        height: SizeEnum.twenty.value,
                        width: context.width / SizeEnum.oneFive.value,
                        color: context.colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
