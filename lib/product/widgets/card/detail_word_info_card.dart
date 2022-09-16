import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DetailWordInfoCard extends StatelessWidget {
  const DetailWordInfoCard({
    Key? key,
  }) : super(key: key);

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
                      '1',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    'İSİM',
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
                'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç:',
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
                  children: const [
                    TextSpan(text: '"Kâğıt, kalem, mürekkep, hepsi masanın üstündedir." '),
                    TextSpan(text: '- Falih Rıfkı Atay', style: TextStyle(fontWeight: FontWeight.w700)),
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
