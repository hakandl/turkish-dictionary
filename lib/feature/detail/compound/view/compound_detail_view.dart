import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import '../../../../product/constants/enums/string/string_constants.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/widgets/card/snackbar_card.dart';
import '../../../saved/viewmodel/saved_viewmodel.dart';
import '../service/compound_service.dart';
import '../viewmodel/compound_viewmodel.dart';
import '../../../../product/service/project_network_manager.dart';
import '../../../../product/widgets/shimmer/detail_top_view_shimmer.dart';

import '../../../../product/constants/enums/string_enum.dart';
import '../../../../product/constants/enums/svg_enum.dart';
import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/card/word_card.dart';
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
      body: _body(),
    );
  }

  ChangeNotifierProvider<CompoundViewModel> _body() {
    return ChangeNotifierProvider.value(
      value: CompoundViewModel(CompoundService(ProjectNetworkManager.instance.service)),
      builder: (context, child) {
        return Padding(
          padding: context.paddingNormal,
          child: Column(
            children: [
              _CompoundDetailTop(widget: widget),
              _compoundDetailWord(context),
            ],
          ),
        );
      },
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: TurkishDictionaryIconButton(
        onPressed: () => context.pop(),
        child: SvgWidget(icon: SvgNameEnum.left.icon),
      ),
      title: Text(TabBarPageEnum.compound.name.tr()),
    );
  }

  _compoundDetailWord(BuildContext context) {
    return context.watch<CompoundViewModel>().isLoading
        ? const ProverbAndCompoundCardListShimmer()
        : WordCard(
            title: context.watch<CompoundViewModel>().detailList?.firstOrNull?.meaningsList?.firstOrNull?.meaning ??
                TurkishDictionaryStringConstants.empty,
            isRight: false);
  }
}

class _CompoundDetailTop extends StatefulWidget {
  const _CompoundDetailTop({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final CompoundDetailView widget;

  @override
  State<_CompoundDetailTop> createState() => _CompoundDetailTopState();
}

class _CompoundDetailTopState extends State<_CompoundDetailTop> {
  @override
  Widget build(BuildContext context) {
    return context.watch<CompoundViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : DetailTop(
            title: widget.widget.title,
            subtitle: _subtitle(context),
            signLanguageWidget: _signLanguageWidget(context),
            child: _icon(context),
            onVoice: () =>
                context.read<DetailViewModel>().speak(CompoundViewModel.word ?? TurkishDictionaryStringConstants.empty),
            onSaved: () {
              _compoundSavedButton(context);
            },
          );
  }

  String _subtitle(BuildContext context) =>
      '${context.watch<CompoundViewModel>().detailList?.firstOrNull?.pronunciation ?? TurkishDictionaryStringConstants.empty} ${context.watch<CompoundViewModel>().detailList?.firstOrNull?.language ?? TurkishDictionaryStringConstants.empty}';

  SignLanguageListView _signLanguageWidget(BuildContext context) {
    return SignLanguageListView(
      itemCount: context.read<CompoundViewModel>().detailList?.firstOrNull?.word?.length ?? 1,
      word: context.read<CompoundViewModel>().detailList?.firstOrNull?.word ?? TurkishDictionaryStringConstants.empty,
    );
  }

  SvgWidget _icon(BuildContext context) {
    return SvgWidget(
      icon: context.watch<SavedViewModel>().savedWordBox.containsKey(CompoundViewModel.word)
          ? SvgNameEnum.savedSolid.icon
          : SvgNameEnum.saved.icon,
      color: context.colorScheme.onSecondary,
    );
  }

  void _compoundSavedButton(BuildContext context) {
    setState(() {
      if (context.read<SavedViewModel>().savedWordBox.containsKey(CompoundViewModel.word)) {
        context.read<SavedViewModel>().savedWordBox.delete(CompoundViewModel.word);
        ScaffoldMessenger.of(context).showSnackBar(SnackBarCard(context, content: LocaleKeys.info_savedRemove.tr()));
        return;
      }
      context
          .read<SavedViewModel>()
          .savedWordBox
          .put(CompoundViewModel.word, CompoundViewModel.word ?? TurkishDictionaryStringConstants.empty);
      ScaffoldMessenger.of(context).showSnackBar(SnackBarCard(context, content: LocaleKeys.info_savedAdd.tr()));
    });
  }
}
