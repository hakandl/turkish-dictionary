import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 3,
              height: double.infinity,
              color: context.colorScheme.secondary,
              margin: EdgeInsets.only(
                left: context.onlyLeftPaddingNormal.left,
                top: context.onlyTopPaddingNormal.top,
                bottom: context.onlyBottomPaddingNormal.bottom,
              ),
            ),
            Expanded(
              child: Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: context.onlyBottomPaddingLow,
                      child: Text(
                        'data' * 2,
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: context.colorScheme.background, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      'data' * 5,
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
