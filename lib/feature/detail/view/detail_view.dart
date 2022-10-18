import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/model/detail_model.dart';
import 'package:turkce_sozluk/product/constants/enums/size_enum.dart';
import 'package:turkce_sozluk/product/constants/enums/string/string_constants.dart';
import '../../../product/widgets/card/detail_word_info_card.dart';
import '../../favorites/viewmodel/favorites_viewmodel.dart';
import '../service/detail_service.dart';
import '../viewmodel/detail_viewmodel.dart';
import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/service/project_network_manager.dart';
import '../../../product/widgets/modal/bottom_modal_sheet.dart';
import '../../../product/widgets/shimmer/detail_modal_sheet.dart';

import '../../../product/constants/enums/svg_enum.dart';
import '../../../product/widgets/button/icon_text_button.dart';
import '../../../product/widgets/button/circle_elevated_button.dart';
import '../../../product/widgets/list_view/sign_language_list_view.dart';
import '../../../product/widgets/shimmer/detail_meanings_list_shimmer.dart';
import '../../../product/widgets/shimmer/detail_top_view_shimmer.dart';
import '../../../product/widgets/svg.dart';

part '../module/widgets/detail_list.dart';

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
      child: SingleChildScrollView(
          padding: context.paddingNormal,
          child: Column(
            children: [
              DetailTop(
                onVoice: () =>
                    context.read<DetailViewModel>().speak(DetailViewModel.word ?? TurkceSozlukStringConstants.empty),
                onFav: () {
                  if (context.read<FavoritesViewModel>().favoriteWordBox.containsKey(DetailViewModel.word)) {
                    context.read<FavoritesViewModel>().favoriteWordBox.delete(DetailViewModel.word);
                    return;
                  }
                  context
                      .read<FavoritesViewModel>()
                      .favoriteWordBox
                      .put(DetailViewModel.word, DetailViewModel.word ?? '');
                },
              ),
              const DetailWordList(),
            ],
          )),
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
    this.onVoice,
    this.onFav,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final String? handTitle;
  final VoidCallback? onVoice;
  final VoidCallback? onFav;
  final Widget? signLanguageWidget;

  @override
  Widget build(BuildContext context) {
    return context.watch<DetailViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? context.watch<DetailViewModel>().detailList?[0].word ?? TurkceSozlukStringConstants.empty,
                style: context.textTheme.headlineLarge?.copyWith(
                  color: context.colorScheme.background,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                subtitle ??
                    '${context.watch<DetailViewModel>().detailList?[0].pronunciation ?? TurkceSozlukStringConstants.empty} ${context.watch<DetailViewModel>().detailList?[0].language ?? TurkceSozlukStringConstants.empty}',
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: context.verticalPaddingNormal,
                child: Row(
                  children: [
                    _voiceButton(context),
                    context.emptySizedWidthBoxLow3x,
                    _favButton(context),
                    const Spacer(),
                    _signLanguageButton(context),
                  ],
                ),
              ),
            ],
          );
  }

  TurkceSozlukCircleElevatedButton _voiceButton(BuildContext context) {
    return TurkceSozlukCircleElevatedButton(
      onPressed: onVoice,
      child: SvgWidget(
        icon: SvgNameEnum.voice.icon,
        color: context.colorScheme.onSecondary,
      ),
    );
  }

  TurkceSozlukCircleElevatedButton _favButton(BuildContext context) {
    return TurkceSozlukCircleElevatedButton(
      onPressed: onFav,
      child: SvgWidget(
        icon: SvgNameEnum.fav.icon,
        color: context.colorScheme.onSecondary,
      ),
    );
  }

  TurkceSozlukIconTextButton _signLanguageButton(BuildContext context) {
    return TurkceSozlukIconTextButton(
      text: LocaleKeys.button_turkishSignLanguage.tr(),
      textStyle: TextStyle(color: context.colorScheme.onSecondary),
      icon: SvgWidget(
        icon: SvgNameEnum.hand.icon,
        color: context.colorScheme.onSecondary,
      ),
      onPressed: () => showTurkceSozlukModalSheet(
        context,
        Expanded(child: modalSheetList()),
      ),
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
                  word: context.read<DetailViewModel>().detailList?[0].word ?? TurkceSozlukStringConstants.empty,
                );
      },
    );
  }
}
