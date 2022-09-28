import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

class DetailModalSheetShimmer extends StatelessWidget {
  const DetailModalSheetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colorScheme.secondary,
      highlightColor: context.colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Container80(),
              Container80(),
              Container80(),
              Container80(),
            ],
          ),
          context.emptySizedHeightBoxLow,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Container40(),
              Container40(),
              Container40(),
              Container40(),
            ],
          ),
        ],
      ),
    );
  }
}

class Container80 extends StatelessWidget {
  const Container80({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      color: context.colorScheme.primary,
    );
  }
}

class Container40 extends StatelessWidget {
  const Container40({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 60,
      color: context.colorScheme.primary,
    );
  }
}
