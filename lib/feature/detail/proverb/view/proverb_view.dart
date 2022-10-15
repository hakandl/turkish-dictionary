import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'proverb_detail_view.dart';
import '../../../../product/service/project_network_manager.dart';
import '../../../../product/widgets/card/detail_word_card.dart';
import '../../../../product/widgets/container/empty_value_view.dart';

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

  Widget proverbCard(String word, BuildContext context) {
    return OpenContainerWidget(
      openBuilder: (BuildContext context, VoidCallback openContainer) {
        return ProverbDetailView(
          title: ProverbViewModel.word = word,
        );
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return DetailWordCard(text: word, onTap: openContainer);
      },
    );
  }
}


/* 
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return DetailWordCard(text: word, onTap: openContainer);
      },  */



/* OpenContainer(
        closedElevation: context.colorScheme.primary.opacity,
        openColor: context.colorScheme.primary,
        closedColor: context.colorScheme.primary,
        closedShape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
        closedBuilder: (context, VoidCallback action) {
          return Card(
            margin: EdgeInsets.zero,
            child: SizedBox(
              width: context.dynamicWidth(SizeEnum.zNine.value),
              height: SizeEnum.fifty.value,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: context.horizontalPaddingNormal,
                    child: SvgWidget(
                      icon: SvgNameEnum.search.icon,
                      color: context.colorScheme.background,
                    ),
                  ),
                  Text(
                    LocaleKeys.search_searchInTurkishDictionary.tr(),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colorScheme.background,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
          );
        },
        openBuilder: (context, action) => const SearchView()); */