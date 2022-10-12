import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

import '../../constants/enums/size_enum.dart';

class DetailMeaningsListShimmer extends StatelessWidget {
  const DetailMeaningsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const int itemCount = 5;
    return Container(
      margin: context.onlyTopPaddingMedium,
      color: context.colorScheme.primary,
      child: Shimmer.fromColors(
        baseColor: context.colorScheme.secondary,
        highlightColor: context.colorScheme.primary,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: context.paddingNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.emptySizedHeightBoxLow3x,
                  Container(
                      height: SizeEnum.twenty.value, width: SizeEnum.fifty.value, color: context.colorScheme.primary),
                  context.emptySizedHeightBoxLow3x,
                  Container(
                    height: SizeEnum.twenty.value,
                    width: context.dynamicWidth(SizeEnum.zEight.value),
                    color: context.colorScheme.primary,
                  ),
                  context.emptySizedHeightBoxLow,
                  Container(
                    height: SizeEnum.twenty.value,
                    width: context.dynamicWidth(SizeEnum.zFour.value),
                    color: context.colorScheme.primary,
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Padding(
                    padding: context.horizontalPaddingMedium,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: SizeEnum.twenty.value,
                          width: context.dynamicWidth(SizeEnum.zNine.value),
                          color: context.colorScheme.primary,
                        ),
                        context.emptySizedHeightBoxLow,
                        Container(
                          height: SizeEnum.twenty.value,
                          width: context.dynamicWidth(SizeEnum.zFour.value),
                          color: context.colorScheme.primary,
                        ),
                        context.emptySizedHeightBoxLow3x,
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(height: SizeEnum.two.value, color: context.colorScheme.primary);
          },
        ),
      ),
    );
  }
}
