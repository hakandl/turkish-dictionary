import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/proverb/view/proverb_detail_view.dart';
import 'package:turkce_sozluk/feature/detail/proverb/viewmodel/proverb_viewmodel.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';
import 'package:turkce_sozluk/product/widgets/card/detail_word_card.dart';

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
      child: ListView(
        padding: context.paddingNormal,
        children: const [
          DetailTop(),
          DetailWordList(),
        ],
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
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: context.watch<DetailViewModel>().detailList?[0].atasozu?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              String madde = context.watch<DetailViewModel>().detailList?[0].atasozu?[index].madde ?? '';
              return DetailWordCard(
                  text: madde,
                  onTap: () {
                    ProverbViewModel.word = madde;
                    context.navigateToPage(
                      const ProverbDetailView(),
                    );
                  });
            },
          );
  }
}
