import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

class DetailMeaningsListShimmer extends StatelessWidget {
  const DetailMeaningsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.onlyTopPaddingMedium,
      color: context.colorScheme.primary,
      child: Shimmer.fromColors(
        baseColor: context.colorScheme.secondary,
        highlightColor: context.colorScheme.primary,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: context.paddingNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  context.emptySizedHeightBoxLow3x,
                  Container(height: 20, width: 50, color: context.colorScheme.primary),
                  context.emptySizedHeightBoxLow3x,
                  Container(
                    height: 20,
                    width: context.dynamicWidth(.8),
                    color: context.colorScheme.primary,
                  ),
                  context.emptySizedHeightBoxLow,
                  Container(
                    height: 20,
                    width: context.dynamicWidth(.4),
                    color: context.colorScheme.primary,
                  ),
                  context.emptySizedHeightBoxLow3x,
                  Padding(
                    padding: context.horizontalPaddingMedium,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: context.dynamicWidth(.9),
                          color: context.colorScheme.primary,
                        ),
                        context.emptySizedHeightBoxLow,
                        Container(
                          height: 20,
                          width: context.dynamicWidth(.4),
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
            return Container(height: 2, color: context.colorScheme.primary);
          },
        ),
      ),
    );
  }
}
