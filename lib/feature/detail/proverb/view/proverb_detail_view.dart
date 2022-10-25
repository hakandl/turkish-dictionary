import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/widgets/card/snackbar_card.dart';

import '../../../../product/constants/enums/string/string_constants.dart';
import '../../../../product/constants/enums/string_enum.dart';
import '../../../../product/constants/enums/svg_enum.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/service/project_network_manager.dart';
import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/card/word_card.dart';
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
      body: _body(),
    );
  }

  ChangeNotifierProvider<ProverbViewModel> _body() {
    return ChangeNotifierProvider.value(
      value: ProverbViewModel(ProverbService(ProjectNetworkManager.instance.service)),
      builder: (context, child) {
        return Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              _ProverbDetailTop(widget: widget),
              _proverbDetailWord(context),
            ],
          ),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: TurkceSozlukIconButton(
        onPressed: () => context.pop(),
        child: SvgWidget(icon: SvgNameEnum.left.icon),
      ),
      title: Text(TabBarPageEnum.proverb.name.tr()),
    );
  }

  Widget _proverbDetailWord(BuildContext context) {
    return context.watch<ProverbViewModel>().isLoading
        ? const ProverbAndCompoundCardListShimmer()
        : WordCard(
            title: context.watch<ProverbViewModel>().detailList?.firstOrNull?.meaningsList?.firstOrNull?.meaning ??
                TurkceSozlukStringConstants.empty,
            isRight: false);
  }
}

class _ProverbDetailTop extends StatefulWidget {
  const _ProverbDetailTop({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProverbDetailView widget;

  @override
  State<_ProverbDetailTop> createState() => _ProverbDetailTopState();
}

class _ProverbDetailTopState extends State<_ProverbDetailTop> {
  @override
  Widget build(BuildContext context) {
    return context.watch<ProverbViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : DetailTop(
            title: widget.widget.title,
            subtitle: _subtitle(context),
            signLanguageWidget: _signLanguageWidget(context),
            child: _icon(context),
            onVoice: () =>
                context.read<DetailViewModel>().speak(ProverbViewModel.word ?? TurkceSozlukStringConstants.empty),
            onSaved: () {
              _proverbSavedButton(context);
            },
          );
  }

  String _subtitle(BuildContext context) =>
      '${context.watch<ProverbViewModel>().detailList?.firstOrNull?.pronunciation ?? TurkceSozlukStringConstants.empty} ${context.watch<ProverbViewModel>().detailList?.firstOrNull?.language ?? TurkceSozlukStringConstants.empty}';

  SignLanguageListView _signLanguageWidget(BuildContext context) {
    return SignLanguageListView(
      itemCount: context.read<ProverbViewModel>().detailList?.firstOrNull?.word?.length ?? 1,
      word: context.read<ProverbViewModel>().detailList?.firstOrNull?.word ?? TurkceSozlukStringConstants.empty,
    );
  }

  SvgWidget _icon(BuildContext context) {
    return SvgWidget(
      icon: context.watch<SavedViewModel>().savedWordBox.containsKey(ProverbViewModel.word)
          ? SvgNameEnum.savedSolid.icon
          : SvgNameEnum.saved.icon,
      color: context.colorScheme.onSecondary,
    );
  }

  void _proverbSavedButton(BuildContext context) {
    setState(() {
      if (context.read<SavedViewModel>().savedWordBox.containsKey(ProverbViewModel.word)) {
        context.read<SavedViewModel>().savedWordBox.delete(ProverbViewModel.word);
        ScaffoldMessenger.of(context).showSnackBar(SnackBarCard(context, content: LocaleKeys.info_savedRemove.tr()));
        return;
      }
      context
          .read<SavedViewModel>()
          .savedWordBox
          .put(ProverbViewModel.word, ProverbViewModel.word ?? TurkceSozlukStringConstants.empty);
      ScaffoldMessenger.of(context).showSnackBar(SnackBarCard(context, content: LocaleKeys.info_savedAdd.tr()));
    });
  }
}
