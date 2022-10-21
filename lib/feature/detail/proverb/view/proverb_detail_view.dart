import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../product/constants/enums/string/string_constants.dart';
import '../../../../product/constants/enums/string_enum.dart';
import '../../../../product/constants/enums/svg_enum.dart';
import '../../../../product/service/project_network_manager.dart';
import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/card/detail_word_card.dart';
import '../../../../product/widgets/list_view/sign_language_list_view.dart';
import '../../../../product/widgets/shimmer/detail_top_view_shimmer.dart';
import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../../../product/widgets/svg.dart';
import '../../../saved/viewmodel/saved_viewmodel.dart';
import '../../view/detail_view.dart';
import '../../viewmodel/detail_viewmodel.dart';
import '../service/proverb_service.dart';
import '../viewmodel/proverb_viewmodel.dart';

class ProverbDetailView extends StatefulWidget {
  const ProverbDetailView({super.key, this.title});

  final String? title;

  @override
  State<ProverbDetailView> createState() => _ProverbDetailViewState();
}

class _ProverbDetailViewState extends State<ProverbDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: ChangeNotifierProvider.value(
        value: ProverbViewModel(ProverbService(ProjectNetworkManager.instance.service)),
        builder: (context, child) {
          return Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                _detailTop(context),
                _proverbDetailWord(context),
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
        child: SvgWidget(icon: SvgNameEnum.left.icon),
      ),
      title: Text(TabBarPageEnum.proverb.name.tr()),
    );
  }

  Widget _detailTop(BuildContext context) {
    return context.watch<ProverbViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : DetailTop(
            title: widget.title,
            subtitle:
                '${context.watch<ProverbViewModel>().detailList?[0].pronunciation ?? TurkceSozlukStringConstants.empty} ${context.watch<ProverbViewModel>().detailList?[0].language ?? TurkceSozlukStringConstants.empty}',
            signLanguageWidget: SignLanguageListView(
              itemCount: context.read<ProverbViewModel>().detailList?[0].word?.length ?? 1,
              word: context.read<ProverbViewModel>().detailList?[0].word ?? TurkceSozlukStringConstants.empty,
            ),
            child: SvgWidget(
              icon: context.read<SavedViewModel>().savedWordBox.containsKey(ProverbViewModel.word)
                  ? SvgNameEnum.savedSolid.icon
                  : SvgNameEnum.saved.icon,
              color: context.colorScheme.onSecondary,
            ),
            onVoice: () =>
                context.read<DetailViewModel>().speak(ProverbViewModel.word ?? TurkceSozlukStringConstants.empty),
            onSaved: () {
              if (context.read<SavedViewModel>().savedWordBox.containsKey(ProverbViewModel.word)) {
                context.read<SavedViewModel>().savedWordBox.delete(ProverbViewModel.word);
                return;
              }
              context.read<SavedViewModel>().savedWordBox.put(ProverbViewModel.word, ProverbViewModel.word ?? '');
            });
  }

  Widget _proverbDetailWord(BuildContext context) {
    return context.watch<ProverbViewModel>().isLoading
        ? const ProverbAndCompoundCardListShimmer()
        : DetailWordCard(
            title: context.watch<ProverbViewModel>().detailList?[0].meaningsList?[0].meaning ??
                TurkceSozlukStringConstants.empty,
            isRight: false);
  }
}
