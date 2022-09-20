import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/service/detail_service.dart';
import 'package:turkce_sozluk/feature/detail/viewmodel/detail_viewmodel.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';
import 'package:turkce_sozluk/product/widgets/modal/bottom_modal_sheet.dart';

import '../../../product/widgets/button/icon_text_button.dart';
import '../../../product/widgets/button/circle_elevated_button.dart';
import '../../../product/widgets/card/detail_word_info_card.dart';
import '../../../product/widgets/svg.dart';

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
      children: const [
        DetailTop(),
        DetailWordList(),
      ],
    );
  }
}

class DetailTop extends StatelessWidget with TurkceSozlukModalSheet {
  const DetailTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DetailViewModel(DetailService(ProjectNetworkManager.instance.service)),
      builder: (context, child) {
        var detail = context.watch<DetailViewModel>().detailList;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detail?[0].madde ?? 'bos',
              style: context.textTheme.headlineLarge?.copyWith(
                color: context.colorScheme.background,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '${detail?[0].telaffuz ?? ''} ${detail?[0].lisan ?? ''}',
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: context.verticalPaddingMedium,
              child: Row(
                children: [
                  TurkceSozlukCircleElevatedButton(
                    child: SvgWidget(
                      icon: IconNameEnum.voice.value,
                      color: context.colorScheme.onSecondary,
                    ),
                    onPressed: () {},
                  ),
                  TurkceSozlukCircleElevatedButton(
                    child: SvgWidget(
                      icon: IconNameEnum.fav.value,
                      color: context.colorScheme.onSecondary,
                    ),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  TurkceSozlukIconTextButton(
                    text: 'Türk İşaret Dili',
                    textStyle: TextStyle(color: context.colorScheme.onSecondary),
                    icon: SvgWidget(
                      icon: IconNameEnum.hand.value,
                      color: context.colorScheme.onSecondary,
                    ),
                    onPressed: () => showTurkceSozlukModalSheet(
                        context,
                        Expanded(
                          child: ListView.builder(
                            padding: context.horizontalPaddingMedium,
                            scrollDirection: Axis.horizontal,
                            itemCount: detail?[0].madde?.length ?? 1,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: context.dynamicHeight(0.10),
                                    child: Card(
                                      shape: UnderlineInputBorder(
                                          borderSide: BorderSide(color: context.colorScheme.onSecondary)),
                                      child: Padding(
                                        padding: context.paddingNormal,
                                        child: Image.network(
                                          'https://sozluk.gov.tr/assets/img/isaret/${detail?[0].madde?[index]}.gif',
                                        ),
                                      ),
                                    ),
                                  ),
                                  context.emptySizedHeightBoxLow3x,
                                  Text(
                                    detail?[0].madde?[index] ?? '',
                                    style: context.textTheme.headline5?.copyWith(color: context.colorScheme.background),
                                  )
                                ],
                              );
                            },
                          ),
                        )),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class DetailWordList extends StatelessWidget {
  const DetailWordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.lowBorderRadius,
      child: ChangeNotifierProvider.value(
        value: DetailViewModel(DetailService(ProjectNetworkManager.instance.service)),
        builder: (context, child) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: context.watch<DetailViewModel>().detailList?[0].anlamlarListe?.length ?? 1,
            itemBuilder: (context, index) {
              var detail = context.watch<DetailViewModel>().detailList?[0].anlamlarListe?[index];
              final ozellikTamAdi = detail?.ozelliklerListe?.map((e) => e.tamAdi);
              return DetailWordInfoCard(
                anlamSira: detail?.anlamSira ?? '',
                ozellikAdi: ozellikTamAdi?.join(', ') ?? 'isim',
                anlam: detail?.anlam ?? '',
                ornekAdi: detail?.orneklerListe?[0].ornek ?? '',
                yazarAdi: detail?.orneklerListe?[0].yazarId == null
                    ? ''
                    : ' ${detail?.orneklerListe?[0].yazar?[0].tamAdi ?? ''}',
              );
            },
            separatorBuilder: (context, index) {
              return Container(color: context.colorScheme.primary, child: const Divider());
            },
          );
        },
      ),
    );
  }
}
