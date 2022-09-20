import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/compound/view/compound_detail_view.dart';
import 'package:turkce_sozluk/product/widgets/card/detail_word_card.dart';

import '../../../../product/service/project_network_manager.dart';
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
    return ListView(
      padding: context.paddingNormal,
      children: const [
        DetailTop(),
        DetailWordList(),
      ],
    );
  }
}

class DetailWordList extends StatelessWidget {
  const DetailWordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailViewModel(DetailService(ProjectNetworkManager.instance.service)),
      builder: (context, child) {
        var birlesik = context.watch<DetailViewModel>().detailList?[0].birlesikler;
        List<String>? birlesiklerList;
        birlesiklerList = birlesik?.split(',');
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: birlesiklerList?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return DetailWordCard(
              text: birlesiklerList?[index] ?? '',
              onTap: () => context.navigateToPage(const CompoundDetailView()),
            );
          },
        );
      },
    );
  }
}
