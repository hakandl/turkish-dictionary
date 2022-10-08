import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/proverb/viewmodel/proverb_viewmodel.dart';
import 'package:turkce_sozluk/product/init/navigator/app_router.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';
import 'package:turkce_sozluk/product/widgets/card/detail_word_card.dart';
import 'package:turkce_sozluk/product/widgets/container/empty_value_view.dart';

import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../service/detail_service.dart';
import '../../view/detail_view.dart';
import '../../viewmodel/detail_viewmodel.dart';

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
          children: [
            DetailTop(onPressed: () => context.read<DetailViewModel>().speak(DetailViewModel.word ?? '')),
            const DetailWordList(),
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
        : context.watch<DetailViewModel>().detailList?[0].proverb?.length == null
            ? const EmptyValueView()
            : detailList(context);
  }

  ListView detailList(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: context.watch<DetailViewModel>().detailList?[0].proverb?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        String word = context.watch<DetailViewModel>().detailList?[0].proverb?[index].word ?? '';
        return proverbCard(word, context);
      },
    );
  }

  DetailWordCard proverbCard(String word, BuildContext context) {
    return DetailWordCard(
      text: word,
      onTap: () {
        ProverbViewModel.word = word;
        context.router.navigate(const ProverbDetailRoute());
      },
    );
  }
}
