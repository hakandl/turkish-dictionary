import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/compound/service/compound_service.dart';
import 'package:turkce_sozluk/feature/detail/compound/viewmodel/compound_viewmodel.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';
import 'package:turkce_sozluk/product/widgets/shimmer/detail_top_view_shimmer.dart';

import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/card/detail_word_card.dart';
import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../../../product/widgets/svg.dart';
import '../../view/detail_view.dart';
import '../../view/tabbar/detail_tabbar_view.dart';
import '../../viewmodel/detail_viewmodel.dart';

class CompoundDetailView extends StatefulWidget {
  const CompoundDetailView({super.key});

  @override
  State<CompoundDetailView> createState() => _CompoundDetailViewState();
}

class _CompoundDetailViewState extends State<CompoundDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: TurkceSozlukIconButton(
            onPressed: () => Navigator.pop(context),
            child: SvgWidget(
              icon: IconNameEnum.left.value,
              color: context.colorScheme.background,
            ),
          ),
          title: Text(TabBarPageEnum.compound.name),
        ),
        body: ChangeNotifierProvider.value(
          value: CompoundViewModel(CompoundService(ProjectNetworkManager.instance.service)),
          builder: (context, child) {
            return Padding(
              padding: context.paddingNormal,
              child: Column(
                children: [
                  context.watch<CompoundViewModel>().isLoading
                      ? const DetailTopViewShimmer()
                      : DetailTop(
                          title: context.watch<CompoundViewModel>().detailList?[0].madde ?? '',
                          subtitle:
                              '${context.watch<CompoundViewModel>().detailList?[0].telaffuz ?? ''} ${context.watch<CompoundViewModel>().detailList?[0].lisan ?? ''}',
                          handWidget: ChangeNotifierProvider.value(
                            value: CompoundViewModel(CompoundService(ProjectNetworkManager.instance.service)),
                            child: ListView.builder(
                              padding: context.horizontalPaddingMedium,
                              scrollDirection: Axis.horizontal,
                              itemCount: context.read<CompoundViewModel>().detailList?[0].madde?.length ?? 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: context.dynamicHeight(0.10),
                                      child: Card(
                                        shape: UnderlineInputBorder(
                                            borderSide: BorderSide(color: context.colorScheme.onSecondary)),
                                        child: Padding(
                                          padding: context.paddingNormal,
                                          child: Image.network(
                                            'https://sozluk.gov.tr/assets/img/isaret/${context.watch<CompoundViewModel>().detailList?[0].madde?[index].modalStringReplace()}.gif',
                                          ),
                                        ),
                                      ),
                                    ),
                                    context.emptySizedHeightBoxLow3x,
                                    Text(
                                      context.watch<CompoundViewModel>().detailList?[0].madde?[index] ?? '',
                                      style:
                                          context.textTheme.headline5?.copyWith(color: context.colorScheme.background),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                  context.watch<DetailViewModel>().isLoading
                      ? const ProverbAndCompoundCardListShimmer()
                      : DetailWordCard(
                          text: context.watch<CompoundViewModel>().detailList?[0].anlamlarListe?[0].anlam ?? '',
                          isRight: false),
                ],
              ),
            );
          },
        ));
  }
}
