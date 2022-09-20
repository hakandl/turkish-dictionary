import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DetailWordInfoCard extends StatelessWidget {
  const DetailWordInfoCard({
    Key? key,
    required this.anlamSira,
    required this.ozellikAdi,
    required this.anlam,
    required this.ornekAdi,
    required this.yazarAdi,
  }) : super(key: key);
  final String anlamSira;
  final String ozellikAdi;
  final String anlam;
  final String ornekAdi;
  final String yazarAdi;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: context.colorScheme.primary,
      child: SizedBox(
        width: context.dynamicWidth(1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.paddingNormal,
              child: Row(
                children: [
                  Padding(
                    padding: context.onlyRightPaddingLow,
                    child: Text(
                      anlamSira,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    ozellikAdi,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSecondary,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: context.paddingNormal.left,
                right: context.paddingNormal.right,
                bottom: context.paddingLow.bottom,
              ),
              child: Text(
                anlam,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.background,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: context.paddingMedium.left,
                right: context.paddingMedium.right,
                bottom: context.paddingLow.bottom,
              ),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: context.colorScheme.onSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: ornekAdi),
                    TextSpan(text: yazarAdi, style: const TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
