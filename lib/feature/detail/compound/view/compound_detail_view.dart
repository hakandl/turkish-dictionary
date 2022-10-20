import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/constants/enums/string/string_constants.dart';
import '../../../saved/viewmodel/saved_viewmodel.dart';
import '../service/compound_service.dart';
import '../viewmodel/compound_viewmodel.dart';
import '../../../../product/service/project_network_manager.dart';
import '../../../../product/widgets/shimmer/detail_top_view_shimmer.dart';

import '../../../../product/constants/enums/string_enum.dart';
import '../../../../product/constants/enums/svg_enum.dart';
import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/card/detail_word_card.dart';
import '../../../../product/widgets/list_view/sign_language_list_view.dart';
import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../../../product/widgets/svg.dart';
import '../../view/detail_view.dart';
import '../../viewmodel/detail_viewmodel.dart';

class CompoundDetailView extends StatefulWidget {
  const CompoundDetailView({super.key, this.title});
  final String? title;

  @override
  State<CompoundDetailView> createState() => _CompoundDetailViewState();
}

class _CompoundDetailViewState extends State<CompoundDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: ChangeNotifierProvider.value(
        value: CompoundViewModel(CompoundService(ProjectNetworkManager.instance.service)),
        builder: (context, child) {
          return Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                _detailTop(context),
                _compoundDetailWord(context),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: TurkceSozlukIconButton(
        onPressed: () => Navigator.pop(context),
        child: SvgWidget(
          icon: SvgNameEnum.left.icon,
          color: context.colorScheme.background,
        ),
      ),
      title: Text(TabBarPageEnum.compound.name.tr()),
    );
  }

  _detailTop(BuildContext context) {
    return context.watch<CompoundViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : DetailTop(
            title: widget.title,
            subtitle:
                '${context.watch<CompoundViewModel>().detailList?[0].pronunciation ?? TurkceSozlukStringConstants.empty} ${context.watch<CompoundViewModel>().detailList?[0].language ?? TurkceSozlukStringConstants.empty}',
            signLanguageWidget: SignLanguageListView(
              itemCount: context.read<CompoundViewModel>().detailList?[0].word?.length ?? 1,
              word: context.read<CompoundViewModel>().detailList?[0].word ?? TurkceSozlukStringConstants.empty,
            ),
            onVoice: () =>
                context.read<DetailViewModel>().speak(CompoundViewModel.word ?? TurkceSozlukStringConstants.empty),
            onFav: () {
              if (context.read<SavedViewModel>().savedWordBox.containsKey(CompoundViewModel.word)) {
                context.read<SavedViewModel>().savedWordBox.delete(CompoundViewModel.word);
                return;
              }
              context.read<SavedViewModel>().savedWordBox.put(CompoundViewModel.word, CompoundViewModel.word ?? '');
            },
          );
  }

  _compoundDetailWord(BuildContext context) {
    return context.watch<CompoundViewModel>().isLoading
        ? const ProverbAndCompoundCardListShimmer()
        : DetailWordCard(
            title: context.watch<CompoundViewModel>().detailList?[0].meaningsList?[0].meaning ??
                TurkceSozlukStringConstants.empty,
            isRight: false);
  }
}
