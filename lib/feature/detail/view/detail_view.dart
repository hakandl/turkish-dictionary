import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/service/detail_service.dart';
import 'package:turkce_sozluk/feature/detail/viewmodel/detail_viewmodel.dart';
import 'package:turkce_sozluk/feature/search/viewmodel/search_viewmodel.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';
import 'package:turkce_sozluk/product/widgets/modal/bottom_modal_sheet.dart';
import 'package:turkce_sozluk/product/widgets/shimmer/detail_modal_sheet.dart';

import '../../../product/widgets/button/icon_text_button.dart';
import '../../../product/widgets/button/circle_elevated_button.dart';
import '../../../product/widgets/card/detail_word_info_card.dart';
import '../../../product/widgets/shimmer/detail_meanings_list_shimmer.dart';
import '../../../product/widgets/shimmer/detail_top_view_shimmer.dart';
import '../../../product/widgets/svg.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DetailViewModel(DetailService(ProjectNetworkManager.instance.service)),
      child: ListView(
        padding: context.paddingNormal,
        children: const [
          DetailTop(),
          DetailWordList(),
        ],
      ),
    );
  }
}

class DetailTop extends StatelessWidget with TurkceSozlukModalSheet {
  const DetailTop({
    Key? key,
    this.title,
    this.subtitle,
    this.handWidget,
    this.handTitle,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final String? handTitle;
  final Widget? handWidget;

  @override
  Widget build(BuildContext context) {
    return context.watch<DetailViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? context.watch<DetailViewModel>().detailList?[0].madde ?? '',
                style: context.textTheme.headlineLarge?.copyWith(
                  color: context.colorScheme.background,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subtitle ??
                    '${context.watch<DetailViewModel>().detailList?[0].telaffuz ?? ''} ${context.watch<DetailViewModel>().detailList?[0].lisan ?? ''}',
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
                        Expanded(child: modalSheetList()),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
  }

  ChangeNotifierProvider<DetailViewModel> modalSheetList() {
    return ChangeNotifierProvider.value(
      value: DetailViewModel(DetailService(ProjectNetworkManager.instance.service)),
      builder: (context, child) {
        return context.watch<DetailViewModel>().isLoading
            ? const DetailModalSheetShimmer()
            : handWidget ??
                ListView.builder(
                  padding: context.horizontalPaddingMedium,
                  scrollDirection: Axis.horizontal,
                  itemCount: context.read<DetailViewModel>().detailList?[0].madde?.length ?? 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        modalSheetWordImage(context, index),
                        context.emptySizedHeightBoxLow3x,
                        modalSheetListWord(context, index)
                      ],
                    );
                  },
                );
      },
    );
  }

  SizedBox modalSheetWordImage(BuildContext context, int index) {
    return SizedBox(
      height: context.dynamicHeight(0.10),
      child: Card(
        shape: UnderlineInputBorder(borderSide: BorderSide(color: context.colorScheme.onSecondary)),
        child: Padding(
          padding: context.paddingNormal,
          child: Image.network(
            'https://sozluk.gov.tr/assets/img/isaret/${context.watch<DetailViewModel>().detailList?[0].madde?[index].modalStringReplace()}.gif',
          ),
        ),
      ),
    );
  }

  Text modalSheetListWord(BuildContext context, int index) {
    return Text(
      handTitle ?? context.watch<DetailViewModel>().detailList?[0].madde?[index] ?? '',
      style: context.textTheme.headline5?.copyWith(color: context.colorScheme.background),
    );
  }
}

class DetailWordList extends StatelessWidget {
  const DetailWordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<DetailViewModel>().isLoading ? const DetailMeaningsListShimmer() : detailMeaningsList(context);
  }

  ClipRRect detailMeaningsList(BuildContext context) {
    return ClipRRect(
      borderRadius: context.lowBorderRadius,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: context.watch<DetailViewModel>().detailList?[0].anlamlarListe?.length ?? 1,
        itemBuilder: (context, index) {
          final detail = context.watch<DetailViewModel>().detailList?[0].anlamlarListe?[index];
          final ozellikTamAdi = detail?.ozelliklerListe?.map((e) => e.tamAdi);
          final ornekTamAdi = detail?.orneklerListe?.map((e) => e.ornek);
          return DetailWordInfoCard(
            anlamSira: detail?.anlamSira ?? '',
            ozellikAdi: ozellikTamAdi?.join(', ') ?? 'isim',
            anlam: detail?.anlam ?? '',
            ornekAdi: ornekTamAdi?.join('\n') ?? '',
            yazarAdi:
                detail?.orneklerListe?[0].yazarId == null ? '' : ' ${detail?.orneklerListe?[0].yazar?[0].tamAdi ?? ''}',
          );
        },
        separatorBuilder: (context, index) {
          return Container(color: context.colorScheme.primary, child: const Divider());
        },
      ),
    );
  }
}

extension ModalString on String {
  String modalStringReplace() {
    return replaceAll(RegExp("[()']"), '%20')
        .replaceAll(SpecialWordEnum.a.value, SpecialWordEnum.a.name)
        .replaceAll(SpecialWordEnum.ii.value, SpecialWordEnum.i.name)
        .replaceAll(SpecialWordEnum.uu.value, SpecialWordEnum.u.name)
        .toLowerCase();
  }
}
