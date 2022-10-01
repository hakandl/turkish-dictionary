import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/proverb/service/proverb_service.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';

import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/card/detail_word_card.dart';
import '../../../../product/widgets/list_view/sign_language_list_view.dart';
import '../../../../product/widgets/shimmer/detail_top_view_shimmer.dart';
import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../../../product/widgets/svg.dart';
import '../../view/detail_view.dart';
import '../../view/tabbar/detail_tabbar_view.dart';
import '../../viewmodel/detail_viewmodel.dart';
import '../viewmodel/proverb_viewmodel.dart';

class ProverbDetailView extends StatefulWidget {
  const ProverbDetailView({super.key});

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
        child: SvgWidget(
          icon: IconNameEnum.left.value,
          color: context.colorScheme.background,
        ),
      ),
      title: Text(TabBarPageEnum.proverb.name),
    );
  }

  _detailTop(BuildContext context) {
    return context.watch<ProverbViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : DetailTop(
            title: context.watch<ProverbViewModel>().detailList?[0].word ?? '',
            subtitle:
                '${context.watch<ProverbViewModel>().detailList?[0].pronunciation ?? ''} ${context.watch<ProverbViewModel>().detailList?[0].language ?? ''}',
            onPressed: () => context.read<DetailViewModel>().speak(ProverbViewModel.word ?? ''),
            handWidget: SignLanguageListView(
              itemCount: context.read<ProverbViewModel>().detailList?[0].word?.length ?? 1,
              word: context.read<ProverbViewModel>().detailList?[0].word ?? '',
            ),
          );
  }

  _proverbDetailWord(BuildContext context) {
    return context.watch<ProverbViewModel>().isLoading
        ? const ProverbAndCompoundCardListShimmer()
        : DetailWordCard(
            text: context.watch<ProverbViewModel>().detailList?[0].meaningsList?[0].meaning ?? '', isRight: false);
  }
}
