import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/widgets/button/icon_text_button.dart';
import 'package:turkce_sozluk/product/widgets/button/material_button.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.paddingNormal,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'title',
              style: context.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'subtitle',
              style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: context.verticalPaddingMedium,
              child: Row(
                children: [
                  TurkceSozlukMaterialButton(
                    color: Colors.white,
                    child: SvgWidget(
                      icon: IconNameEnum.voice.value,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  context.emptySizedWidthBoxLow3x,
                  TurkceSozlukMaterialButton(
                    color: Colors.white,
                    child: SvgWidget(
                      icon: IconNameEnum.fav.value,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  TurkceSozlukIconTextButton(
                    text: 'Türk İşaret Dili',
                    icon: SvgWidget(
                      icon: IconNameEnum.hand.value,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: context.lowBorderRadius,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
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
            },
            separatorBuilder: (context, index) {
              return Container(color: Colors.white, child: const Divider());
            },
          ),
        )
      ],
    );
  }
}
