import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';
import '../../../../product/constants/enums/string/string_constants.dart';
import '../viewmodel/compound_viewmodel.dart';
import '../../../../product/widgets/card/word_card.dart';
import '../../../../product/widgets/container/icon_text_info_widget.dart';
import '../../../../product/widgets/container/open_container.dart';

import '../../../../product/service/project_network_manager.dart';
import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../service/detail_service.dart';
import '../../view/detail_view.dart';
import '../../viewmodel/detail_viewmodel.dart';
import 'compound_detail_view.dart';

class CompoundView extends StatefulWidget {
  const CompoundView({super.key});

  @override
  State<CompoundView> createState() => _CompoundViewState();
}

class _CompoundViewState extends State<CompoundView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DetailViewModel(DetailService(ProjectNetworkManager.instance.service)),
      child: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          children: const [
            DetailTop(),
            _CompoundWordList(),
          ],
        ),
      ),
    );
  }
}

class _CompoundWordList extends StatelessWidget {
  const _CompoundWordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<DetailViewModel>().isLoading
        ? const ProverbAndCompoundCardListShimmer()
        : context.watch<DetailViewModel>().detailList?.firstOrNull?.compound?.length == null
            ? IconAndTextInfoWidget(
                text: '${DetailViewModel.word} ${LocaleKeys.detail_detailViews_detailTitle_compoundWord_nothing.tr()}',
              )
            : _compoundList(context);
  }

  ListView _compoundList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.watch<DetailViewModel>().detailList?.firstOrNull?.compoundList?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        String word = context.watch<DetailViewModel>().detailList?.firstOrNull?.compoundList?[index].trim() ??
            TurkceSozlukStringConstants.empty;
        return _compoundCard(word, context);
      },
    );
  }

  Widget _compoundCard(String word, BuildContext context) {
    return OpenContainerWidget(
      openBuilder: (BuildContext _, VoidCallback openContainer) {
        return CompoundDetailView(
          title: CompoundViewModel.word = word,
        );
      },
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return WordCard(title: word, onTap: openContainer);
      },
    );
  }
}
