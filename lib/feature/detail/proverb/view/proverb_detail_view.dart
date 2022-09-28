import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/proverb/service/proverb_service.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';

import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/card/detail_word_card.dart';
import '../../../../product/widgets/shimmer/detail_top_view_shimmer.dart';
import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../../../product/widgets/svg.dart';
import '../../view/detail_view.dart';
import '../../view/tabbar/detail_tabbar_view.dart';
import '../viewmodel/proverb_viewmodel.dart';

class ProverbDetailView extends StatefulWidget {
  const ProverbDetailView({super.key});

  @override
  State<ProverbDetailView> createState() => _ProverbDetailViewState();
}

class _ProverbDetailViewState extends State<ProverbDetailView> {
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
        title: Text(TabBarPageEnum.proverb.name),
      ),
      body: ChangeNotifierProvider.value(
        value: ProverbViewModel(ProverbService(ProjectNetworkManager.instance.service)),
        builder: (context, child) {
          return Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                context.watch<ProverbViewModel>().isLoading
                    ? const DetailTopViewShimmer()
                    : DetailTop(
                        title: context.watch<ProverbViewModel>().detailList?[0].madde ?? '',
                        subtitle:
                            '${context.watch<ProverbViewModel>().detailList?[0].telaffuz ?? ''} ${context.watch<ProverbViewModel>().detailList?[0].lisan ?? ''}',
                        handWidget: ChangeNotifierProvider.value(
                          value: ProverbViewModel(ProverbService(ProjectNetworkManager.instance.service)),
                          child: ListView.builder(
                            padding: context.horizontalPaddingMedium,
                            scrollDirection: Axis.horizontal,
                            itemCount: context.read<ProverbViewModel>().detailList?[0].madde?.length ?? 1,
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
                                          'https://sozluk.gov.tr/assets/img/isaret/${context.watch<ProverbViewModel>().detailList?[0].madde?[index].modalStringReplace()}.gif',
                                        ),
                                      ),
                                    ),
                                  ),
                                  context.emptySizedHeightBoxLow3x,
                                  Text(
                                    context.watch<ProverbViewModel>().detailList?[0].madde?[index] ?? '',
                                    style: context.textTheme.headline5?.copyWith(color: context.colorScheme.background),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                context.watch<ProverbViewModel>().isLoading
                    ? const ProverbAndCompoundCardListShimmer()
                    : DetailWordCard(
                        text: context.watch<ProverbViewModel>().detailList?[0].anlamlarListe?[0].anlam ?? '',
                        isRight: false),
              ],
            ),
          );
        },
      ),
    );
  }
}
