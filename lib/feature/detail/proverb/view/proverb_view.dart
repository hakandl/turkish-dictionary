import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/product/init/language/locale_keys.g.dart';
import '../../../../product/constants/enums/string/string_constants.dart';
import 'proverb_detail_view.dart';
import '../../../../product/service/project_network_manager.dart';
import '../../../../product/widgets/card/word_card.dart';
import '../../../../product/widgets/container/icon_text_info_widget.dart';

import '../../../../product/widgets/container/open_container.dart';
import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../service/detail_service.dart';
import '../../view/detail_view.dart';
import '../../viewmodel/detail_viewmodel.dart';
import '../viewmodel/proverb_viewmodel.dart';

class ProverbView extends StatefulWidget {
  const ProverbView({super.key});

  @override
  State<ProverbView> createState() => _ProverbViewState();
}

class _ProverbViewState extends State<ProverbView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: DetailViewModel(DetailService(ProjectNetworkManager.instance.service)),
      child: SingleChildScrollView(
        padding: context.paddingNormal,
        child: Column(
          children: const [
            DetailTop(),
            _ProverbWordList(),
          ],
        ),
      ),
    );
  }
}

class _ProverbWordList extends StatelessWidget {
  const _ProverbWordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<DetailViewModel>().isLoading
        ? const ProverbAndCompoundCardListShimmer()
        : context.watch<DetailViewModel>().detailList?[0].proverb?.length == null
            ? IconAndTextInfoWidget(
                text:
                    '${DetailViewModel.word} ${LocaleKeys.detail_detailViews_detailTitle_proverbAndIdioms_nothing.tr()}',
              )
            : _proverbList(context);
  }

  ListView _proverbList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.watch<DetailViewModel>().detailList?[0].proverb?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        String word =
            context.watch<DetailViewModel>().detailList?[0].proverb?[index].word ?? TurkceSozlukStringConstants.empty;
        return _proverbCard(word, context);
      },
    );
  }

  Widget _proverbCard(String word, BuildContext context) {
    return OpenContainerWidget(
      openBuilder: (BuildContext context, VoidCallback openContainer) {
        return ProverbDetailView(
          title: ProverbViewModel.word = word,
        );
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return WordCard(title: word, onTap: openContainer);
      },
    );
  }
}
