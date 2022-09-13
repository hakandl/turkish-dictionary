import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turkce_sozluk/product/widgets/card/home_info_card.dart';

import '../../../core/base/view/base_view.dart';
import '../../../product/widgets/bg.dart';
import '../../../product/widgets/svg.dart';
import 'package:kartal/kartal.dart';

import '../../search/view/search_view.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: HomeViewModel(),
      onPageBuilder: (context, value) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.red,
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.grey.shade50,
                  height: context.dynamicHeight(0.35),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        bottom: 26,
                        child: Background(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                right: 0,
                                top: 0,
                                child: IconButton(onPressed: () {}, icon: const SvgWidget(icon: 'ic_more')),
                              ),
                              const SvgWidget(
                                icon: 'ic_logo',
                                height: 40,
                                width: 85,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: OpenContainer(
                          closedElevation: 5,
                          closedShape: RoundedRectangleBorder(borderRadius: context.lowBorderRadius),
                          transitionDuration: context.durationLow,
                          transitionType: ContainerTransitionType.fade,
                          closedBuilder: (context, VoidCallback action) {
                            return Container(
                              color: Colors.white,
                              width: context.dynamicWidth(.9),
                              height: 50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: context.paddingNormal,
                                    child: const SvgWidget(
                                      icon: 'ic_search',
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text(
                                    'Türkçe Sözlükte Ara',
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          openBuilder: (context, action) {
                            return const SearchView();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: wordAndProverb(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Container wordAndProverb(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: context.onlyTopPaddingNormal.top,
      ),
      padding: EdgeInsets.only(
        left: context.onlyLeftPaddingNormal.left,
        right: context.onlyRightPaddingNormal.right,
      ),
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          homeInfoCardTitle(context, 'data'),
          const Center(child: HomeInfoCard()),
          homeInfoCardTitle(context, 'data'),
          const Center(child: HomeInfoCard()),
        ],
      ),
    );
  }

  Container homeInfoCardTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.only(
        top: context.onlyTopPaddingMedium.top,
        bottom: context.onlyBottomPaddingLow.bottom,
        left: context.onlyLeftPaddingLow.left,
      ),
      child: Text(
        title,
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
