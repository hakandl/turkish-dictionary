import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomeInfoCard extends StatelessWidget {
  const HomeInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 3,
              height: double.infinity,
              color: Colors.grey,
              margin: EdgeInsets.only(
                left: context.onlyLeftPaddingNormal.left,
                top: context.onlyTopPaddingMedium.top,
                bottom: context.onlyBottomPaddingMedium.bottom,
              ),
            ),
            Expanded(
                child: Padding(
              padding: context.paddingMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: context.onlyBottomPaddingLow,
                    child: Text(
                      'data' * 2,
                      style: context.textTheme.titleMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    'data' * 5,
                    style: context.textTheme.titleMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
