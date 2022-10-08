import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/service/detail_service.dart';
import 'package:turkce_sozluk/feature/detail/viewmodel/detail_viewmodel.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';
import 'package:turkce_sozluk/product/widgets/modal/bottom_modal_sheet.dart';
import 'package:turkce_sozluk/product/widgets/shimmer/detail_modal_sheet.dart';

import '../../../product/widgets/button/icon_text_button.dart';
import '../../../product/widgets/button/circle_elevated_button.dart';
import '../../../product/widgets/card/detail_word_info_card.dart';
import '../../../product/widgets/list_view/sign_language_list_view.dart';
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
        children: [
          DetailTop(
            onPressed: () => context.read<DetailViewModel>().speak(DetailViewModel.word ?? ''),
          ),
          const DetailWordList(),
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
    this.signLanguageWidget,
    this.handTitle,
    this.onPressed,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final String? handTitle;
  final VoidCallback? onPressed;
  final Widget? signLanguageWidget;

  @override
  Widget build(BuildContext context) {
    return context.watch<DetailViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? context.watch<DetailViewModel>().detailList?[0].word ?? '',
                style: context.textTheme.headlineLarge?.copyWith(
                  color: context.colorScheme.background,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subtitle ??
                    '${context.watch<DetailViewModel>().detailList?[0].pronunciation ?? ''} ${context.watch<DetailViewModel>().detailList?[0].language ?? ''}',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: context.verticalPaddingMedium,
                child: Row(
                  children: [
                    TurkceSozlukCircleElevatedButton(
                      onPressed: onPressed,
                      child: SvgWidget(
                        icon: IconNameEnum.voice.value,
                        color: context.colorScheme.onSecondary,
                      ),
                    ),
                    const Spacer(),
                    TurkceSozlukIconTextButton(
                      text: LocaleKeys.button_turkishSignLanguage.tr(),
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
            : signLanguageWidget ??
                SignLanguageListView(
                  itemCount: context.read<DetailViewModel>().detailList?[0].word?.length ?? 1,
                  word: context.read<DetailViewModel>().detailList?[0].word ?? '',
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
    return context.watch<DetailViewModel>().isLoading ? const DetailMeaningsListShimmer() : detailMeaningsList(context);
  }

  ClipRRect detailMeaningsList(BuildContext context) {
    return ClipRRect(
      borderRadius: context.lowBorderRadius,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: context.watch<DetailViewModel>().detailList?[0].meaningsList?.length ?? 1,
        itemBuilder: (context, index) {
          final detail = context.watch<DetailViewModel>().detailList?[0].meaningsList?[index];
          final featuresFullName = detail?.featuresList?.map((e) => e.fullName);
          final exampleFullName = detail?.examplesList?.map((e) => e.example);
          return DetailWordInfoCard(
            anlamSira: detail?.orderMeaning ?? '',
            ozellikAdi: featuresFullName?.join(', ') ?? 'isim',
            anlam: detail?.meaning ?? '',
            ornekAdi: exampleFullName?.join('\n') ?? '',
            yazarAdi: detail?.examplesList?[0].authorId == null
                ? ''
                : ' ${detail?.examplesList?[0].author?[0].fullName ?? ''}',
          );
        },
        separatorBuilder: (context, index) {
          return Container(color: context.colorScheme.primary, child: const Divider());
        },
      ),
    );
  }
}
