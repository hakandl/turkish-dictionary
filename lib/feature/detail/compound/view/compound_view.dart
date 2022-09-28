import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/compound/view/compound_detail_view.dart';
import 'package:turkce_sozluk/feature/detail/compound/viewmodel/compound_viewmodel.dart';
import 'package:turkce_sozluk/product/widgets/card/detail_word_card.dart';

import '../../../../product/service/project_network_manager.dart';
import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../service/detail_service.dart';
import '../../view/detail_view.dart';
import '../../viewmodel/detail_viewmodel.dart';

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
      child: ListView(
        padding: context.paddingNormal,
        children: [
          DetailTop(
            subtitle:
                '${context.watch<DetailViewModel>().detailList?[0].telaffuz ?? ''} ${context.watch<DetailViewModel>().detailList?[0].lisan ?? ''}',
          ),
          const DetailWordList(),
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
            itemCount: context.watch<DetailViewModel>().detailList?[0].birlesiklerList?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              String madde = context.watch<DetailViewModel>().detailList?[0].birlesiklerList?[index].trim() ?? '';
              return DetailWordCard(
                  text: madde,
                  onTap: () {
                    CompoundViewModel.word = madde;
                    context.navigateToPage(
                      const CompoundDetailView(),
                    );
                  });
            },
          );
  }
}
