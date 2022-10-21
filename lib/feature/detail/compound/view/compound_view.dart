import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';
import '../../../../product/constants/enums/string/string_constants.dart';
import '../../../saved/viewmodel/saved_viewmodel.dart';
import '../viewmodel/compound_viewmodel.dart';
import '../../../../product/widgets/card/detail_word_card.dart';
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
            DetailWordList(),
          ],
        ),
      ),
    );
  }
}

class DetailWordList extends StatelessWidget {
  const DetailWordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<DetailViewModel>().isLoading
        ? const ProverbAndCompoundCardListShimmer()
        : context.watch<DetailViewModel>().detailList?[0].compound?.length == null
            ? IconAndTextInfoWidget(
                text: '${DetailViewModel.word} ${LocaleKeys.detail_detailViews_detailTitle_compoundWord_nothing.tr()}',
              )
            : compoundList(context);
  }

  ListView compoundList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.watch<DetailViewModel>().detailList?[0].compoundList?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        String word = context.watch<DetailViewModel>().detailList?[0].compoundList?[index].trim() ??
            TurkceSozlukStringConstants.empty;
        return compoundCard(word, context);
      },
    );
  }

  Widget compoundCard(String word, BuildContext context) {
    return OpenContainerWidget(
      openBuilder: (BuildContext _, VoidCallback openContainer) {
        return CompoundDetailView(
          title: CompoundViewModel.word = word,
        );
      },
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return DetailWordCard(title: word, onTap: openContainer);
      },
    );
  }
}
