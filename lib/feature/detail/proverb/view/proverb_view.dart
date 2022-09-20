import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/proverb/view/proverb_detail_view.dart';
import 'package:turkce_sozluk/product/widgets/card/detail_word_card.dart';

import '../../../../product/service/project_network_manager.dart';
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
          var atasozu = context.watch<DetailViewModel>().detailList?[0].atasozu;
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: atasozu?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return DetailWordCard(
                text: atasozu?[index].madde ?? '',
                onTap: () => context.navigateToPage(const ProverbDetailView()),
              );
            },
          );
        });
  }
}
