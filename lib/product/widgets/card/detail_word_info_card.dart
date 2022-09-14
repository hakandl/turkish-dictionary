import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class DetailWordInfoCard extends StatelessWidget {
  const DetailWordInfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(1),
      color: Colors.white,
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
                      // color: AppColor.slateGray,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Text(
                  'İSİM',
                  style: context.textTheme.bodySmall?.copyWith(
                      // color: AppColor.alizarinCrimson,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.onlyLeftPaddingNormal.left,
              bottom: context.onlyBottomPaddingLow.bottom,
            ),
            child: Text(
              'Yazma, çizme vb. işlerde kullanılan çeşitli biçimlerde araç:',
              style: context.textTheme.bodyMedium?.copyWith(
                // color: AppColor.fireFly,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.onlyLeftPaddingMedium.left,
              bottom: context.onlyBottomPaddingLow.bottom,
            ),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  // color: AppColor.slateGray,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(text: '"Kâğıt, kalem, mürekkep, hepsi masanın üstündedir." '),
                  TextSpan(text: '- Falih Rıfkı Atay', style: TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
